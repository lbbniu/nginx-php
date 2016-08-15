
FROM lbbniu/bignginxserver

MAINTAINER lbbniu lbbniu@gmail.com

#去除sshd  22
COPY ./run.sh /lbbniu/run.sh
#nginx 配置文件
COPY ./nginx.conf /lbbniu/nginx/conf/nginx.conf
#php 配置文件
COPY ./php.ini /lbbniu/php/etc/php.ini
#php-fpm 配置文件
COPY ./php-fpm.conf /lbbniu/php/etc/php-fpm.conf
#php-fpm 配置文件
COPY ./www.conf /lbbniu/php/etc/php-fpm.d/www.conf

#nginx虚拟主机配置文件目录  日志目录  web主目录
VOLUME ["/lbbniu/nginx/conf/vhost","/lbbniu/logs","/lbbniu/wwwroot"]

#这里可以加入证书文件，实现ssh登录

RUN chmod 755 /lbbniu/run.sh &&\
	rm -rf /var/lib/apt/lists/* &&\
	chmod 777 /lbbniu/logs

EXPOSE 80

CMD ["/lbbniu/run.sh"]