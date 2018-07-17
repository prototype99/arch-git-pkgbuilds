#!/bin/bash

set -e

basedir=/home/sdh/builds
mkdir -p ${basedir}/{ccm_chroot,logs,old_packages,scripts,sources}
mkdir -p ${basedir}/pkgbuilds/{arch-packages,working-packages}
git clone git://anongit.kde.org/kdesrc-build ${basedir}/sources/kdesrc-build
