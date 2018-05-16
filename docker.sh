#!/bin/bash
export DOCKER_HOST_IP=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
docker rm -f drivesly_api risk_engine
docker run -d --name drivesly_api -v /Users/cijoyah/code/drivesly-api:/var/www/html -p 8080:80 -h drivesly_api --add-host mysql:$DOCKER_HOST_IP php7-nginx-docker:latest
docker run -d --name risk_engine -v /Users/cijoyah/code/risk-engine-api:/var/www/html -p 8081:80 -h risk_engine --add-host mysql:$DOCKER_HOST_IP php7-nginx-docker:latest
