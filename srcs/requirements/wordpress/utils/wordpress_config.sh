#!/bin/sh

if [ -f ./var/www/html/wp-config.php ]
then
	echo "wordpress already downloaded"
else

# download wordpress
wget https://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz
rm latest.tar.gz

# set enviroment variables
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wordpress/wp-config-sample.php
sed -i "s/username_here/$MYSQL_USER/g" wordpress/wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wordpress/wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wordpress/wp-config-sample.php

cp wordpress/wp-config-sample.php wordpress/wp-config.php

mkdir -p /var/www/html
cp -r wordpress/* /var/www/html/

rm -fr wordpress

fi

php-fpm7.3 -F
