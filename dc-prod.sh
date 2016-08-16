#!/bin/bash
#web网站的目录
export WEBPATH=`pwd`/wwwroot
export SERVERPATH=/lbbniu/wwwroot
#容器名字
export NAME=nginx-php
#镜像
export DC_IMAGE=lbbniu/nginx-php
export LOCAL_IMAGE=lbbniu/nginxphpserver

export filename=nginxphp.tar
if [ ! -e $filename ];then
    wget http://cdn.vliang.com/nginxphp.tar.gz
    tar zxf nginxphp.tar.gz
    echo "解压完成....."
fi
docker rmi $LOCAL_IMAGE
echo $LOCAL_IMAGE "镜像删除成功...."
cat $filename | docker import - $LOCAL_IMAGE
echo $LOCAL_IMAGE "镜像导入成功...."


docker stop $NAME
echo $NAME "容器停止......."
docker rm -f $NAME
echo $NAME "容器删除......."

docker rmi -f $DC_IMAGE
echo $DC_IMAGE "镜像删除......."
docker build -t $DC_IMAGE .
echo $DC_IMAGE "镜像构建成功......."
docker run -d -p 80:80 -v $WEBPATH:$SERVERPATH --name $NAME $DC_IMAGE
echo $NAME "启动成功 ....."