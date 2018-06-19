=====
Usage
=====

The Network Time Protocol (NTP) formula is used to properly synchronize
services across the nodes. This file provides the sample configurations for
different use cases.

* [Deprecated] NTP client configuration, should not be used if the ``stratum``
  parameter exists:

  .. code-block:: yaml

      ntp:
        client:
          enabled: true
          strata:
          - ntp.cesnet.cz
          - ntp.nic.cz

* The NTP client extended definition with auth:

  .. code-block:: yaml

      ntp:
        client:
          enabled: true
          stratum:
            primary:
              server: ntp.cesnet.cz
              key_id: 1
            secondary:
              server: ntp.nic.cz
              key_id: 2

* The NTP client with MD5 auth configuration:

  .. code-block:: yaml

      ntp:
        client:
          enabled: true
          auth:
            enabled: true
            secrets:
              1:
                secret_type: 'M'
                secret: 'Runrabbitrundigthath'
                trustedkey: true
              2:
                secret_type: 'M'
                secret: 'Howiwishyouwereherew'
                trustedkey: true
          stratum:
            primary:
              server: ntp.cesnet.cz
              key_id: 1
            secondary:
              server: ntp.nic.cz
              key_id: 2

* The NTP server with MD5 auth configuration:

  .. code-block:: yaml

      ntp:
        client:
          enabled: false
        server:
          enabled: true
          auth:
            enabled: true
            secrets:
              1:
                secret_type: 'M'
                secret: 'Runrabbitrundigthath'
                trustedkey: true
              2:
                secret_type: 'M'
                secret: 'Howiwishyouwereherew'
                trustedkey: true
          stratum:
            primary:
              server: ntp.cesnet.cz
              key_id: 1
            secondary:
              server: ntp.nic.cz
              key_id: 2

* A cleaning up of the NTP configurations left by DHCP:

  .. code-block:: yaml

      ntp:
        client:
          enabled: true
          remove_dhcp_conf: true # default false

* The NTP server simple peering definition:

  .. code-block:: yaml

      ntp:
        server:
          peers:
          - 192.168.0.241
          - 192.168.0.242

* The NTP server extended peering definition:

  .. code-block:: yaml

     ntp:
        server:
          peers:
            1:
              host: 192.168.31.1
            2:
              host: 192.168.31.2
            3:
              host: 192.168.31.3

* The NTP server definition enabling the ``listen`` and ``ignore`` actions on
  specific addresses:

  .. code-block:: yaml

      ntp:
        server:
            1:
              value: wildcard
              action: ignore
            2:
              value: ::1
              action: listen
            3:
              value: 192.168.31.1
              action: listen

**Read more**

* https://collectd.org/wiki/index.php/Plugin:NTPd

**Documentation and bugs**

* http://salt-formulas.readthedocs.io/
   Learn how to install and update salt-formulas

* https://github.com/salt-formulas/salt-formula-ntp/issues
   In the unfortunate event that bugs are discovered, report the issue to the
   appropriate issue tracker. Use the Github issue tracker for a specific salt
   formula

* https://launchpad.net/salt-formulas
   For feature requests, bug reports, or blueprints affecting the entire
   ecosystem, use the Launchpad salt-formulas project

* https://launchpad.net/~salt-formulas-users
   Join the salt-formulas-users team and subscribe to mailing list if required

* https://github.com/salt-formulas/salt-formula-ntp
   Develop the salt-formulas projects in the master branch and then submit pull
   requests against a specific formula

* #salt-formulas @ irc.freenode.net
   Use this IRC channel in case of any questions or feedback which is always
   welcome

