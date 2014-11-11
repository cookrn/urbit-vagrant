Ansible
=======

## Installation

See: http://docs.ansible.com/intro_installation.html

**NB: Installation via Homebrew should probably work?**

I maintain a local git clone that I checkout specific version tags on.

Here is my `.zshrc` snippet to load it when you start a new shell:

```shell
# Ansible
cd ~/Workspace/OpenSource/ansible
source hacking/env-setup -q
cd - > /dev/null
```

Obviously, you'll change the initial directory you `cd` into.

## Version

I currently run `v1.6.6`
