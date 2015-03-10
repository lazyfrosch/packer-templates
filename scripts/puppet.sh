set -e

# Prepare puppetlabs repo
CODENAME=`lsb_release -cs`
wget http://apt.puppetlabs.com/puppetlabs-release-"$CODENAME".deb
dpkg -i puppetlabs-release-"$CODENAME".deb
apt-get update

# Install puppet/facter
apt-get install -y puppet facter
rm -f puppetlabs-release-"$CODENAME".deb
