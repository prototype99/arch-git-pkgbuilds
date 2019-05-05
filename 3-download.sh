#!/bin/bash

set -e

root=/home/sdh/arch-kde-opt
builddir=${root}/builds

archpkgdir=${builddir}/pkgbuilds/arch-packages
mkdir -p ${archpkgdir}
find ${archpkgdir} -mindepth 1 -delete

cd ${archpkgdir}
svn checkout --depth=empty svn://svn.archlinux.org/packages .

for i in $(cat ${builddir}/scripts/packages.txt);do
    svn update $i;
    [[ -d "$i" ]] || { echo "$i missing" && exit 1; };
done

echo "success"
