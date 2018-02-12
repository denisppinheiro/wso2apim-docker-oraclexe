#!/usr/bin/env bash

echo "API-M Box: provisioning Docker Host"


if ! [ $(sudo docker run hello-world) ]; then

	sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt-get update -y
	sudo apt-get install docker-ce -y
	sudo docker run hello-world

	sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
	sudo chmod +x /usr/local/bin/docker-compose  && \
	sudo docker-compose version
	
	sudo usermod -aG docker $USER
	
	echo "Docker Box: Docker Host ready to use! [docker and docker-compose]"
	
else
	
	echo "API-M Box: Docker Host already provisioned!"
	
fi