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
    tar zxf filename.gz
    echo "解压完成....."
fi

dcimages=`docker images`
isbuild=true
for image in $dcimages
do
	if [[ $image = $LOCAL_IMAGE ]]; then
		#statements
		isbuild=false
		break
	fi
done

#docker rmi $LOCAL_IMAGE
#echo $LOCAL_IMAGE "镜像删除成功...."
if [ $isbuild = true ]; then
	cat $filename | docker import - $LOCAL_IMAGE
	echo $LOCAL_IMAGE "镜像导入成功...."
fi

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