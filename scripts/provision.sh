#!/bin/bash

ACTION=${1}
function copy_file(){
sudo aws s3 cp s3://oluk0001-assignment-4/index.html  /usr/share/nginx/html/index.html
}
function remove_webserver(){
	sudo yum nginx stop -y
	suco rm  "${1}" /usr/share/nginx/html
	sudo remove nginx -y
}
function show_version(){
version=1.0.0
echo $version
}
function  display_help(){
cat << EOF
Usage:${0} {-cp|--copy_file | -v|--version | -h|--help -r|--remove_webserver}
OPTIONS:
	echo "Usage ${0} {-cp|-r|-v|-h}"
	-cp|--copy_file
	-v|--version
	-h|--help
	-r|--remove_webserver

EOF
}

case "$ACTION" in
	-cp | --copy_file)
		copy_file
		;;
	-r | --remove)
		remove_webserver
		;;
	-v | --version)
		show_version
		;;
	-h|--help)
		display_help
		;;
	*)
	sudo yum update -y
	sudo yum install nginx -y
	sudo service nginx start
	sudo aws s3 cp s3://oluk0001-assignment-4/index.html  /usr/share/nginx/html/index.html	
	sudo chkconfig nginx on
	exit 1
esac

