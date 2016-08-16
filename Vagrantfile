# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

###############################################################################
# Base box                                                                    #
###############################################################################
    config.ssh.insert_key      = false
    config.vm.box              = "puppetlabs/centos-6.6-64-puppet"
    config.vm.box_version      = '1.0.1'
    config.vm.box_check_update = false

###############################################################################
# Global plugin settings                                                      #
###############################################################################
    plugins = ["vagrant-hostmanager"]
    plugins.each do |plugin|
      unless Vagrant.has_plugin?(plugin)
        raise plugin << " has not been installed."
      end
    end

    # Configure cached packages to be shared between instances of the same base box.
    if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :machine
    end

###############################################################################
# Global VirtualBox settings                                                  #
###############################################################################
    config.vm.provider 'virtualbox' do |v|
    v.customize [
      'modifyvm', :id,
      '--groups', '/Vagrant/example'
    ]
    end

###############################################################################
# Global /etc/hosts file settings                                             #
###############################################################################
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

###############################################################################
# VM definitions                                                              #
###############################################################################
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.define :node1 do |node1_config|
      node1_config.vm.host_name = "node1.example.vagrant"
      node1_config.vm.network :forwarded_port, guest: 22, host: 4242
      node1_config.vm.network :private_network, ip: "192.168.42.42"
      node1_config.vm.synced_folder 'manifests/', "/etc/puppet/environments/production/manifests"
      node1_config.vm.synced_folder 'modules/', "/etc/puppet/environments/production/modules"
      node1_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      node1_config.vm.provision :puppet do |puppet|
          puppet.manifests_path    = "manifests"
          puppet.manifest_file     = ""
          puppet.module_path       = "modules"
          puppet.hiera_config_path = "files/hiera.yaml"
      end
    end
end
