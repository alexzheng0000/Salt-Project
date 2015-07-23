{% set ntp_server = salt['pillar.get']('ntpserver') %}

crons:
    cron.present:
        - name: '/usr/bin/ntpdate  {{ntp_server}}'
        - user: root
        - minute: 0
        - hour: 3
