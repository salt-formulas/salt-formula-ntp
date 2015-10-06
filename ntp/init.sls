
include:
{% if pillar.ntp.client is defined %}
- ntp.client
{% endif %}
{% if pillar.ntp.server is defined %}
- ntp.server
{% endif %}
