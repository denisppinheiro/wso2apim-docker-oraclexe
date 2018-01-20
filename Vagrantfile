# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/xenial64"

  # oracle network
  config.vm.network "forwarded_port", guest: 1521, host: 1521, auto_correct: true
  
  # 
  config.vm.provider "virtualbox" do |vb|
    vb.name = "WSO2 API-M Oracle Box"
    vb.memory = "2048"
    vb.cpus = "2"
  end
  
  # Bootstrap scripts: 
  # Docker engine
  config.vm.provision "shell", path: "docker.sh"
  # Oracle XE database for WSO2 API-M (copy SQL scripts from ./wso2apim-scripts/*.sql to the folder .box/oracle/scripts/setup/ -- create the target folder before).
  config.vm.provision "shell", path: "oracle-xe.sh"
  
end
