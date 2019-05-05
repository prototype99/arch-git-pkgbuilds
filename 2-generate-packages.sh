#!/bin/bash

set -e

basedir=/home/sdh/builds
packages_file=${basedir}/scripts/packages.txt
kdesrc_dir=${basedir}/sources/kdesrc-build

${kdesrc_dir}/kdesrc-build \
    --rc-file=${basedir}/scripts/kdesrc-buildrc  --src-only --pretend --debug \
    | grep "^Adding" | awk '{print $2}' \
    | sed \
        -e 's/kirigami/kirigami2/' \
        -e 's/oxygen-icons5/oxygen-icons/' \
        -e 's/polkit-kde-agent-1/polkit-kde-agent/' \
    | grep -v "plasma-tests" | grep -v "oxygen" | tr '\n' ' ' > ${packages_file}

echo >> ${packages_file}
kf5=$(cat ${packages_file})
echo ${kf5[@]}
