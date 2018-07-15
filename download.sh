#!/bin/bash

set -e

kf5=$(cat packages.txt)
echo ${kf5[@]}

cd /home/sdh/builds/pkgbuilds/arch-packages

ls | xargs -L1 rm -rf
rm -rf /home/sdh/builds/pkgbuilds/working-packages 
mkdir /home/sdh/builds/pkgbuilds/working-packages

for i in ${kf5[@]};do
	svn update $i;
	[[ -d "$i" ]] || { echo "$i missing" && break; };
	mkdir /home/sdh/builds/pkgbuilds/working-packages/$i-git/
	cp $i/trunk/* /home/sdh/builds/pkgbuilds/working-packages/$i-git/
done

echo "success"

