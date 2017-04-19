ntp:
  server:
    enabled: true
    strata:
    - ntp.cesnet.cz
    - pool.ntp.org
    restrict:
      - subnet: 192.168.0.1
        mask: 255.255.255.0
      - subnet: 172.16.1.1
        mask: 255.255.0.0
    mode7: true
  client:
    enabled: false
    strata:
    - ""