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
        options: notrap nomodify
    mode7: true
    peers:
      - 192.168.31.1
      - 192.168.31.2
      - 192.168.31.3
    orphan: 5
