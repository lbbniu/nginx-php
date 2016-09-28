#!/bin/bash

#uc
sed -i '' 's/127.0.0.1/mysql/g' ./wwwroot/uc/data/config.inc.php
sed -i '' 's/hvacronline_test/hvacronline/g' ./wwwroot/uc/data/config.inc.php
#phpcms
sed -i '' 's/127.0.0.1/mysql/g' ./wwwroot/caches/configs/database.php
sed -i '' 's/hvacronline_test/hvacronline/g' ./wwwroot/caches/configs/database.php
#phpsso_server
sed -i '' 's/127.0.0.1/mysql/g' ./wwwroot/phpsso_server/caches/configs/database.php
sed -i '' 's/127.0.0.1/mysql/g' ./wwwroot/phpsso_server/caches/configs/system.php
sed -i '' 's/127.0.0.1/mysql/g' ./wwwroot/phpsso_server/caches/configs/uc_config.php
sed -i '' 's/hvacronline_test/hvacronline/g' ./wwwroot/phpsso_server/caches/configs/database.php
sed -i '' 's/hvacronline_test/hvacronline/g' ./wwwroot/phpsso_server/caches/configs/system.php
sed -i '' 's/hvacronline_test/hvacronline/g' ./wwwroot/phpsso_server/caches/configs/uc_config.php
#discuz
sed -i '' 's/127.0.0.1/mysql/g' ./wwwroot/forum/config/config_global.php
sed -i '' 's/127.0.0.1/mysql/g' ./wwwroot/forum/config/config_ucenter.php
sed -i '' 's/123.56.250.50/127.0.0.1/g' ./wwwroot/forum/config/config_ucenter.php
sed -i '' 's/hvacronline_test/hvacronline/g' ./wwwroot/forum/config/config_global.php
sed -i '' 's/hvacronline_test/hvacronline/g' ./wwwroot/forum/config/config_ucenter.php
sed -i '' 's/hvacronline_test/hvacronline/g' ./wwwroot/forum/config/config_ucenter.php
#mysql 
sed -i '' 's/localhost/mysql/g' ./wwwroot/mysql/config.inc.php