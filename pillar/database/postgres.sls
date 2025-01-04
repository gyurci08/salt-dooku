postgres:
  server:
    host: localhost
    port: 5432
    user: postgres
    password: your_secure_password

  databases:
    app_db:
      name: application_database
      user: app_user
      password: app_user_password
      encoding: UTF8
      lc_ctype: 'en_US.UTF-8'
      lc_collate: 'en_US.UTF-8'
      privileges: ['ALL']

  config:
    max_connections: 100
    shared_buffers: '256MB'
    work_mem: '4MB'
    maintenance_work_mem: '64MB'
    listen_addresses: '*'

  backup:
    enabled: true
    retention_days: 7
    backup_dir: /var/backup/postgresql