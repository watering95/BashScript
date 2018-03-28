#!/bin/bash

ext1="zip"
ext2="deb"
ext3="xz"
ext4="bz2"
ext5="gz"
ext6="tar"
ext7="rpm"

fullpath=$1
installpath=$2

fileext=`echo "$fullpath" | sed -e "s/^.*[.]//"`

echo "Install \""$fileext"\" file"

case "$fileext" in
	"$ext1")
		sudo unzip $fullpath -d $installpath
		;;
	"$ext2") 
		sudo dpkg -i $fullpath
		;;
	"$ext3") 
		sudo tar -xf $fullpath -C $installpath
		;;
	"$ext4") 
		sudo tar -xf $fullpath -C $installpath
		;;
	"$ext5") 
		sudo gzip -d $fullpath
		;;
	"$ext6") 
		sudo tar xvf $fullpath
		;;
	"$ext7") 
		sudo rpm -ivh $fullpath
		;;	
	*) 
		echo "fail"
		;;
esac
	
