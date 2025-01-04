include:
  - states.mysql

# Install MySQL server and client packages
mysql_packages:
  pkg.installed:
    - pkgs:
      - mysql-server
      - mysql-client

# Ensure MySQL service is running
mysql_service:
  service.running:
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql_packages

# Create databases defined in pillar
{% for db, config in pillar.get('mysql:databases', {}).items() %}
{{ db }}_database:
  mysql_database.present:
    - name: {{ config.name }}
    - require:
      - service: mysql_service

{{ db }}_user:
  mysql_user.present:
    - name: {{ config.user }}
    - host: {{ config.host }}
    - password: {{ config.password }}
    - require:
      - mysql_database: {{ db }}_database

{{ db }}_grants:
  mysql_grants.present:
    - grant: {{ config.grants|join(',') }}
    - database: {{ config.name }}.*
    - user: {{ config.user }}
    - host: {{ config.host }}
    - require:
      - mysql_user: {{ db }}_user
{% endfor %}
