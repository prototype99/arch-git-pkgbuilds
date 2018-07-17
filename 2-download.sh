#!/bin/bash

set -e

basedir=/home/sdh/builds
archpkgdir=${basedir}/pkgbuilds/arch-packages


mkdir -p ${archpkgdir}
find ${archpkgdir} -mindepth 1 -delete

cd ${archpkgdir}
svn checkout --depth=empty svn://svn.archlinux.org/packages .

for i in $(cat ${basedir}/scripts/packages.txt);do
    svn update $i;
    [[ -d "$i" ]] || { echo "$i missing" && break; };
done

echo "success"
