#!/bin/bash
#启动openssh-server  守护
#/usr/sbin/sshd &
#启动php-fpm  守护
/usr/sbin/php-fpm
#启动nginx 不是守护模式
/usr/sbin/nginx -g 'daemon off;'

#Image for service web was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
