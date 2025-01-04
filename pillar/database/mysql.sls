mysql:
  server:
    host: localhost
    port: 3306
    user: root
    password: your_secure_password
    
  databases:
    app_db:
      name: application_database
      user: app_user
      password: app_user_password
      host: '%'
      grants: ['ALL PRIVILEGES']
    
  config:
    max_connections: 100
    key_buffer_size: '256M'
    max_allowed_packet: '64M'
    innodb_buffer_pool_size: '1G'
    bind_address: '0.0.0.0'

  backup:
    enabled: true
    retention_days: 7
    backup_dir: /var/backup/mysql