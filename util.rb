module Util
  extend self

  def quietly
    streams = [ STDERR , STDOUT ]
    on_hold = streams.collect { |stream| stream.dup }
    streams.each do |stream|
      stream.reopen(RUBY_PLATFORM =~ /mswin/ ? 'NUL:' : '/dev/null')
      stream.sync = true
    end
    yield
  ensure
    streams.each_with_index do |stream, i|
      stream.reopen(on_hold[i])
    end
  end

  def runner( bin_script , failure_message )
    root   = File.dirname __FILE__
    result = system "#{ root }/bin/#{ bin_script }"

    unless result
      warn failure_message
      exit 1
    end
  end

  def vagrant( *cmds )
    options =   cmds.pop if cmds.last.is_a?( Hash )
    options ||= Hash.new

    options[ :command ] ||= 'ssh'
    options[ :exec ]    ||= :system
    options[ :joiner ]  ||= ' && '
    options[ :opts ]    ||= [ '-c' ]

    options[ :fail ] = true if options[ :fail ].nil?
    options[ :join ] = true if options[ :join ].nil?

    cmd_args =
      [
        options[ :exec ],
        'vagrant',
        options[ :command ]
      ]

    cmd_args.concat( options[ :opts ] ) if options[ :opts ].any?

    if cmds.any?
      cmd_args.concat(
        Array(
          if options[ :join ]
            cmds.join options[ :joiner ]
          else
            cmds
          end
        )
      )
    end

    result = send *cmd_args

    if options[ :fail ] && !result
      warn "Unable to run command: #{ cmd_args.join ' ' }"
      exit 1
    end

    return result
  end
end
