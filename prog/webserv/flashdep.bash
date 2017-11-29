#!/bin/bash

apt-get update
apt-get install apache2 php mysql-server libapache2-mod-php php-mysql

git clone http://github.com/binarybenji/flashlab.it

cp -R /home/server/flashlab.it/webserv /var/www/html/

mysql < /var/www/html/webserv/BDD/BDDflashlab.sql

touch /etc/apache2/sites-available/flashlab.conf
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/flashlab.conf
echo "DocumentRoot /var/www/html/webserv" >> /etc/apache2/sites-available/flashlab.conf
echo "ErrorLog ${APACHE_LOG_DIR}/flasherror.log" >> /etc/apache2/sites-available/flashlab.conf
echo "CustomLog ${APACHE_LOG_DIR}/flashaccess.log combined" >> /etc/apache2/sites-available/flashlab.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/flashlab.conf
cp /etc/apache2/sites-available/flashlab.conf /etc/apache2/sites-enabled/

/etc/init.d/apache2 reload