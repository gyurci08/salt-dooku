include:
  - states.sshd.config
  - states.sshd.service

# Ensure OpenSSH server package is installed
openssh_server:
  pkg.installed:
    - name: openssh-server
