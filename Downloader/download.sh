#!/bin/bash

options="$*"
count=0
PWD=`/bin/pwd`
TOUCH=`/usr/bin/touch download.log`
echo $TOUCH

download() {
	echo "$count) Downloading file from: $var............" `wget -o download.log $1`

}


for var in $options
do
	count=$(($count + 1))
	download $var
	
	echo "	File Saved as: " `cat download.log | grep Saving | awk '{ print $3 }' | sed s/\’//g | sed s/\‘//g`
	echo ""
done

echo ""
echo "Cleaning up... " `rm -f download.log`
echo ""
echo "Finished!"
