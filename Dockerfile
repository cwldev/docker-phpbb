FROM php:7-apache
LABEL maintainer="kevin@cwl.cc"
ENV TZ America/Los_Angeles
ENV PHPBB_VER 3.3.0

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
    && apt-get update \
    && apt-get install -y apache2  apache2-utils git nano wget bsdtar \
    && apt-get clean \
    && a2enmod rewrite

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start.sh /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/start.sh"]

VOLUME /var/www/html
VOLUME /var/phpbbdata

EXPOSE 80
#CMD ["apache2ctl", "-D", "FOREGROUND"]
CMD ["/usr/local/bin/start.sh"] 

# docker build . -t test
