FROM blalor/logstash:ec35c49
MAINTAINER Brian Lalor <brian@autosportlabs.com>

## 2120 zeromq publish output
## 4244 lumberjack input
EXPOSE 2120 4244

## provide a method for sharing the SSL key and certificate
VOLUME ["/etc/logstash/pki"]

ADD conf/      /etc/logstash/conf/
ADD templates/ /etc/logstash/templates/
#ADD patterns/  /etc/logstash/patterns/
ADD plugins/   /etc/logstash/plugins/

ADD launch.sh /launch.sh

RUN (echo -n "asl-private/logstash" ; date -u) >> /.docker

CMD ["/launch.sh"]
