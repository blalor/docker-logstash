FROM blalor/logstash:1.2.2
MAINTAINER Brian Lalor <brian@autosportlabs.com>

VOLUME ["/logstash"]

EXPOSE 2120

ADD conf/ /etc/logstash/conf/
ADD templates/ /etc/logstash/templates/
#ADD patterns/ /etc/logstash/patterns/
ADD plugins/ /etc/logstash/plugins/

ADD launch.sh /launch.sh

RUN (echo -n "autosportlabs/logstash:private" ; date -u) >> /.docker

CMD ["/launch.sh"]
