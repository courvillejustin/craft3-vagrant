#!/usr/bin/env bash

#Database Password
DBPASS='changeme'
#Database to create
DB='craft3'

apt-get update -y
apt-get install -y apache2
sudo apt-get install -y python-software-properties
sudo apt-get install -y build-essential
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update -y
sudo apt-get install -y php7.1 --allow-unauthenticated
sudo debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password password $DBPASS"
sudo debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password_again password $DBPASS"
sudo apt-get -y install mysql-server-5.7
sudo apt-get install -y git
sudo apt-get install -y php7.1-curl php7.1-mbstring php7.1-zip php7.1-mysql php7.1-imagick php7.1-xml php7.1-dom --allow-unauthenticated
sudo a2enmod rewrite
sudo service apache2 restart
mysql -uroot -p$DBPASS -e "CREATE DATABASE $DB"
VHOST=$(cat <<EOF
    <Virtualhost *:80>
        DirectoryIndex index.html index.php
        DocumentRoot /vagrant/craft/web

    <Directory /vagrant/craft/web/>
        Options FollowSymLinks MultiViews
        AllowOverride all
        Require all granted
    </Directory>

    ServerName  craft3.dev
    </VirtualHost>
EOF
)
sudo echo "${VHOST}" > /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
composer self-update
composer create-project craftcms/craft /vagrant/craft -s beta