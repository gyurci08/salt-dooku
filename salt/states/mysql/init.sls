include:
  - .config

# Install MySQL packages
mysql_packages:
  pkg.installed:
    - pkgs:
      - mysql-server
      - mysql-client
      - python3-mysqldb

# Ensure MySQL service is running
mysql_service:
  service.running:
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql_packages
      - file: mysql_config

# Create MySQL root user with pillar password
mysql_root_user:
  mysql_user.present:
    - name: {{ pillar['mysql']['server']['user'] }}
    - host: localhost
    - password: {{ pillar['mysql']['server']['password'] }}
    - require:
      - service: mysql_service

# Ensure root user has all privileges
mysql_root_grants:
  mysql_grants.present:
    - grant: ALL PRIVILEGES
    - database: '*.*'
    - user: {{ pillar['mysql']['server']['user'] }}
    - host: localhost
    - require:
      - mysql_user: mysql_root_user
