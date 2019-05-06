#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

cp $root/orig.clean-chroot-manager.conf $root/clean-chroot-manager.conf && \
sed -ri \
    -e "s|^CHROOTPATH64=.*|CHROOTPATH64=\"$builddir/ccm_chroot\"|" \
    -e "s|^DEFAULT_MAKEPKG=.*|DEFAULT_MAKEPKG=\"$root/makepkg.conf\"|" \
    -e "s|SRCDEST=.*|SRCDEST=\"$builddir/sources\"|" \
    -e "s|LOGDEST=.*|LOGDEST=\"$builddir/logs\"|" \
    $root/clean-chroot-manager.conf
