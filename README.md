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
