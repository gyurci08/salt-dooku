include:
  - states.postgresql

# Install PostgreSQL server and client packages
postgresql_packages:
  pkg.installed:
    - pkgs:
      - postgresql
      - postgresql-client

# Ensure PostgreSQL service is running
postgresql_service:
  service.running:
    - name: postgresql
    - enable: True
    - require:
      - pkg: postgresql_packages

# Create databases defined in pillar
{% for db, config in pillar.get('postgres:databases', {}).items() %}
{{ db }}_database:
  postgres_database.present:
    - name: {{ config.name }}
    - encoding: {{ config.encoding }}
    - lc_ctype: {{ config.lc_ctype }}
    - lc_collate: {{ config.lc_collate }}
    - require:
      - service: postgresql_service

{{ db }}_user:
  postgres_user.present:
    - name: {{ config.user }}
    - password: {{ config.password }}
    - require:
      - postgres_database: {{ db }}_database

{{ db }}_privileges:
  postgres_privileges.present:
    - name: {{ config.user }}
    - database: {{ config.name }}
    - privileges: {{ config.privileges }}
    - require:
      - postgres_user: {{ db }}_user
{% endfor %}
