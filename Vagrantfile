# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo I am installing puppet on guest 
sudo apt-get install -yq puppet=*
wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
sudo dpkg -i puppet6-release-bionic.deb
sudo apt update
SCRIPT

    #sudo ufw disable
    #puppet module install puppetlabs-haproxy --version 4.3.0
	#puppet module install puppet-prometheus --version 10.2.0

 Vagrant.configure("2") do |config|
     config.vm.define "web1" do |web1|  
     web1.vm.box = "bento/ubuntu-18.04"   
     web1.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
	 web1.vm.network "private_network", ip: "192.168.100.20"
     web1.vm.hostname = "web1"
	end
     config.vm.define "web2" do |web2|  
     web2.vm.box = "bento/ubuntu-18.04"   
     web2.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
	 web2.vm.network "private_network", ip: "192.168.100.21"
     web2.vm.hostname = "web2"
    end
     config.vm.define "loadbalancer" do |loadbalancer|  
     loadbalancer.vm.box = "bento/ubuntu-18.04"   
     loadbalancer.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
	 loadbalancer.vm.network "private_network", ip: "192.168.100.10"
     loadbalancer.vm.hostname = "loadbalancer"
	end

    config.vm.provision "shell", inline: $script
	config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "site.pp"
    #puppet.options = "--verbose --debug"
	#config.vm.synced_folder ".", "/opt/html"
  end
end
