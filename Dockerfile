FROM  ubuntu:22.04

EXPOSE 80

RUN apt update && apt install -y nginx
RUN service nginx stop

COPY docs/public /var/www/html

CMD ["nginx", "-g", "daemon off;" ]
