ntp:
  server:
    enabled: true
    auth:
      enabled: true
      secrets:
        # Jsonschemavalidator expect pattern keys in str format
        "1":
          secret: Runrabbitrundigthath
          secret_type: M
          trustedkey: true
        "2":
          secret: Howiwishyouwereherew
          secret_type: M
          trustedkey: false
    mode7: true
    orphan: 5
    peers:
    - host: 192.168.31.1
    - host: 192.168.31.2
    - host: 192.168.31.3
    restrict:
    - mask: 255.255.255.0
      subnet: 192.168.0.1
    - mask: 255.255.0.0
      options: notrap nomodify
      subnet: 172.16.1.1
    strata:
    - ntp.cesnet.cz
    - pool.ntp.org
    stratum:
      primary:
        server: ntp.cesnet.cz
        key_id: 1
      secondary:
        server: ntp.nic.cz
        key_id: 2
