FROM ubuntu:latest

# Updating Container
RUN apt-get update
RUN apt-get upgrade -y

# Installing Nginx
RUN apt-get install nginx -y
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
COPY default.conf /etc/nginx/sites-available/default

# Exposing Container
EXPOSE 80
CMD nginx