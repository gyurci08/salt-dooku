# Configure MySQL server
mysql_config:
  file.managed:
    - name: /etc/mysql/mysql.conf.d/mysqld.cnf
    - source: salt://states/mysql/files/mysqld.cnf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: mysql-server
    - watch_in:
      - service: mysql

# Configure client settings
mysql_client_config:
  file.managed:
    - name: /etc/mysql/mysql.conf.d/mysql.cnf
    - source: salt://states/mysql/files/mysql.cnf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: mysql-client

# Create configuration directory for custom settings
mysql_custom_config_dir:
  file.directory:
    - name: /etc/mysql/conf.d
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

# Configure custom settings
mysql_custom_config:
  file.managed:
    - name: /etc/mysql/conf.d/custom.cnf
    - source: salt://states/mysql/files/custom.cnf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: mysql_custom_config_dir
    - watch_in:
      - service: mysql
