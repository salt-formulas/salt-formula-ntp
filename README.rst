===
NTP 
===

Network time synchronisation services.

Sample pillars
==============

NTP client

.. code-block:: yaml

    ntp:
      client:
        enabled: true
        strata:
        - ntp.cesnet.cz
        - ntp.nic.cz

Read more
=========

* https://collectd.org/wiki/index.php/Plugin:NTPd
