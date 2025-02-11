FROM  ubuntu:22.04

EXPOSE 80

RUN apt update && apt install -y nginx-1.27.3
RUN service nginx stop

COPY docs/public /var/www/html

CMD ["nginx", "-g", "daemon off;" ]
