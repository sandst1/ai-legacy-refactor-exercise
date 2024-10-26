#!/bin/bash
# wait-for-it.sh

set -e

host="$1"
shift
cmd="$@"

until mysql -h"$host" -uroot -ppassword -e 'select 1'; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"
exec $cmd
