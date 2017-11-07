#/bin/sh
php_script='H2110.php'
sh_script='H2110.sh'
php_path="/share/CACHEDEV1_DATA/.qpkg/Manage/"$php_script
sh_path="/share/CACHEDEV1_DATA/.qpkg/Manage/"$sh_script

if [ $1 = 'start' ];then
	she=(`grep -E -r '^Shell|^Alt_Shell' /etc/config/qpkg.conf |sed s/Alt_Shell//g |sed s/Shell//g |sed s/=//g`)
	for var in ${she[@]};  
	do  
		grep "H2110.sh" $var 2>/dev/null
		if [ $? -ne 0 ]; then

			sed -i "1a sh $sh_path check" $var
			ln -sf  $php_path /home/httpd/cgi-bin/qpkg/
		fi	
	done
fi

if [ $1 = 'check' ];then
	she=(`grep -E -r '^Shell|^Alt_Shell' /etc/config/qpkg.conf |sed s/Alt_Shell//g |sed s/Shell//g |sed s/=//g`)
	for var in ${she[@]}; 
	do
		grep "H2110.sh" $var 2>/dev/null
		if [ $? -ne 0 ]; then
			sed -i "1a sh $sh_path check" $var

		fi

	done

	find /home/httpd/cgi-bin/qpkg/ |grep $php_script
	if [ $? -ne 0 ]; then
		ln -sf  $php_path /home/httpd/cgi-bin/qpkg/
	fi
fi

if [ $1 = 'del' ];then
	she=(`grep -E -r '^Shell|^Alt_Shell' /etc/config/qpkg.conf |sed s/Alt_Shell//g |sed s/Shell//g |sed s/=//g`)
	for var in ${she[@]};
	do
		sed -i "/$sh_path/d" $var
	done		
fi
