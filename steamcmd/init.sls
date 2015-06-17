{% from "steamcmd/map.jinja" import steamcmd with context %}

steamuser:
  user.present:
    - name: {{ steamcmd.steamuser }}
    - home: {{ steamcmd.steamuserdir }}
    - groups: {{ steamcmd.steamusergroups }}

steamcmd-download:
  file.managed:
    - name: {{ steamcmd.steamuserdir }}/steamcmd_linux.tar.gz
    - source: https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    - source_hash: md5=09e3f75c1ab5a501945c8c8b10c7f50e
    - unless: test {{ steamcmd.steamuserdir }}/steamcmd.sh

steamcmd-extract:
  cmd.run:
    - name: tar -zxf {{ steamcmd.steamuserdir }}/steamcmd_linux.tar.gz
    - onchanges:
      - file: {{ steamcmd.steamuserdir }}/steamcmd_linux.tar.gz

steamcmd-deps:
  pkg.installed:
    - pkgs: {{ steamcmd.steampkgreqs }}

