# Ensure SSHD service is running and enabled
sshd_service:
  service.running:
    - name: sshd
    - enable: True

# Restart SSHD service if configuration changes
restart_sshd_on_change:
  service.running:
    - name: sshd
    - watch:
      - file: /etc/ssh/sshd_config
