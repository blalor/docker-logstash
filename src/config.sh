#!/bin/bash

set -e
set -x

LOGSTASH_VER="1.4.2"

cd /tmp/src

tar -c -C skel -f - . | tar -xf - -C /

yum install -y logstash-${LOGSTASH_VER} zeromq incron lockfile-progs

## plugin install contrib is broken
## https://logstash.jira.com/browse/LOGSTASH-2257
curl -L -k http://download.elasticsearch.org/logstash/logstash/logstash-contrib-${LOGSTASH_VER}.tar.gz \
    | tar -xz --strip-components=1 -C /opt/logstash -f -

## grrr logstash/java/ruby
cd /usr/lib64
ln -s libzmq.so.1 libzmq.so

## cleanup
yum clean all

cd /
rm -rf /tmp/src /var/tmp/yum-root*
