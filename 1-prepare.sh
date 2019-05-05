#!/bin/bash

set -e

root=/home/sdh/arch-kde-opt
builddir=${root}/builds

mkdir -p ${builddir}/{ccm_chroot,logs,old_packages,sources}
mkdir -p ${builddir}/pkgbuilds/{arch-packages,working-packages}
git clone git://anongit.kde.org/kdesrc-build ${builddir}/sources/kdesrc-build
mkdir -p ${builddir}/sources/kdesrc-build/{s,b,l}
sudo pacman -S perl-io-socket-ssl perl-yaml-syck perl-xml-parser perl-libwww perl-json
