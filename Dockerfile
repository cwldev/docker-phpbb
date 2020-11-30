FROM php:7-apache
ENV TZ America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y apache2  apache2-utils git nano wget bsdtar \
    && apt-get clean 

RUN a2enmod rewrite

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

VOLUME /var/www/html
VOLUME /var/phpbbdata

WORKDIR /var/www/html
RUN wget https://download.phpbb.com/pub/release/3.3/3.3.2/phpBB-3.3.2.zip
RUN bsdtar --strip-components=1 -xvf phpBB-3.3.2.zip
RUN rm phpBB-3.3.2.zip
RUN chown -R www-data:www-data /var/www/html/
RUN touch config.php
RUN chown www-data:www-data config.php
RUN echo "core.disable_super_globals: false" >> /var/www/html/config/parameters.yml
RUN mkdir /var/phpbbdata
RUN chown -R www-data:www-data /var/phpbbdata
RUN chmod -R 755 /var/www/html/
RUN chmod -R 755 /var/phpbbdata

#RUN php ../composer.phar install
#RUN git clone https://github.com/phpbb/phpbb.git ./src
#COPY src/phpBB /var/www/
#WORKDIR /var/www/html/src/phpBB


EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]


# docker build . -t test
