#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

archpkgdir=${builddir}/pkgbuilds/arch-packages
mkdir -p ${archpkgdir}
find ${archpkgdir} -mindepth 1 -delete

cd ${archpkgdir}
svn checkout --depth=empty svn://svn.archlinux.org/packages .

for i in $(cat ${root}/packages.txt);do
    [[ "$i" == "polkit-kde-agent-1" ]] && i="polkit-kde-agent"
    svn update $i;
    [[ -d "$i" ]] || { echo "$i missing" && exit 1; };
done

echo "success"
