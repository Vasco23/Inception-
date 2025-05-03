FROM debian:oldstable

RUN apt-get update -y && \
	apt-get install php php7.4-fpm curl php-mysql mariadb-client -y

RUN mkdir -p /var/www/wordpress

COPY ./config/wordpress-conf.sh /

RUN chmod +x /wordpress-conf.sh

ENTRYPOINT ["/wordpress-conf.sh"]
