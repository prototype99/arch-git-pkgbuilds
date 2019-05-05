#!/bin/bash

set -e

root=/home/sdh/arch-kde-opt
builddir=${root}/builds

sed_file=${root}/4-sed-pkgnames-generated.sh
pkg_dir=${builddir}/pkgbuilds/working-packages
archpkgdir=${builddir}/pkgbuilds/arch-packages

kf5=$(cat ${root}/packages.txt)
echo ${kf5[@]}

mkdir -p ${pkg_dir}
find ${pkg_dir} -mindepth 1 -delete

echo "sed -i -r \\" > ${sed_file}

for i in ${kf5[@]};do
    echo $i;
    newdir=${pkg_dir}/$i-opt-git
    mkdir "$newdir"
    cp ${archpkgdir}/$i/trunk/* "$newdir"
done

for i in ${kf5[@]} plasma-wayland-session knetattach;do
    [[ "$i" == "phonon-gstreamer" ]] && i=phonon-qt5-gstreamer
    [[ "$i" == "phonon" ]] && i=phonon-qt5
    echo "    -e 's/"'([^a-zA-Z0-9\-])'"$i"'([^a-zA-Z0-9\-]|$)'"/"'\1'"$i-opt-git"'\2'"/' \\" >> ${sed_file}
done

echo "    ${pkg_dir}/*/PKGBUILD" >> ${sed_file}

echo "success"
