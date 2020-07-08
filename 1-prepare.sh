#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

mkdir -p ${builddir}/{ccm_chroot,logs,old_packages,sources,builddir}
mkdir -p ${builddir}/pkgbuilds/{arch-packages,working-packages}
cp -r $root/git-pkgbuilds/* ${builddir}/pkgbuilds/working-packages
git clone https://anongit.kde.org/kdesrc-build ${builddir}/sources/kdesrc-build
mkdir -p ${builddir}/sources/kdesrc-build/{s,b,l}
sudo pacman -S --needed perl-libwww perl-xml-parser perl-json perl-io-socket-ssl perl-net-ssleay perl-yaml-syck asp
