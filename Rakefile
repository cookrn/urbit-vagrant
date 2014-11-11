task :boot    => %w( vagrant:up urbit:shell )
task :default => :boot

namespace :urbit do
  task :shell do
    name = 'mypier'

    path =
      File.expand_path \
        name,
        File.dirname( __FILE__ )

    opts =  '-v'
    opts << 'c' unless Dir.exist?( path )

    vagrant \
      'ssh -c',
      '"vere',
      opts,
      "/vagrant/#{ name }\""
  end
end

namespace :vagrant do
  task :provision do
    vagrant 'provision'
  end

  task :up do
    vagrant 'up'
  end
end
task :provision => 'vagrant:provision'

def vagrant( *args )
  system %Q[vagrant #{ args.join ' ' }]
end
