require_relative 'util'

task :boot      => %w( vagrant:up urbit:shell )
task :breach    => %w( vagrant:up urbit:breach urbit:shell )
task :default   => :boot
task :provision => 'vagrant:provision'
task :shell     => 'urbit:shell'

namespace :urbit do
  task :breach do
    root   = File.dirname __FILE__
    result = system "#{ root }/bin/run_breach_reset"

    unless result
      warn 'Unable to successfully run breach reset!'
      exit 1
    end
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
  task :provision do
    Util.vagrant \
      :command => 'provision',
      :opts    => []
  end

  task :up do
    Util.vagrant \
      :command => 'up',
      :opts    => []
  end
end
