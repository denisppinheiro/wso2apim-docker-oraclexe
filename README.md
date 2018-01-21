# WSO2 API-M Oracle Database

WSO2 API-M architecture is quite flexible in the sense we can choose the RDBMS we want to use. The steps to setup an Oracle database is well documented in the [WSO2 documentation](https://docs.wso2.com/display/AM210/Installing+and+Configuring+the+Databases#e3446153ad0044f097f6a643c3f2d0fe), but there still a lack of automated tools to get everything configured and ready to go.  

This project supports the use of Oracle Express Edition (XE) as the RDBMS for the WSO2 API-M. One docker base image of the Oracle XE was created using the [Oracle docker-images GitHub project](https://github.com/oracle/docker-images/tree/master/OracleDatabase) as reference. This image was made available at [Docker Hub](https://cloud.docker.com/swarm/denisppinheiro/repository/docker/denisppinheiro/oracle-xe/general) and has been used to deploy and setup the RDBMS for WSO2 API-M and Analytics.


## Provisioning Oracle XE for WSO2 API-M using Vagrant
The basic use case of this project is the use of Vagrant to provision the Oracle XE for WSO2 API-M environment.

#### Requirements:
* Oracle Virtual Box
* Vagrant
* Oracle SQL Developer (only for check -- it's must to have also JDK 8+ properly installed)

#### Provision steps:

1. Clone the project:

```
    git clone https://github.com/denisppinheiro/wso2apim-docker-oraclexe.git
```

2. Run Vagrant command in the directory where the `Vagrantfile` is located:
```
    vagrant up
```

3. Check using Oracle SQL Developer if the WSO2 API-M databases are properly provisioned.
* **hostname:port**: localhost:1521
* **user/password**: wso2apim/wso2apim
* **SID**: XE


## Provisioning Oracle XE for WSO2 API-M using Docker

#### Prerequirements
* Docker Engine
* Oracle SQL Developer (only for check -- it's must to have also JDK 8+ properly installed)

1. Clone the project:

```
    git clone https://github.com/denisppinheiro/wso2apim-docker-oraclexe.git
```

2. Run Oracle XE Docker image using the WSO2 API-M database scripts.

```
    sudo docker run -d --name oracle-xe --shm-size=1gb \
        -p 1521:1521 -p 8080:8080 \
        -e ORACLE_PWD=oracle123 \
        -v ./wso2apim-scripts:/u01/app/oracle/scripts/setup  \
        denisppinheiro/oracle-xe:latest
```

3. Check using Oracle SQL Developer if the WSO2 API-M databases are properly provisioned.
* **hostname:port**: localhost:1521
* **user/password**: wso2apim/wso2apim
* **SID**: XE


### References:

##### Oracle Database - Docker Images on GitHub

https://github.com/oracle/docker-images/tree/master/OracleDatabase

#### WSO2 API-M - Configuring Oracle Database
https://docs.wso2.com/display/AM210/Installing+and+Configuring+the+Databases#e3446153ad0044f097f6a643c3f2d0fe
https://docs.wso2.com/display/AM210/Changing+the+Default+API-M+Databases#ce593864cac04cb1a299e374c8d08d27
https://docs.wso2.com/display/ADMIN44x/Setting+up+Oracle