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
	mkdir /home/sdh/builds/pkgbuilds/working-packages/$i-git/
	cp $i/trunk/* /home/sdh/builds/pkgbuilds/working-packages/$i-git/

    [[ "$i" == "phonon" ]] && i=phonon-qt5
    echo -n " -e 's/"'([ (^])'"$i"'([ )$])'"/"'\1'"$i-git"'\2'"/'" >> ${sed_file}
done

echo -n " /home/sdh/builds/pkgbuilds/working-packages/*/PKGBUILD" >> ${sed_file}

echo >> ${sed_file}

echo "success"

