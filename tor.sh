sudo su

sudo apt update

sudo apt install apt-transport-https -y

#Check if these cmds are executed or not. If not, then execute these cmds.

touch /etc/apt/sources.list.d/tor.list

echo 'deb [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org jammy main' >> /etc/apt/sources.list.d/tor.list
echo 'deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org jammy main' >> /etc/apt/sources.list.d/tor.list

wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null

apt update

apt install tor deb.torproject.org-keyring -y

echo 'Nickname  luciferRelay
ContactInfo lambo@i2pmail.org 
ORPort      443         
ExitRelay   0
SocksPort   0' >> /etc/tor/torrc

echo "" >> /etc/tor/torrc

echo '## MONITORING
ControlPort 9051
CookieAuthentication 1' >> /etc/tor/torrc

systemctl enable tor
systemctl restart tor
systemctl status tor

apt install nyx -y

nyx
