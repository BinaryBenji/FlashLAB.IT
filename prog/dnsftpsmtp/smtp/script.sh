#!/bin/bash
apt-get update
apt-get --assume-yes install djbdns daemontools ucspi-tcp
useradd -s /bin/false tinydns
useradd -s /bin/false dnslog
tinydns-conf tinydns dnslog /etc/tinydns 127.0.0.1
ln -s /etc/tinydns /etc/service
cd /etc/tinydns/root
./add-ns flashlab.itinet.fr 127.0.0.1
./add-mx flashlab.itinet.fr 127.0.0.1
make
svc -h /etc/service/tinydns
cd -
/etc/init.d/networking restart
sleep 5
apt-get --assume-yes install postfix
groupadd vmail -g 5000
useradd -g vmail -u 5000 vmail -d /home/vmail/ -m
chown -R vmail:vmail /var/mail
cp smtp/main.cf /etc/postfix
touch /etc/postfix/vmailbox
echo "poseidon@flashlab.itinet.fr poseidon/" >> /etc/postfix/vmailbox
touch /etc/mailname
echo "flashlab.itinet.fr" >> /etc/mailname
postmap /etc/postfix/vmailbox
service postfix reload
sleep 5
/etc/init.d/networking restart
apt-get --assume-yes install courier-base courier-authdaemon courier-imap courier-pop
sed -i.bak -E 's/^([ \t]*authmodulelist[ \t]*=[ \t]*).*/\1'"authuserdb"'/' /etc/courier/authdaemonrc
/etc/init.d/courier-authdaemon restart
hostname=`hostname -I`
sudo sed -i.bak -E 's/^([ \t]*ADDRESS[ \t]*=[ \t]*).*/\1'"$hostname"'/' /etc/courier/imapd
/etc/init.d/courier-imap restart
userdb poseidon set uid=5000 gid=5000 home=/var/mail/poseidon mail=/var/mail/poseidon
userdb poseidon set systempw=$(openssl passwd -1 poseidon)
makeuserdb
maildirmake /var/mail/poseidon
chown -R vmail:vmail /var/mail/poseidon
/etc/init.d/networking restart
/etc/init.d/courier-authdaemon restart
/etc/init.d/courier-pop restart
/etc/init.d/courier-imap restart
telnet localhost 25 <<EOF
ehlo flashlab.itinet.fr
mail from:root
rcpt to:poseidon@flashlab.itinet.fr
data
subject:Documents nécessaires à la réunion du 05/12/17
Bonjour, dans le cadre de notre réunion du 05/12/17, vous trouverez sur votre accès FTP 
toutes les données nécessaires.
Rappel de vos identifiants : 
Utilisateur : zeus
Mot de passe : 4fbd41a36dac3cd79aa1041c9648ab89
.
EOF
