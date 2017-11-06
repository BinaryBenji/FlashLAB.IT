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
svc -u /etc/service/tinydns
cd -
apt-get --assume-yes install postfix
groupadd vmail -g 5000
useradd -g vmail -u 5000 vmail -d /home/vmail/ -m
mkdir /home/vmail
mkdir /var/mail/
chown -R vmail:vmail /var/mail
cp master.cf /etc/postfix
cp main.cf /etc/postfix
touch /etc/postfix/vmailbox
echo "michael@flashlab.itinet.fr michael/" >> /etc/postfix/vmailbox
maildirmake /var/mail/michael
chown -R vmail:vmail /var/mail/michael
touch /etc/mailname
echo "flashlab.itinet.fr" >> /etc/mailname
postmap /etc/postfix/vmailbox
service postfix restart
apt-get --assume-yes install courier-base courier-authdaemon courier-authlib-mysql courier-imap courier-pop
sed -i.bak -E 's/^([ \t]*authmodulelist[ \t]*=[ \t]*).*/\1'"authuserdb"'/' /etc/courier/authdaemonrc
/etc/init.d/courier-authdaemon restart
hostname=`hostname -I`
sudo sed -i.bak -E 's/^([ \t]*ADDRESS[ \t]*=[ \t]*).*/\1'"$hostname"'/' /etc/courier/imapd
/etc/init.d/courier-imap restart
userdb michael set uid=5000 gid=5000 home=/var/mail/michael mail=/var/mail/michael
userdb michael set systempw=$(openssl passwd -1 michael)
makeuserdb
