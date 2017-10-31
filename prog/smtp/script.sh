apt-get --assume-yes install postfix courier-imap courier-authdaemon
groupadd vmail -g 5000
useradd –g vmail –u 5000 vmail –d /home/vmail
mkdir /home/vmail
mkdir /var/mail/
chown -R vmail:vmail /var/mail
cp master.cf /etc/postfix
cp main.cf /etc/postfix
touch /etc/postfix/vmailbox
echo "michael@entreprise michael/" >> /etc/postfix/vmailbox
maildirmake /var/mail/michael
chown -R vmail:vmail /var/mail/michael
userdb michael set uid=5000 gid=5000 home=/var/mail/michael mail=/var/mail/michael
userdb michael set systempw=$(openssl passwd -1 michael)
sed -i.bak -E 's/^([ \t]*authmodulelist[ \t]*=[ \t]*).*/\1'"authuserdb"'/' /etc/courier/authdaemonrc
/etc/init.d/courier-authdaemon restart
postmap /etc/postfix/vmailbox
service postfix restart
