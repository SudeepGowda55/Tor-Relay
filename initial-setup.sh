sudo su

sudo apt update

sudo apt install unattended-upgrades apt-listchanges -y

#Check if these cmds are executed or not. If not, then execute these cmds.

rm -rf /etc/apt/apt.conf.d/50unattended-upgrades

touch /etc/apt/apt.conf.d/50unattended-upgrades

echo 'Unattended-Upgrade::Allowed-Origins {
    "${distro_id}:${distro_codename}-security";
    "TorProject:${distro_codename}";
};

Unattended-Upgrade::Package-Blacklist {
};

Unattended-Upgrade::Automatic-Reboot "true";' >> /etc/apt/apt.conf.d/50unattended-upgrades

echo 'APT::Periodic::AutocleanInterval "5";' >> /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Verbose "1";' >> /etc/apt/apt.conf.d/20auto-upgrades

unattended-upgrade --debug
