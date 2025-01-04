# Manage the SSHD configuration file using pillar data
/etc/ssh/sshd_config:
  file.managed:
    - source: salt://states/sshd/files/sshd_config.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: openssh-server
    - watch_in:
      - service: sshd_service

# Ensure the SSH directory exists (optional)
/etc/ssh/conf.d:
  file.directory:
    - user: root
    - group: root
    - mode: 755
