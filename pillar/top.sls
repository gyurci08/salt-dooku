base:
  '*':
    - common
  'role:webserver':
    - match: grain
    - webserver
  'role:database':
    - match: grain
    - database
{# 
  'G@environment:production and G@role:application':
    - match: compound
    - production_app
#}