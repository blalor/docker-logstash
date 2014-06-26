FROM blalor/java
MAINTAINER Brian Lalor <blalor@bravo5.org>

ADD src/ /tmp/src/
RUN /tmp/src/config.sh

#ENV LS_HEAP_SIZE
#ENV LS_OPEN_FILES
#ENV LS_JAVA_OPTS
#ENV LS_USE_GC_LOGGING
#ENV LS_OPTS

VOLUME [ "/etc/logstash" ]
