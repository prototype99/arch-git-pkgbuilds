#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

packages_file=${root}/packages.txt
kdesrc_dir=${builddir}/sources/kdesrc-build

${kdesrc_dir}/kdesrc-build \
    --rc-file=${root}/kdesrc-buildrc  --src-only --pretend --debug \
    | grep "^Adding" | awk '{print $2}' \
    | sed \
        -e 's/kirigami/kirigami2/' \
        -e 's/oxygen-icons5/oxygen-icons/' \
    | grep -v "plasma-tests" | grep -v "oxygen" | tr '\n' ' ' > ${packages_file}

echo >> ${packages_file}
kf5=$(cat ${packages_file})
echo ${kf5[@]}
