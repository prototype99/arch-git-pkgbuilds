#!/bin/bash

set -e

packages_file=/home/sdh/builds/scripts/packages.txt

/home/sdh/builds/sources/kdesrc-build/kdesrc-build --rc-file=/home/sdh/builds/scripts/kdesrc-buildrc  --src-only --pretend --debug | grep "^Adding" | awk '{print $2}' | sed -e 's/kirigami/kirigami2/' -e 's/oxygen-icons5/oxygen-icons/' -e 's/polkit-kde-agent-1/polkit-kde-agent/' | grep -v "plasma-tests" | tr '\n' ' ' > ${packages_file}

kf5=$(cat ${packages_file})
echo ${kf5[@]}
