# operationalize-microservice-api
[![CircleCI](https://circleci.com/gh/uzmasyed00/operationalize-microservice-api.svg?style=svg)](https://circleci.com/gh/uzmasyed00/operationalize-microservice-api)

This project deals with operationalising a micro-service application. The first part of the project, particularly the script run_docker.sh deals with deploying and running the application in Docker running on a host OS such as developer’s Mac machine. Running an application in Docker involves writing a Docker image (Dockerfile) that deals with installing dependencies, copying over the project files in this case app.py and runtime instructions such as starting the application by executing the command “python app.py” at entry point once the container is instantiated from the Docker image.
The project also deals with uploading this docker image to the default Docker hub repository so that it can be pulled and re-used on other host machines. This is demonstrated in the script upload_docker.sh

The second part of the project deals with running an app in Docker container but this time not on the developer’s host OS but in a Kubernetes cluster running on the host OS. This is demonstrated in the script run_kubernetes.sh.
# Kubernetes_Deployment_Pipeline
