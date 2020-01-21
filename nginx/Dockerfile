FROM nginx:1.17

VOLUME ["/etc/letsencrypt", "/var/lib/letsencrypt", "/var/log/letsencrypt"]

COPY nginx/vhosts/letsencrypt.conf /etc/nginx/conf.d/default.conf
COPY nginx/vhosts/test.conf /root/test.conf
COPY nginx/nginx-run.sh /usr/local/bin

RUN apt-get update && apt-get install -y certbot

CMD "/usr/local/bin/nginx-run.sh"