#!/bin/bash

set -e -u

LOCKFILE="/var/run/logstash-restart.lock"

echo "acquiring lock"
lockfile-create --lock-name ${LOCKFILE}
echo "got lock; restarting logstash"

supervisorctl restart logstash

echo "releasing lock"
lockfile-remove --lock-name ${LOCKFILE}
