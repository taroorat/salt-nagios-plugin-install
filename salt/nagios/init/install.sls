gcc:
  pkg.installed:
    - name:
      - gcc
xinetd:
  pkg.installed:
    - name: 
      - xinetd

openssl-devel:
  pkg.installed:
    - name: 
      - openssl-devel

nagios-plugin-install:
  file.managed:
    - name: /usr/local/src/nagios-plugins-2.1.1.tar.gz
    - source: salt://init/files/nagios-plugins-2.1.1.tar.gz
    - mode: 644
    - user: nagios
    - group: nagios
    - makedirs: True
  cmd.run:
    - name: cd /usr/local/src && tar xf nagios-plugins-2.1.1.tar.gz && cd nagios-plugins-2.1.1 && ./configure --prefix=/usr/local/nagios && make && make install
    - unless: test -d /usr/local/nagios
    - file: nagios-plugin-install

nrpe-install:
  file.managed:
    - name: /usr/local/src/nrpe-2.15.tar.gz
    - source: salt://init/files/nrpe-2.15.tar.gz
    - mode: 644
    - user: nagios
    - group: nagios
    - makedirs: True
  cmd.run:
    - name: cd /usr/local/src && tar xf nrpe-2.15.tar.gz && cd nrpe-2.15 && ./configure && make all && make install-plugin && make install-daemon && make install-daemon-config && make install-xinetd
    - file: nrpe-install
