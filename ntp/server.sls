{% from "ntp/map.jinja" import server with context %}

{%- if server.enabled %}

{%- if grains.os_family == 'Arch' %}

ntp_remove_packages:
  pkg.removed:
  - names:
    - openntpd
  - require_in:
    - pkg: ntp_packages

{%- endif %}

ntp_packages:
  pkg.installed:
  - name: ntp

{%- if grains.os_family == "RedHat" %}

ntp_client_group_and_user:
  group.present:
  - name: ntp
  - require:
    - pkg: ntp_packages
  user.present:
  - name: ntp
  - shell: /sbin/nologin
  - home: /etc/ntp
  - groups:
    - ntp
  - require:
    - group: ntp
  - require_in:
    - file: /etc/ntp.conf

{%- endif %}

{%- if server.get('auth', {}).get('enabled', False) %}

ntp_keys_server:
  file.managed:
  - name: /etc/ntp.keys
  - source: salt://ntp/files/ntp.keys
  - user: root
  - group: root
  - mode: 600
  - template: jinja
  - require:
    - pkg: ntp_packages
  - watch_in:
    - ntp_service

{%- endif %}

/etc/ntp.conf:
  file.managed:
  - source: salt://ntp/files/ntp.conf
  - template: jinja
  - require:
    - pkg: ntp_packages

ntp_service:
  service.running:
  - enable: true
  - name: {{ server.service }}
  - watch:
    - file: /etc/ntp.conf

{%- if server.get('remove_dhcp_conf', False) %}
ntp_remove_dhcp_conf:
 file.absent:
 - name: /var/lib/ntp/ntp.conf.dhcp
 - watch_in:
   - service: ntp_service
 - require_in:
   - file: /etc/ntp.conf
{%- endif %}

{%- endif %}


