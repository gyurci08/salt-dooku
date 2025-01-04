base:
  '*':
    - common
    - states.users
    
  'G@environment:dev':
    - environments.dev
    - roles.webserver
    - roles.database
    - states.nginx
    - states.mysql

  'G@environment:prod':
    - environments.prod

  'G@environment:prod and G@role:webserver':
    - roles.webserver
    - states.nginx

  'G@environment:prod and G@role:database':
    - roles.database
    - states.mysql
