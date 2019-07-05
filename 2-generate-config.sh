#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds
ccm_config=~/.config/clean-chroot-manager.conf
makepkg_config=$builddir/makepkg.conf

cp /etc/makepkg.conf $makepkg_config && \
sed -ri \
    -e "s|([^!])strip|\1!strip|" \
    -e "s|!debug|debug|" \
    -e "/PKGEXT=/cPKGEXT=\".pkg.tar\"" \
    -e "/^#?SRCDEST=/cSRCDEST=\"$builddir/sources\"" \
    -e "/^#?LOGDEST=/cLOGDEST=\"$builddir/logs\"" \
    $makepkg_config

cp /usr/share/clean-chroot-manager/ccm.skel $ccm_config && \
sed -ir \
    -e "/CHROOTPATH64=/cCHROOTPATH64=\"$builddir/ccm_chroot\"" \
    -e "/OLD_PKGDIR=/cOLD_PKGDIR=\"$builddir/old_packages\"" \
    -e "/DEFAULT_MAKEPKG=/cDEFAULT_MAKEPKG=\"$makepkg_config\"" \
    -e "/SRCDEST=/cexport SRCDEST=\"$builddir/sources\"" \
    -e "/LOGDEST=/cexport LOGDEST=\"$builddir/logs\"" \
    $ccm_config

echo "'$makepkg_config' and '$ccm_config' generated. Edit them as required."
