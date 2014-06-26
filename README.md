# Dockerized Logstash

This is a Logstash image with no config.  Contrib plugins are included. Mount a
directory containing your config at `/etc/logstash`.  Your config directory must
be structured like:

    …/
    ├── conf/
    │   ├── 100-input.conf
    │   ├── 500-mogrify.conf
    │   └── 900-output.conf
    ├── patterns/
    │   └── my-patterns
    └── plugins/

# tuning

The following environment variables may be used to tune Logstash:

* `LS_HEAP_SIZE` -- Java's `-Xmx` option
* `LS_OPEN_FILES` -- max number of open files; cannot be more than `ulimit -n` for the Docker process
* `LS_JAVA_OPTS` -- add'l Java options
* `LS_USE_GC_LOGGING` -- `¯\_(ツ)_/¯`
* `LS_OPTS` -- add'l Logstash options
