/etc/xinetd.d/nrpe:
  file.managed:
    - source: salt://init/files/nrpe
    - user: root
    - grop: root
    - mode: 644

/etc/services:
  file.append:
    - text:
      - "nrpe            5666/tcp                # nrpe"

