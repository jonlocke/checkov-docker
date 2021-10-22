#!/bin/bash
docker build ${1} --build-arg CACHEBUST=$(date +%s) -t check_test .
docker tag check_test:latest kube1.local:5000/check_test:latest
docker push kube1.local:5000/check_test:latest
