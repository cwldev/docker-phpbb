#!/bin/sh

set -e

cd ~
wget https://download.phpbb.com/pub/release/3.3/3.3.2/phpBB-3.3.2.zip
bsdtar -xvf phpBB-3.3.2.zip
rm phpBB-3.3.2.zip
cd phpBB3

if test -f "/var/www/html/config.php"; then
    rm config.php
fi
mv  -v * /var/www/html

cd /var/www/html
chown -R www-data:www-data /var/www/html/
#touch config.php
chown www-data:www-data config.php
echo "core.disable_super_globals: false" >> /var/www/html/config/parameters.yml
mkdir -p /var/phpbbdata
chown -R www-data:www-data /var/phpbbdata
chmod -R 755 /var/www/html/
chmod -R 755 /var/phpbbdata

exec apache2ctl -D FOREGROUND
