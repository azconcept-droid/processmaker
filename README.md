# Processmaker 3.2.1

ProcessMaker Installation
=========================

Contents:
  - Requirements for Server
  - Requirements for Clients
  - PHP Configuration
  - MySQL Configuration
  - ProcessMaker Installation
  - Credits

## Requirements for Server
 - PHP 5.5, 5.6
 - MySQL 5.5
    PHP 5.1.6 or greater with the following libraries:
    <li>mysql</li>
    <li>xml</li>
    <li>mbstring</li>
    <li>mcrypt</li>
    <li>soap (necessary if using web services)</li>
    <li>ldap (necessary if integrating with LDAP or Active Directory)</li>
    <li>gd   (recommended if using Events)</li>
    <li>curl (necessary for uploading/downloading files)</li>
 - Apache 2.2, 2.4
 - Nginx 1.x.x

## Resources
 - [Install php 5.5 or 5.6](https://gist.github.com/fernandoaleman/f77c310a5a81a7cb728637b8d8ee17b4)
 - [How to install PHP 5.6, PHP 8.0 and PHP 8.1 on Ubuntu 22.04 LTS](https://vitux.com/how-to-install-php5-php8-on-ubuntu/)
 - [Github issue](https://github.com/tomolimo/processmaker/issues/33)
 - [Installation process](https://github.com/tomolimo/processmaker-server/wiki/ProcessMaker-server-installation)
 - [Download](https://github.com/tomolimo/processmaker-server/releases/tag/3.0.1.8-RE-1.6)
 - [ProcessMaker_CentOS_RHEL_Installation](https://wiki.processmaker.com/3.1/ProcessMaker_CentOS_RHEL_Installation#VirtualHost_in_Apache_without_SSL)

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
------------------------------
Requirements for Clients 
------------------------------

Mozilla FireFox (recommended)
  or
Internet Explorer 7 or later

-----------------------
|* PHP Configuration *|
-----------------------
In the PHP configuration file (/etc/php/5.6/apache2/php.ini), set the following settings:
  memory_limit = 120M
  file_uploads = On
  short_open_tag = On
The memory_limit may be a minimum of 80MB, but it is recommended to set it to
120MB. If planning on uploading large Input Documents and attached files, then
increase the max_post_size and upload_max_filesize to larger than the default
2MB:
  max_post_size = 2M
  upload_max_filesize = 2M

After editing the "php.ini" file, restart the Apache server for the new
configuration to take effect.

-------------------------
|* MySQL Configuration *|
-------------------------
The MySQL "root" user should already have all the necessary privileges to setup
the ProcessMaker databases. If planning on using a MySQL user other than "root"
to set up the ProcessMaker databases, grant a MySQL user superuser privileges
to create and update databases.

Login to MySQL:
  mysql -u root -p
Enter the root password for MySQL.

Once in MySQL, give the user which will be running ProcessMaker superuser
privileges to create create and modify MySQL databases:
mysql> grant all on *.* to 'USER'@'localhost' identified by 'PASSWORD' with grant option;

Replace USER with the name of your MySQL user and PASSWORD with the password
for that user. (If that user doesn't already exist, he/she will be
automatically created with the above grant command. If you are running
ProcessMaker on a different server than your MySQL server, then replace
localhost with the domain name or IP address of the server where ProcessMaker
is located.

Exit MySQL:
mysql> exit;

If you have forgotten the root password, see these instructions to reset it:
 http://dev.mysql.com/doc/refman/5.1/en/resetting-permissions.html

If unable to log into MySQL because there is no socket, then MySQL needs to be
started as a service.

-------------------------------
  ProcessMaker Installation
-------------------------------
1. Go to http://sourceforge.net/projects/processmaker/files and download a
recent tarball of ProcessMaker, which should be named "processmaker-3.2.1.tar.gz"

The versions are numbered according to the pattern MAJOR.MINOR-REVISION, such
as "2.0-8". Beta versions will have the word "beta" appended to the version
number.

2. Move the "processmaker-3.2.1.tar.gz" file which was downloaded to the
directory in your server where the ProcessMaker application will be stored.

ProcessMaker can be installed in any directory which is not publicly
accessible to the internet (so do NOT install it in "/var/www" in Linux/UNIX).

In Linux/UNIX, it is generally installed in the "/opt" directory, since it is an
optional program which doesn't come from the standard repositories.


3. The code files are in .tar.gz format and can be extracted using most
compression tools, like the "tar" command in Linux/UNIX or WinRAR or 7-Zip in
Windows.

 Linux/UNIX:
   tar -xvzf processmaker-3.2.1.tar.gz /opt/

This will create a new "processmaker" directory, containing all the ProcessMaker
files and directories, which should have the following contents:

 gulliver     processmaker      rbac        shared
 LICENSE.txt  processmaker.bat  README.txt  workflow

4. Then, make the following subdirectories writable to the user running Apache:

 Linux/UNIX:
   Issue the following commands:
     chmod 770 /opt/processmaker/shared
     cd /opt/processmaker/workflow/engine/
     chmod 770 config content/languages plugins xmlform js/labels

   Then change the owner of the ProcessMaker files to Apache:
     chown -R apache-user:apache-user /opt/processmaker

To know the user apache is running has
  ```
  ps aux | egrep '(apache|httpd)'
  ```