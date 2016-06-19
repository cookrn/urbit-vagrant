require_relative 'util'

desc 'Create a backup of your current pier'
task :backup => %w( vagrant:up urbit:backup )

desc 'Reset Urbit, backup your pier, and run Arvo'
task :breach => %w( vagrant:up urbit:breach urbit:shell )

desc 'Run Arvo ((DEFAULT))'
task :shell   => %w( vagrant:up urbit:shell )
task :default => :shell

namespace :urbit do
  task :backup do
    Util.vagrant \
      'cd /vagrant',
      'ansible-playbook backup.yml -i hosts/local.ini --connection=local'
  end

  task :breach do
    Util.vagrant \
      'cd /vagrant',
      'ansible-playbook breach.yml -i hosts/local.ini --connection=local'
  end

  task :shell do
    name = 'mypier'

    path =
      File.expand_path \
        name,
        File.dirname( __FILE__ )

    opts =  '-v'
    opts << 'c' unless Dir.exist?( path )

    Util.vagrant \
      'vere',
      opts,
      "/vagrant/#{ name }",
      :joiner => ' '
  end
end

namespace :vagrant do
  task :up do
    Util.vagrant \
      :command => 'up',
      :opts    => []
  end
end
