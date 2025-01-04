include:
  - states.mysql
  - states.postgresql

# Install required packages for database management
database_utils:
  pkg.installed:
    - pkgs:
      - python3-mysqldb
      - python3-psycopg2

# Set up backup directory
backup_directory:
  file.directory:
    - name: /var/backup
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

# Include database type based on grain
{% if salt['grains.get']('database_type') == 'mysql' %}
include:
  - states.mysql
{% elif salt['grains.get']('database_type') == 'postgresql' %}
include:
  - states.postgresql
{% endif %}


# salt 'database-*' grains.set database_type mysql  # or postgresql
