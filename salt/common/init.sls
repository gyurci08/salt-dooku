# Install common packages
common_packages:
  pkg.installed:
    - pkgs:
      - nano
      - htop
      - curl
      - wget

# Set up NTP for time synchronization
ntp:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: ntp

# Include the SSH state
include:
  - states.sshd


# Apply sysctl changes
sysctl_apply:
  cmd.run:
    - name: sysctl -p
    - onchanges:
      - file: /etc/sysctl.conf
