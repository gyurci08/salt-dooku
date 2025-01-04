sshd:
  port: 22
  permit_root_login: 'no'
  password_authentication: 'yes'
  challenge_response_authentication: 'no'
  use_pam: 'yes'
  x11_forwarding: 'yes'
  print_motd: 'no'
  accept_env:
    - LANG
    - LC_*
  subsystem: 'sftp /usr/lib/openssh/sftp-server'