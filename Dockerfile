FROM blalor/logstash:ec35c49
MAINTAINER Brian Lalor <brian@autosportlabs.com>

VOLUME ["/logstash"]

EXPOSE 2120

ADD conf/ /etc/logstash/conf/
ADD templates/ /etc/logstash/templates/
#ADD patterns/ /etc/logstash/patterns/
ADD plugins/ /etc/logstash/plugins/

ADD launch.sh /launch.sh

RUN (echo -n "asl-private/logstash" ; date -u) >> /.docker

CMD ["/launch.sh"]
