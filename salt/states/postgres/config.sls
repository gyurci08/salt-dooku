# Manage PostgreSQL main configuration file
postgresql_config:
  file.managed:
    - name: /etc/postgresql/13/main/postgresql.conf
    - source: salt://states/postgres/files/postgresql.conf
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 644
    - makedirs: True
    - require:
      - pkg: postgresql-server
    - watch_in:
      - service: postgresql_service

# Manage PostgreSQL HBA (Host-Based Authentication) configuration file
postgresql_hba_config:
  file.managed:
    - name: /etc/postgresql/13/main/pg_hba.conf
    - source: salt://states/postgres/files/pg_hba.conf
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 640
    - require:
      - pkg: postgresql-server
    - watch_in:
      - service: postgresql_service

# Ensure the configuration directory exists for additional custom settings
postgresql_custom_config_dir:
  file.directory:
    - name: /etc/postgresql/13/conf.d
    - user: postgres
    - group: postgres
    - mode: 755

# Manage custom PostgreSQL settings (optional)
postgresql_custom_config:
  file.managed:
    - name: /etc/postgresql/13/conf.d/custom.conf
    - source: salt://states/postgres/files/custom.conf
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 644
    - require:
      - file: postgresql_custom_config_dir
