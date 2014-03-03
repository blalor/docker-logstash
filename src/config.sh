#!/bin/bash

set -e
set -x

yum install -y zeromq

## grrr logstash/java/ruby
cd /usr/lib64
ln -s libzmq.so.1 libzmq.so

curl \
    --create-dirs \
    --output /usr/share/logstash/logstash.jar \
    http://download.elasticsearch.org/logstash/logstash/logstash-1.3.3-flatjar.jar

cd /tmp/src

mkdir /etc/logstash/

## wtf?
## mv: will not create hard link `/etc/logstash/plugins' to directory `/etc/logstash/conf'
## just going to move these into place separately
mv conf /etc/logstash/conf
mv plugins /etc/logstash/plugins
mv templates /etc/logstash/templates

mv launch.sh /usr/local/bin/launch-logstash.sh
mv supervisord.conf /etc/supervisor.d/logstash.conf

## cleanup

yum clean all

cd /
rm -rf /tmp/src /var/tmp/yum-root*
