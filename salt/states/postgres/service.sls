# Ensure PostgreSQL service is installed and running
postgresql_service:
  service.running:
    - name: postgresql
    - enable: True
    - require:
      - pkg: postgresql_packages
      - file: postgresql_config

# Restart PostgreSQL service if configuration changes
postgresql_service_restart:
  service.running:
    - name: postgresql
    - watch:
      - file: /etc/postgresql/13/main/postgresql.conf
      - file: /etc/postgresql/13/main/pg_hba.conf
      - file: /etc/postgresql/13/conf.d/custom.conf
