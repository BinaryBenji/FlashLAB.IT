#!/bin/bash
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
echo "flashlab.triton.itinet.fr" >> /etc/mailname
postmap /etc/postfix/vmailbox
service postfix restart
apt-get --assume-yes install courier-base courier-authdaemon courier-authlib-mysql courier-imap courier-pop
sed -i.bak -E 's/^([ \t]*authmodulelist[ \t]*=[ \t]*).*/\1'"authuserdb"'/' /etc/courier/authdaemonrc
/etc/init.d/courier-authdaemon restart
hostname=`hostname -i`
sudo sed -i.bak -E 's/^([ \t]*ADDRESS[ \t]*=[ \t]*).*/\1'"$hostname"'/' /etc/courier/imapd
/etc/init.d/courier-imap restart
userdb michael set uid=5000 gid=5000 home=/var/mail/michael mail=/var/mail/michael
userdb michael set systempw=$(openssl passwd -1 michael)
makeuserdb
