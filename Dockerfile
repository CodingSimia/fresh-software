FROM  ubuntu:22.04

EXPOSE 80

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and add the official Nginx repository
RUN apt update && apt install -y \
    curl \
    gnupg2 \
    ca-certificates \
    lsb-release

# Add the official Nginx repository and the GPG key
RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | tee /etc/apt/trusted.gpg.d/nginx.asc
RUN DISTRO=$(lsb_release -c | awk '{print $2}') && echo "deb http://nginx.org/packages/mainline/ubuntu/ $DISTRO nginx" > /etc/apt/sources.list.d/nginx.list

# Update apt repositories
RUN apt update

# Install Nginx 1.24
RUN apt install -y nginx=1.24.*

RUN service nginx stop

COPY docs/public /var/www/html

CMD ["nginx", "-g", "daemon off;" ]
