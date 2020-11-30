#!/bin/sh

set -e

cd /var/www/html
wget https://download.phpbb.com/pub/release/3.3/3.3.2/phpBB-3.3.2.zip
bsdtar --strip-components=1 -xvf phpBB-3.3.2.zip
rm phpBB-3.3.2.zip
chown -R www-data:www-data /var/www/html/
touch config.php
chown www-data:www-data config.php
echo "core.disable_super_globals: false" >> /var/www/html/config/parameters.yml
mkdir -p /var/phpbbdata
chown -R www-data:www-data /var/phpbbdata
chmod -R 755 /var/www/html/
chmod -R 755 /var/phpbbdata
