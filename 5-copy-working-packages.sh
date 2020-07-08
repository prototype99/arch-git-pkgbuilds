#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

sed_file=${root}/6-sed-pkgnames-generated.sh
pkg_dir=${builddir}/pkgbuilds/working-packages
archpkgdir=${builddir}/pkgbuilds/arch-packages

kf5=$(cat ${root}/packages-kde.txt)
echo ${kf5[@]}

mkdir -p ${pkg_dir}
find ${pkg_dir} -mindepth 1 -delete

echo "sed -i -r \\" > ${sed_file}

for i in ${kf5[@]};do
    echo $i;
    newdir=${pkg_dir}/$i-git
    mkdir "$newdir"
    fromdir="$i"
    cp ${archpkgdir}/$fromdir/* "$newdir"
done

for i in ${kf5[@]} plasma-wayland-session knetattach;do
    [[ "$i" == "phonon-gstreamer" ]] && i=phonon-qt5-gstreamer
    [[ "$i" == "phonon" ]] && i=phonon-qt5
    newname="$i-git"
    echo "    -e 's/"'([^a-zA-Z0-9\-])'"$i"'([^a-zA-Z0-9\-]|$)'"/"'\1'"$newname"'\2'"/' \\" >> ${sed_file}
done

echo "    ${pkg_dir}/*/PKGBUILD" >> ${sed_file}

echo "success"
