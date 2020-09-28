#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds
tmpfsbuilddir=$builddir/tmpfs/build
repodir=$builddir/repo

case "$1" in
    after) packages=$(cat $root/packages.txt | sed "s/.*$2 //")
    ;;
    from) packages=$(cat $root/packages.txt | sed "s/.*$2 /$2 /")
    ;;
    *) packages=$(cat $root/packages.txt)
    ;;
esac

sudo mkdir -p /opt/builds/tmpfs/build && sudo chown kde: $tmpfsbuilddir && sudo pacman -Syu && \
cd $root/git-pkgbuilds && \
cp /etc/makepkg.conf $builddir/makepkg.conf && \
sed -i -r \
    -e '/^CFLAGS=/s/-O2/-O2 -w/' \
    -e '/^CXXFLAGS=/s/-O2/-O2 -w/' \
    -e '/MAKEFLAGS=/s/.*/MAKEFLAGS="-j4"/' \
    -e '/BUILDDIR=/s|.*|BUILDDIR='"$tmpfsbuilddir"'|' \
    -e '/SRCDEST=/s|.*|SRCDEST='"$builddir/sources"'|' \
    -e '/PACKAGER=/s/.*/PACKAGER="Siddhartha <dev@sdht.in>"/' $builddir/makepkg.conf && \
for i in $packages;do
    echo "#### $i"
    bash -c "cd $i-git; makepkg -si --config $builddir/makepkg.conf --noconfirm --needed && . PKGBUILD && ls *.zst | grep -v \$pkgver | xargs -L1 -I{} mv -v {} $builddir/old_packages/ && ls *.tar.zst | xargs -L1 -I{} sudo bash -c '[[ -f $repodir/{} && \"\$(md5sum {} | cut -d\" \" -f1)\" == \"\$(md5sum $repodir/{} | cut -d\" \" -f1)\" ]] && echo \"Already present\" || { cp {} $repodir && repo-add -R -p $repodir/local-repo.db.tar.gz $repodir/{}; }'" || break
done

