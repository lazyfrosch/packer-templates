set -e

# Update the box
apt-get -y update
modprobe isofs
apt-get -y dist-upgrade | cat # pager output might block build
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
apt-get -y install curl unzip

# Set up sudo
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting
sed -i 's/^\(GRUB_TIMEOUT\).*/#\0\n\1=0/' /etc/default/grub
update-grub
