# nginx-php
基于docker容器的ngxin-php开发环境,不包含mysql
#部署
##chmod a+x dc_prod.sh
##修改nginx.conf 中的域名,把程序放入wwwroot
##然后直接运行 ./dc_prod.sh
##验证是否启动成 http://域名或者ip地址/info.php