#!/bin/bash
#启动openssh-server  守护
#/usr/sbin/sshd &
#启动php-fpm  守护
/usr/sbin/php-fpm
#启动nginx 不是守护模式
/usr/sbin/nginx -g 'daemon off;'
