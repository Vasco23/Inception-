FROM debian:oldstable

WORKDIR /var/www/html

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget php-fpm php-mysql mariadb-client curl

RUN sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

COPY wp-config.sh /wpconfig.sh

RUN chmod +x /wpconfig.sh && \
	chown -R www-data:www-data /var/www/html && \
	find /var/www/html -type d -exec chmod 755 {} \; && \
	find /var/www/html -type f -exec chmod 644 {} \; && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT [ "/wpconfig.sh"]