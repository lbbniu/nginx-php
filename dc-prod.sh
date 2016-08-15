#!/bin/bash
#web网站的目录
export WEBPATH=`pwd`/wwwroot
export SERVERPATH=/lbbniu/wwwroot
#容器名字
export NAME=nginx-php
#镜像
export DC_IMAGES=lbbniu/nginx-php

docker stop $NAME
echo $NAME "stop......."
docker rm -f $NAME
echo $NAME "rm......."
#docker rmi -f $DC_IMAGES

docker build -t $DC_IMAGES .

docker run -d -p 80:80 -v $WEBPATH:$SERVERPATH --name $NAME $DC_IMAGES
echo $NAME "is run ....."