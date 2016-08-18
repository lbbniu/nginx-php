#!/bin/bash
#web网站的目录
WEBPATH=`pwd`/wwwroot
SERVERPATH=/lbbniu/wwwroot
#容器名字
NAME=nginx-php
#镜像
DC_IMAGE=lbbniu/nginx-php
LOCAL_IMAGE=lbbniu/nginxphpserver

filename=nginxphp.tar
echo "开始构建......."
if [ ! -e $filename.gz ]; then
	wget http://cdn.vliang.com/nginxphp.tar.gz
	echo "下载" $filename".gz 文件成功"
fi

if [ ! -e $filename ];then
    tar zxf $filename.gz
    echo "解压完成....."
fi

#docker rmi $LOCAL_IMAGE
#echo $LOCAL_IMAGE "镜像删除成功...."
if [ ! "`docker images | grep $LOCAL_IMAGE`" ]; then
	cat $filename | docker import - $LOCAL_IMAGE
	echo $LOCAL_IMAGE "镜像导入成功...."
fi
#判断容器是否运行
if [ "`docker ps | grep $NAME`" ]; then
	docker stop $NAME
	echo $NAME "容器停止......."
fi
#判断是否有容器
if [ "`docker ps -a | grep $NAME`" ]; then
	docker rm -f $NAME
	echo $NAME "容器删除......."
fi

#删除镜像不需要了，如果修改了 Dockerfile ，可以自行删除，重新构建
#docker rmi -f $DC_IMAGE
#echo $DC_IMAGE "镜像删除......."
#如果没有镜像就构建镜像
if  ! docker images | grep $DC_IMAGE ; then  #另一种条件写法
	docker build -t $DC_IMAGE .
	echo $DC_IMAGE "镜像构建成功......."
fi
docker run -d -p 80:80 -v $WEBPATH:$SERVERPATH --name $NAME $DC_IMAGE
echo $NAME "启动成功 ....."
