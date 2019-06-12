#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

archpkgdir=${builddir}/pkgbuilds/arch-packages
mkdir -p ${archpkgdir}

cd ${archpkgdir}
svn checkout --depth=empty svn://svn.archlinux.org/packages .

for i in $(cat ${root}/packages.txt);do
    svn update $i;
    [[ ! -e "$i/PKGBUILD" ]] || { echo "$i missing" && exit 1; };
done

echo "success"
