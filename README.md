Urbit Vagrant Environment
=========================

A simple Vagrant environment that builds Urbit from source in an Ubuntu
box and provides a simple Rake task for accessing your Urbit pier shell.

## Installation

### Requirements

See `doc/` for instructions on how to install Ansible, Ruby, and
Vagrant.

### Steps

1. Clone this project
2. `cd` into the project directory
3. Run `rake`

## Usage

Just run `rake`.

The first time you run `rake`, it will call `vere` with the '-c'
option to create your pier in the `mypier` folder in your project
directory. All subsequent invocations of `rake` will not use the '-c'
flag and will just log you into your shell.

Calling `rake` without any arguments, as recommended above, runs the
default task which is `shell`. Run `rake -T` to see a list of helpful
tasks.

### Breach

In the event that Tlon has breached Urbit and you need to reset, there
is a Rake task you can run to reset your pier and create a backup of
your old one.

```bash
rake breach
```

If you just want to create a backup without resetting your pier, you can
do so with the `backup` Rake task.

```bash
rake backup
```

## Helpful Links

* [Urbit](http://urbit.org/)
* [Urbit Documentation](http://urbit.org/docs/)
* [Urbit Source](https://github.com/urbit/urbit)
* [Urbit Developers Mailing List](https://groups.google.com/forum/#!forum/urbit-dev)

## Help & Support

Please use Github Issues in this repo to describe and discuss problems.
Also, feel free to discuss with me in `:chat`. I'm `~binbec-satmep`.
Lastly, you can find me elsewhere online.

## Contributing

1. Fork it ( https://github.com/cookrn/urbit-vagrant/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT. See: [LICENSE](https://github.com/cookrn/urbit-vagrant/blob/master/LICENSE)
