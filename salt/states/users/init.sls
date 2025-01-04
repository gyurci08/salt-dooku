{% for user in pillar.get('users', []) %}
    {{ user.username }}:
    user.present:
        - fullname: {{ user.fullname }}
        - shell: {{ user.shell }}
        - home: {{ user.home }}
        - groups: {{ user.groups }}
        - createhome: True

    {% if user.sudo %}
    {{ user.username }}_sudo:
    file.managed:
        - name: /etc/sudoers.d/{{ user.username }}
        - contents: "{{ user.username }} ALL=(ALL) NOPASSWD: ALL"
        - mode: 0440
        - require:
        - user: {{ user.username }}
    {% endif %}

    {% if 'ssh_keys' in user %}
    {{ user.username }}_ssh_keys:
    ssh_auth.present:
        - user: {{ user.username }}
        - enc: ssh-rsa
        - names:
        {% for key in user.ssh_keys %}
        - {{ key }}
        {% endfor %}
    {% endif %}
{% endfor %}
