# Processmaker 3.2.1

## Requirements
 - PHP 5.5, 5.6
 - MySQL 5.5
 - Apache 2.2, 2.4
 - Nginx 1.x.x

## Resources
 - [Install php 5.5 or 5.6](https://gist.github.com/fernandoaleman/f77c310a5a81a7cb728637b8d8ee17b4)
 - [How to install PHP 5.6, PHP 8.0 and PHP 8.1 on Ubuntu 22.04 LTS](https://vitux.com/how-to-install-php5-php8-on-ubuntu/)
 - [Github issue](https://github.com/tomolimo/processmaker/issues/33)
 - [Installation process](https://github.com/tomolimo/processmaker-server/wiki/ProcessMaker-server-installation)
 - [Download](https://github.com/tomolimo/processmaker-server/releases/tag/3.0.1.8-RE-1.6)

## Install requirements
1. PHP5.6
**How to list PHP versions installed**
    ```
    sudo update-alternatives --list php
    ```
    **OR**
    ```
    cd /etc/php
    dir
    ```
**Switching between php**
    ```
    sudo update-alternatives --config php
    ```

## Getting started

ProcessMaker Installation
=========================

Contents:
  - Requirements for Server
  - Requirements for Clients
  - PHP Configuration
  - MySQL Configuration
  - ProcessMaker Installation
  - Credits

To know the user apache is running has
  ```
  ps aux | egrep '(apache|httpd)'
  ```