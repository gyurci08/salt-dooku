# Used to map pillar data to specific minions or groups of minions. 
base:
  '*':
    - common
    - user.init
    - sshd.init

  'G@role:webserver':
    - match: compound
    - roles.webserver

  'G@role:database':
    - match: compound
    - roles.database

  'G@role:application':
    - match: compound
    - roles.application

# salt 'minion-id' grains.set role webserver
