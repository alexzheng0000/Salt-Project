{% set java_home = salt['pillar.get']('pkgs:conf_list:java_home:home_dir') %}
{% set ip = salt['grains.get']('ip_interfaces:eth0')[0] %}
{% set current_ver = salt['grains.get']('java:version') %}
{% set java_vers = salt['pillar.get']('pkgs:conf_list:java') %}

{% if salt['grains.get']('kernel') = 'Linux' %}
{% for ver, args in java_vers.iteritems() %}
    {% if ip in args %}
        {% if ver != current_ver %}

version-{{ver}}:
    file.absent:
        - name: {{java_home}}
        {% endif %}

java-{{ver}}:
    archive.extracted:
        - name: /usr/
        - source: salt://pkgs/java/files/java{{ver}}.tar
        - archive_format: tar
        - if_missing: {{java_home}}

        {% endif %}
    {% else %}
version-{{ver}}:
    file.absent:
        - name: {{java_home}}

java-{{ver}}:
    archive.extracted:
        - name: /usr/
        - source: salt://pkgs/java/files/java{{ver}}.tar
        - archive_format: tar
        - if_missing: {{java_home}}

java-ln-{{ver}}:
    file.symlink:
        - name: /usr/bin/java
        - target: {{java_home}}/bin/java
        - backupname: java.old
        - user: root
        - group: root
        - mode: 777
{% endfor %}
{% endif %}
