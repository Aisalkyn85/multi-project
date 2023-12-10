#!/bin/bash

if [ -z ${DOCKER_HUB_USER+x} ]
then 
    echo 'DockerHub login credentials not provided.' 
else 
    docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD
fi

docker push AneesRavidKhandevops/jenkins-demo2:$1