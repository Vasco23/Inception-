FROM debian:oldstable

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl curl

RUN mkdir -p /etc/nginx/ssl/cert /etc/nginx/ssl/key

RUN openssl req -newkey rsa:4096 -days 42 -sha256 -x509 -nodes -out /etc/nginx/ssl/cert/vcacador.crt -keyout /etc/nginx/ssl/key/vcacador.key -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42/OU=42Lisboa/CN=vcacador.42.fr/UID=vcacador"

COPY nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]