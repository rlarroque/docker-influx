#!/bin/bash
set -eo pipefail

echo 'Starting process'

for f in /tmp/*; do
  case "$f" in
    *.sh)         echo "$0: running $f"; . "$f" ;;
    *.influxql)   echo "$0: running $f"; influx -import -path="$f" -precision=s; echo ;;
    *.txt)        echo "$0: running $f"; influx -import -path="$f" -precision=s; echo ;;
    *)            echo "$0: ignoring $f" ;;
  esac
  echo
done

echo 'InfluxDB init process done. Ready for start up.'
