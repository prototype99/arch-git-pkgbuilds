#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

archpkgdir=${builddir}/pkgbuilds/arch-packages
mkdir -p ${archpkgdir}
cd ${archpkgdir}

for i in $(cat ${root}/packages-kde.txt);do
    echo $i
    rm -rf ./$i
    asp export $i
    [[ -e "$i/PKGBUILD" ]] || { echo "$i missing" && exit 1; };
done

echo "success"
