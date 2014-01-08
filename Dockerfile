FROM localhost:5000/core/java
MAINTAINER Brian Lalor <brian@autosportlabs.com>

## 2120 zeromq publish output
## 4244 lumberjack input
EXPOSE 2120 4244

ADD src/ /tmp/src/
RUN /tmp/src/config.sh

## provide a method for sharing the SSL key and certificate
VOLUME [ "/etc/logstash/pki", "/logstash" ]
