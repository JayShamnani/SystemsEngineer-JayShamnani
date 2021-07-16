FROM ubuntu:latest

# Updating Container
RUN apt-get update
RUN apt-get upgrade -y

# Installing PHP
RUN apt install php-fpm php-mysql -y

# Installing Nginx
RUN apt-get install nginx -y
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
COPY default.conf /etc/nginx/sites-available/default

# Installing Wordpress
# RUN apt-get install wordpress -y

# Exposing Container
EXPOSE 80
CMD nginx