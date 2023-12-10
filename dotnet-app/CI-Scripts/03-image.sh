#!/bin/bash
docker image build -t AneesRavidKhandevops/jenkins-demo2:$1 -f dotnet-app/src/demo2-publish/dockerfile .
