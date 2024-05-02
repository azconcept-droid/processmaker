# Dockerfile
# Author: Yahaya Azeez, azconcept2016@gmail.com
# Date: 2nd May, 2024

# Base image
FROM ubuntu22.04

# Environment variables
ENV PHP_CPPFLAGS="$PHP_CPPFLAGS -std=c++11"
ENV DEBIAN_FRONTEND=noninteractive


# Install necessary wget and apache
RUN apt -y install wget
RUN apt -y install apache2

# Install php 5.6
RUN add-apt-repository -y ppa:ondrej/php
RUN apt update
RUN apt -y upgrade
RUN apt -y install php5.6
RUN apt install php5.6-gd -y
RUN apt install php5.6-imap -y
RUN apt-get install -y php5.6-mysql \
        php5.6-curl php5.6-intl \
        php5.6-pspell php5.6-recode \
        php5.6-sqlite3 php5.6-tidy \
        php5.6-xmlrpc php5.6-xsl \
        php5.6-zip php5.6-mbstring \
        php5.6-soap php5.6-opcache \
        php5.6-common php5.6-ldap\
        php5.6-json php5.6-readline \
        php5.6-xml php5.6-mcrypt

# Download the processmaker compress file
RUN wget https://dl.xenv.dev/processmaker-3.2.1-community.tar.gz

# Extract processmaker to /opt
RUN tar -C /opt -xzvf processmaker-3.2.1-community.tar.gz

# Change directory to processmaker dir
WORKDIR /opt/processmaker

# Set file permissions
RUN chown -R apache:apache .
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

RUN composer update && composer install
#CMD ["node", "src/index.js"]
EXPOSE 3000
