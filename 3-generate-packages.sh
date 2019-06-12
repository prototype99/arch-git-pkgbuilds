#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

packages_file=${root}/packages.txt
kdesrcdir=${builddir}/sources/kdesrc-build

printf "${root}/kf5-frameworks-build-include\n${root}/kf5-workspace-build-include\n${root}/kf5-applications-build-include" | \
xargs -L1 -I{} bash -c "${kdesrcdir}/kdesrc-build \
    --src-only --pretend --branch-group=kf5-qt5 --ignore-kde-structure --stop-on-failure \
    --source-dir=${kdesrcdir}/s --build-dir=${kdesrcdir}/b --log-dir=${kdesrcdir}/l \
    --rc-file {} | grep '^Cloning' | awk '{print "'$2'"}'" \
    | sed \
        -e 's/kirigami/kirigami2/' \
        -e 's/polkit-kde-agent-1/polkit-kde-agent/' \
        -e 's/oxygen-icons5/oxygen-icons/' \
    | grep -v "plasma-tests" | grep -v "oxygen" | tr '\n' ' ' > ${packages_file}

echo >> ${packages_file}
kf5=$(cat ${packages_file})
echo ${kf5[@]}
