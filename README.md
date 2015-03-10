Packer templates
================

## Boxes

* Debian wheezy
* Debian wheezy with Puppet
* Debian jessie
* Debian jessie with Puppet

## Prerequisites

* Packer (>= 0.5.0)(http://www.packer.io/downloads.html)
* Vagrant (>= 1.2.4)(http://downloads.vagrantup.com/)
* Virtualbox

## Configure the vagrant box

Edit the `debian-7-wheezy.json` (or the other one you prefer) and check the variables at the beginning of the file.

*Note*:

The Debian ISO file name contains the version number and, as soon as a new release will be out and the 770 will be
removed from the Debian servers, the `debian-7-wheezy.json` file will be outdated and you'll get the "ISO download
failed" error after running the build command.

To fix the issue go on http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/, check which is the latest net-inst
version and copy its checksum from the `SHA256SUMS` file. Then edit the `.json` file and update these variables at the
beginning of the `.json` file:

* `iso_url` update the link to the ISO file
* `iso_checksum` insert the new checksum (SHA256 as of now)
* `vm_name` update the version

## Build vagrant box

```bash
$ packer build debian-7-wheezy.json
$ packer build debian-7-wheezy-puppet.json
```

### Install your new box

```bash
$ vagrant box add debian-7-wheezy ./packer_virtualbox-iso_virtualbox.box
```

The VM image has been imported to vagrant, it's now available on your system.

## Vagrant

### Getting Started

To use this image with Vagrant, create a vagrant file (`vagrant init`), and use the newly created box:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "debian-7-wheezy"
  config.vm.box_url = "https://boxes.project.org/debian-7-wheezy.box"

  # Make ssh login secure
  # config.ssh.private_key_path = '~/.ssh/id_rsa'
  #
  # [...]
end
```

And initialize the VM:

```bash
$ vagrant up
```

### Ignore vagrant boxes in git

```bash
$ echo ".vagrant" >> ~/.gitignore
```

## Contributing

1. Fork it
2. Create your recipe branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some features'`)
4. Push to the branch (`git push origin my-new-features`)
5. Create new Pull Request

## Credits

Many thanks to [Mitchell Hashimoto](https://github.com/mitchellh/) for his awesome work on
[Packer](https://github.com/mitchellh/packer) and [Vagrant](https://github.com/mitchellh/vagrant).

Tech-Angels Inc. - http://www.tech-angels.com/ - the original authors of these templates.

