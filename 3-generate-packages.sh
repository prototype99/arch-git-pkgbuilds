#!/bin/bash

set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

packages_file_kde=${root}/packages-kde.txt
packages_file_all=${root}/packages.txt
kdesrcdir=${builddir}/sources/kdesrc-build

cp -r $root/git-pkgbuilds/* ${builddir}/pkgbuilds/working-packages
mkdir -p ${kdesrcdir}/{s,b,l}
if [[ -f ${kdesrcdir}/README.md ]];then
    cd ${kdesrcdir} && git pull
    cd ${kdesrcdir}/s/sysadmin-repo-metadata && git pull
else
    git clone https://anongit.kde.org/kdesrc-build ${kdesrcdir}
fi
sudo pacman -S --needed perl-libwww perl-xml-parser perl-json perl-io-socket-ssl perl-net-ssleay perl-yaml-syck asp

truncate -s0 ${packages_file_kde}

printf "${root}/kf5-frameworks-build-include\n${root}/kf5-workspace-build-include\n${root}/kf5-applications-build-include" | \
xargs -L1 -I{} bash -c "${kdesrcdir}/kdesrc-build \
    --src-only --pretend --branch-group=kf5-qt5 --ignore-kde-structure --stop-on-failure \
    --source-dir=${kdesrcdir}/s --build-dir=${kdesrcdir}/b --log-dir=${kdesrcdir}/l \
    --rc-file {} | grep '^Cloning' | awk '{print "'$2'"}'" \
    | sed \
        -e 's/kirigami/kirigami2/' \
        -e 's/polkit-kde-agent-1/polkit-kde-agent/' \
        -e 's/oxygen-icons5/oxygen-icons/' \
    | grep -v "plasma-tests" | grep -v "oxygen" | tr '\n' ' ' >> ${packages_file_kde}

cp ${packages_file_kde} ${packages_file_all}
echo " pikaur zotero" >> ${packages_file_all}
p=$(cat ${packages_file_all})
echo ${p[@]}
