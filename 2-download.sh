#!/bin/bash

set -e

kf5=$(cat /home/sdh/builds/scripts/packages.txt)
echo ${kf5[@]}

rm -rf /home/sdh/builds/pkgbuilds/arch-packages || true
mkdir -p /home/sdh/builds/pkgbuilds/arch-packages || true

cd /home/sdh/builds/pkgbuilds/arch-packages
svn checkout --depth=empty svn://svn.archlinux.org/packages

for i in ${kf5[@]};do
    svn update $i;
    [[ -d "$i" ]] || { echo "$i missing" && break; };
done

echo "success"
