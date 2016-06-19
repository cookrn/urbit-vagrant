# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure VAGRANTFILE_API_VERSION do | config |
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'ubuntu/trusty64'

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # VMs get 3Gb of RAM (need a min of 2048 + room for OS)
  # 3Gb = 1024Mb + 2048Mb = 3072Mb
  config.vm.provider 'virtualbox' do | virtualbox |
    virtualbox.customize [ 'modifyvm' , :id , '--memory' , '3072' ]
  end

  config.vm.provision 'ansible_local' do | ansible |
    ansible.playbook = 'urbit.yml'

    # set the verbosity of information that ansible will display
    # ansible.verbose = 'vv'

    # add tags here to focus on specific ansible tasks
    # ansible.tags = [ 'wip' ]
  end
end
