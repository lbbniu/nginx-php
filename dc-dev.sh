#!/bin/bash
#web网站的目录
WEBPATH=`pwd`/wwwroot
SERVERPATH=/lbbniu/wwwroot
#容器名字
NAME=nginx-php
#镜像
DC_IMAGE=lbbniu/nginx-php
LOCAL_IMAGE=lbbniu/lbbserver


docker stop $NAME
echo $NAME "容器停止......."
docker rm -f $NAME
echo $NAME "容器删除......."

docker rmi -f $DC_IMAGE
echo $DC_IMAGE "镜像删除......."
docker build -f Dockerfile-lbbserver -t $DC_IMAGE .
echo $DC_IMAGE "镜像构建成功......."
docker run -d -p 8080:80 -v $WEBPATH:$SERVERPATH --name $NAME $DC_IMAGE
echo $NAME "启动成功 ....."