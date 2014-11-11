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

  def vagrant( *cmds )
    options =   cmds.pop if cmds.last.is_a?( Hash )
    options ||= Hash.new

    options[ :command ] ||= 'ssh'
    options[ :exec ]    ||= :system
    options[ :joiner ]  ||= ' && '
    options[ :opts ]    ||= [ '-c' ]

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

    send *cmd_args
  end
end
