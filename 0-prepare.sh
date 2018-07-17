#!/bin/bash

set -e

mkdir -p /home/sdh/builds/{ccm_chroot,logs,old_packages,scripts,sources}
mkdir -p /home/sdh/builds/pkgbuilds/{arch-packages,working-packages}
git clone git://anongit.kde.org/kdesrc-build /home/sdh/builds/sources/kdesrc-build
