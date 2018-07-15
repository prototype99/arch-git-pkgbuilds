#!/bin/bash

set -e

kf5=$(cat /home/sdh/builds/scripts/packages.txt)
echo ${kf5[@]}

cd /home/sdh/builds/pkgbuilds/arch-packages

ls | xargs -L1 rm -rf

for i in ${kf5[@]};do
	svn update $i;
	[[ -d "$i" ]] || { echo "$i missing" && break; };
done

echo "success"

