home
====
Configurations and build images for my home network

server-base
---------
Docker config for a basic image

openwrt-build
---------
Vagrant machine for building OpenWRT for my router

Vagrantfile additions
---------
I use these plugins, so I (should) add them into every Vagrantfile:

    # We use a proxy, install the Vagrant proxyconf plugin (vagrant plugin install vagrant-proxyconf
    if Vagrant.has_plugin?("vagrant-proxyconf")
      config.proxy.http=ENV['http_proxy']
      config.proxy.https=ENV['https_proxy']
    end
    # and set the http_proxy environment variable
    
    # Depending on your guest OS, the virtualbox guest additions may be out of
    # date.  The vbguest plugin will handle this automagically for you.
    # see https://github.com/dotless-de/vagrant-vbguest
    # vagrant plugin install vagrant-vbguest
    if Vagrant.has_plugin?("vagrant-vbguest")
      config.vbguest.auto_update = true
      config.vbguest.no_remote = true
    end
    
    config.vm.provision "shell",
      inline: "apt-get update ; 
               DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade ; 
               DEBIAN_FRONTEND=noninteractive apt-get -y install git"

