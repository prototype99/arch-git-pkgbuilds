#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

cp $root/orig.kdesrc-buildrc $root/kdesrc-buildrc && \
sed -ri \
    -e "s|source-dir.*|source-dir\t$builddir/sources/kdesrc-build/s|" \
    -e "s|build-dir.*|build-dir\t$builddir/sources/kdesrc-build/b|" \
    -e "s|log-dir.*|log-dir\t$builddir/sources/kdesrc-build/l|" \
    -e "/kf5-frameworks-build-include/c\include $root/kf5-frameworks-build-include" \
    -e "/kf5-workspace-build-include/c\include $root/kf5-workspace-build-include" \
    $root/kdesrc-buildrc

cp $root/orig.clean-chroot-manager.conf $root/clean-chroot-manager.conf && \
sed -ri \
    -e "s|^CHROOTPATH64=.*|CHROOTPATH64=\"$builddir/ccm_chroot\"|" \
    -e "s|^DEFAULT_MAKEPKG=.*|DEFAULT_MAKEPKG=\"$root/makepkg.conf\"|" \
    -e "s|SRCDEST=.*|SRCDEST=\"$builddir/sources\"|" \
    -e "s|LOGDEST=.*|LOGDEST=\"$builddir/logs\"|" \
    $root/clean-chroot-manager.conf
