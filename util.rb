module Util
  extend self

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
