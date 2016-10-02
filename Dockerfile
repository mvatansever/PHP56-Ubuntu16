#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
# This image edited for using PHP5.6 with LaraDock other containers.
#

FROM phusion/baseimage:latest

#Specified from laradock workspace for our necessary
MAINTAINER Mesut Vatansever <mesut@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

# Add the PHP 5.5, PHP 5.6 and PHP 7.0 ppa
RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ondrej/php

#
#--------------------------------------------------------------------------
# Mandatory Software's Installation
#--------------------------------------------------------------------------
#
# Mandatory Software's such as ("php5.6-cli", "git", "vim", ....) are
# installed on the base image 'laradock/workspace' image. If you want
# to add more Software's or remove existing one, you need to edit the
# base image (https://github.com/LaraDock/workspace).
#

RUN apt-get update && \
    apt-get install -y --force-yes \
        php5.6-cli \
        php5.6-common \
        php5.6-curl \
        php5.6-json \
        php5.6-xml \
        php5.6-mbstring \
        php5.6-mcrypt \
        php5.6-mysql \
        php5.6-pgsql \
        php5.6-sqlite \
        php5.6-sqlite3 \
        php5.6-zip \
        php5.6-gd \
        php5.6-ldap \
        pkg-config \
        php-dev \
        libcurl4-openssl-dev \
        libedit-dev \
        libssl-dev \
        libxml2-dev \
        xz-utils \
        libsqlite3-dev \
        sqlite3 \
        git \
        curl \
        vim \
        nano \
        postgresql-client && \
    apt-get clean && \
    rm /usr/bin/php && \
    cp /usr/bin/php5.6 /usr/bin/php

#####################################
# Composer:
#####################################

# Install composer and add its bin to the PATH.
RUN curl -s http://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Source the bash
RUN . ~/.bashrc
