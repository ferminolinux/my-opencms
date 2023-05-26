# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/9"
  
  # Define as informaões do servidor web
  config.vm.define "webserver" do |web|
    web.vm.hostname = "webserver"
    web.vm.network "private_network", ip: "172.23.1.10"
    
    web.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end

    web.vm.provision "shell", path: "./webserver.sh"
  end

  # Define as informaões do servidor de banco de dados
  config.vm.define "database" do |db|
    db.vm.hostname = "database"
    db.vm.network "private_network", ip: "172.23.1.20"

    db.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end

    db.vm.provision "shell", path: "./database.sh"
  end

end
