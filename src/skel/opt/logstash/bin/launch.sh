#!/bin/bash

## largely copied from /etc/init.d/logstash from the rpm

set -e

LS_USER="logstash"
LS_GROUP="logstash"
LS_HOME="/var/lib/logstash"
LS_JAVA_OPTS="-Dfile.encoding=UTF-8 -Djava.io.tmpdir=${LS_HOME}"
LS_LOG_DIR="/var/log/logstash"
LS_LOG_FILE="${LS_LOG_DIR}/logstash.log"
LS_NICE="19"

if [ -d "/etc/logstash/plugins/" ]; then
    LS_OPTS="${LS_OPTS} --pluginpath /etc/logstash/plugins/"
fi

program="/opt/logstash/bin/logstash"
args="agent --config /etc/logstash/conf/ --log ${LS_LOG_FILE} ${LS_OPTS}"

JAVA_OPTS=${LS_JAVA_OPTS}
HOME=${LS_HOME}

export PATH HOME JAVA_OPTS LS_HEAP_SIZE LS_JAVA_OPTS LS_USE_GC_LOGGING

# set ulimit as (root, presumably) first, before we drop privileges
# will not be possible if the docker process limit is lower
[ -n "${LS_OPEN_FILES}" ] && ulimit -n ${LS_OPEN_FILES}

## normally I'd use runuser, but chroot seems to do effectively the same thing
## and doesn't add more processes to the tree.  That extra layer of indirection
## causes problems when running via supervisor. (restarting program leaves old
## one running)
exec nice -n ${LS_NICE} \
    chroot --userspec=${LS_USER}:${LS_GROUP} / ${program} ${args}
