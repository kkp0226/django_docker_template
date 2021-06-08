#!/usr/bin/env bash
ssh -t -o StrictHostKeyChecking=no serveruser@xxx.xxx.xxx.xxx  << 'ENDSSH'
 cd ./django_docker_template
 git fetch
 git reset --hard origin/master
 docker login -u $REGISTRY_USER -p $CI_BUILD_TOKEN $CI_REGISTRY
 docker pull registry.gitlab.com/your_name/django_docker_template:latest
 docker-compose up -d
ENDSSH