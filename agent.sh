#!/usr/bin/bash

MAIN() {
  live=$(ps -AL | grep tinyproxy | wc -l)
  ip=$(curl 4.ident.me)
  host="$(hostname -f)"
  data='''{"KEY":"SEC_KEY100200300","host":"'$host'","ip":"'$ip'","live":"'$live'","rtx":'"$(vnstat -tr --json)"'}'''
  curl -X POST \
    http://marvelhost.co/monitor/agent/ \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json; charset=UTF-8' \
    --data "$data"
}

MAIN
