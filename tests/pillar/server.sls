ntp:
  client:
    enabled: true
    strata:
    - ntp.cesnet.cz
    - pool.ntp.org
  server:
    enabled: true
    restrict:
      - subnet: 192.168.0.1
        mask: 255.255.255.0
      - subnet: 172.16.1.1
        mask: 255.255.0.0

