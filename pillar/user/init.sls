users:
  - username: sysadmin
    fullname: System Administrator
    shell: /bin/bash
    home: /home/sysadmin
    groups:
      - sudo
      - admin
    sudo: True
    ssh_keys:
      - "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsamplekey1"
      - "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsamplekey2"

  - username: devuser
    fullname: Developer User
    shell: /bin/bash
    home: /home/devuser
    groups:
      - developers
    sudo: False
    ssh_keys:
      - "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsamplekey3"
