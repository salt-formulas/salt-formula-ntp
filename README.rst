===
NTP
===

Network time synchronisation services.

Sample pillars
==============

NTP client (old version), not used when stratum parameter exists

.. code-block:: yaml

    ntp:
      client:
        enabled: true
        strata:
        - ntp.cesnet.cz
        - ntp.nic.cz

NTP client (extended definitions with auth)

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

NTP with MD5 auth
Requires extended definitions

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

Cleanup ntp configurations left by DHCP:

.. code-block:: yaml

    ntp:
      client:
        enabled: true
        remove_dhcp_conf: true # default false

Peering (simple):

.. code-block:: yaml

    ntp:
      server:
        peers:
        - 192.168.0.241
        - 192.168.0.242

Peering (extended definitions):

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

Enable listen/ignote on specific addresses

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


Read more
=========

* https://collectd.org/wiki/index.php/Plugin:NTPd

Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-ntp/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-ntp

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
