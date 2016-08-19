# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  ###############################################################################
  # Global Node list                                                            #
  ###############################################################################
  require 'yaml'
  if File.file?('nodes.yaml')
    nodes = YAML.load_file('nodes.yaml')
  elsif File.file?('nodes.yaml.dist')
    nodes = YAML.load_file('nodes.yaml.dist')
  end

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
  nodes.each do |node|
    config.vm.define node["name"] do |srv|
      srv.vm.box                = node["box"]
      if node["box_version"]
        srv.vm.box_version      = node["box_version"]
      end
      if node["box_check_update"]
        srv.vm.box_check_update = node["box_check_update"]
      end
      srv.vm.hostname           = node["hostname"]
      if node["ports"]
        node["ports"].each do |port|
          srv.vm.network :forwarded_port, guest: port["guest"], host: port["host"]
        end
      end
      srv.vm.network :private_network, ip: node["ip"]
      if node["synced_folders"]
        node["synced_folders"].each do |folder|
          srv.vm.synced_folder folder["src"], folder["dst"]
        end
      end
      srv.vm.synced_folder 'manifests/', "/etc/puppet/environments/production/manifests"
      srv.vm.synced_folder 'modules/', "/etc/puppet/environments/production/modules"
      srv.vm.synced_folder 'hiera/', '/var/lib/hiera'
      srv.vm.provision :puppet do |puppet|
        puppet.manifests_path    = "manifests"
        puppet.manifest_file     = ""
        puppet.module_path       = "modules"
        puppet.hiera_config_path = "files/hiera.yaml"
      end
    end
  end
end
