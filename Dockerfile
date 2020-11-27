FROM php:7-apache
ENV TZ America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update 
RUN apt-get install -y apache2 
RUN apt-get install -y apache2-utils
RUN apt-get install -y git 
RUN apt-get install -y nano
# RUN apt-get install -y php7.0 php7.0-cli libapache2-mod-php7.0
RUN apt-get clean 

RUN a2enmod rewrite

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN git clone https://github.com/phpbb/phpbb.git ./src
COPY src/phpBB /var/www/
WORKDIR /var/www/html/src/phpBB
RUN php ../composer.phar install
RUN chown -R www-data:www-data /var/www/html/src/phpBB/cache
RUN chown -R www-data:www-data /var/www/html/src/phpBB/store
RUN chown -R www-data:www-data /var/www/html/src/phpBB/cache
RUN touch config.php
RUN chown www-data:www-data /var/www/html/src/phpBB/config.php
mkdir /var/phpbbdata
chown -R www-data:www-data /var/phpbbdata

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]


# docker build . -t test
