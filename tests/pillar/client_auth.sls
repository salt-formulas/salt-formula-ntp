ntp:
  client:
    enabled: true
    auth:
      enabled: true
      secrets:
        # Jsonschemavalidator expect pattern keys in str format
        "1":
          secret_type: 'M'
          secret: 'Runrabbitrundigthath'
          trustedkey: true
        "2":
          secret_type: 'M'
          secret: 'Howiwishyouwereherew'
          trustedkey: false
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