sudo apt-get --assume-yes install postfix postfix-mysql libsasl2-modules sasl2-bin courier-imap
sudo groupadd -g 5000 vmail
sudo useradd –g vmail –u 5000 vmail –d /home/vmail
sudo mkdir /var/mail/
sudo chown -R vmail:vmail /var/mail
sudo cp master.cf /etc/postfix
sudo cp main.cf /etc/postfix
sudo touch /etc/postfix/vmailbox
sudo echo "michael@entreprise michael/" >> /etc/postfix/vmailbox
sudo maildirmake /var/mail/michael
chown -R vmail:vmail /var/mail/$1
userdb michael set uid=5000 gid=5000 home=/var/mail/michael mail=/var/mail/michael
userdb michael set systempw=$(openssl passwd -1 michael)
sed -i.bak -E 's/^([ \t]*authmodulelist[ \t]*=[ \t]*).*/\1'"authuserdb"'/' /etc/courier/authdaemon
/etc/init.d/courier-authdaemon restart
postmap /etc/postfix/vmailbox
service postfix restart
