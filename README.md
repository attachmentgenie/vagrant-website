#  vagrant-website

A vagrant setup that creates scaling LAMP stacks.

## Requirements
    Virtualbox                  => https://www.virtualbox.org
    Vagrant                     => http://www.vagrantup.com
    vagrant-hostmanager         => vagrant plugin install vagrant-hostmanager
    vagrant-puppet-install      => vagrant plugin install vagrant-puppet-install
    vagrant-cachier  (optional) => vagrant plugin install vagrant-cachier
    
## Preparation

    git submodule update --init
    bundle install
    
## Setup

    vagrant up

## Inspec tests

    bundle exec rake
    bundle exec rake inspec[centos7] 

## TLDR

### (G)UI interfaces

    
    - name: puppetmaster
    - name: proxy
      public_vhosts:
        - platform.website.vagrant:8030
            Traefik using consul services to forward traffic to www node platform vhosts
    - name: database
    - name: www
      php: 74
      platform_vhosts
        - backend.website.vagrant:8000
          Apache vhost using php-fpm pool
        - backend.website.vagrant:8020
          Nginx vhost using php-fpm pool
      public_vhosts:
        - backend.website.vagrant:8001
            Apache vhost using php-fpm pool on the fpm node
        - backend.website.vagrant:8021
            Nginx vhost using php-fpm pool on the fpm node
    - name: fpm
      php: 73
