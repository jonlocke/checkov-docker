#!/bin/bash
docker build ${1} -t check_test .
docker tag check_test:latest kube1.local:5000/check_test:latest
docker push kube1.local:5000/check_test:latest
