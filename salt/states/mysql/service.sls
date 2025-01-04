# Ensure MySQL service is installed and running
mysql_service:
  service.running:
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql_packages
      - file: mysql_config

# Restart MySQL service if configuration changes
mysql_service_restart:
  service.running:
    - name: mysql
    - watch:
      - file: /etc/mysql/mysql.conf.d/mysqld.cnf
      - file: /etc/mysql/conf.d/custom.cnf
