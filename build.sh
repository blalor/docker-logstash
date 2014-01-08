#!/bin/bash

set -e

IMAGE="localhost:5000/apps/logstash"

docker build -t ${IMAGE} .
docker push ${IMAGE}
