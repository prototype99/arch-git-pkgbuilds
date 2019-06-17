#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds
ccm_config=~/.config/clean-chroot-manager.conf
makepkg_config=$builddir/makepkg.conf

cp $root/orig.clean-chroot-manager.conf $ccm_config && \
sed -i "s|\[ROOT\]|$root|g" $ccm_config

cp $root/makepkg.conf $makepkg_config && \
sed -i "s|\[ROOT\]|$root|g" $makepkg_config
