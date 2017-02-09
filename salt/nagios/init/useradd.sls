nagios:
  user.present:
    - fullname: nagios
    - shell: /bin/bash
    - home: /home/nagios
    - uid: 1109
    - gid: 1109
    - groups:
      - nagios
    - require:
      - group: nagios

  group.present:
    - gid: 1109
