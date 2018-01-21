#!/usr/bin/env bash

echo "API-M Box: provisioning Oracle XE"


if [ $(sudo docker inspect oracle-xe) ]; then
    sudo mkdir -p /vagrant/.box/oracle/scripts/setup
    sudo cp /vagrant/wso2apim-scripts/*.sql /vagrant/.box/oracle/scripts/setup
    sudo docker run -d --name oracle-xe --shm-size=1gb \
        -p 1521:1521 -p 8080:8080 \
        -e ORACLE_PWD=oracle123 \
        -v /vagrant/.box/oracle/oradata:/u01/app/oracle/oradata \
        -v /vagrant/.box/oracle/scripts/startup:/u01/app/oracle/scripts/startup  \
        -v /vagrant/.box/oracle/scripts/setup:/u01/app/oracle/scripts/setup  \
        denisppinheiro/oracle-xe:latest

else
	
	echo "API-M Box: Oracle XE already provisioned!"
	
fi