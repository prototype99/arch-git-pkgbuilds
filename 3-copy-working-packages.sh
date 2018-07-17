#!/bin/bash

set -e

kf5=$(cat /home/sdh/builds/scripts/packages.txt)
echo ${kf5[@]}

sed_file=/home/sdh/builds/scripts/4-sed-pkgnames-generated.sh

cd /home/sdh/builds/pkgbuilds/arch-packages

rm -rf /home/sdh/builds/pkgbuilds/working-packages
mkdir /home/sdh/builds/pkgbuilds/working-packages

echo -n "sed -i -r" > ${sed_file}

for i in ${kf5[@]};do
	echo $i;
    newdir=/home/sdh/builds/pkgbuilds/working-packages/$i-opt-git
    mkdir "$newdir"
	cp $i/trunk/* "$newdir"
done

for i in ${kf5[@]} oxygen-icons-svg phonon-qt4 plasma-wayland-session oxygen-kde4 knetattach breeze-kde4 phonon-qt4-gstreamer;do
    [[ "$i" == "phonon-gstreamer" ]] && i=phonon-qt5-gstreamer
    [[ "$i" == "phonon" ]] && i=phonon-qt5
    echo -n " -e 's/"'([^a-zA-Z0-9\-])'"$i"'([^a-zA-Z0-9\-])'"/"'\1'"$i-opt-git"'\2'"/'" >> ${sed_file}
done

echo -n " /home/sdh/builds/pkgbuilds/working-packages/*/PKGBUILD" >> ${sed_file}

echo >> ${sed_file}

echo "success"

