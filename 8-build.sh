#!/bin/bash

set -euo pipefail
shopt -s nullglob

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

sudo mkdir -p /opt/builds/tmpfs/build
sudo chown kde: $tmpfsbuilddir
sudo pacman -Syu

cd $root/git-pkgbuilds

cp /etc/makepkg.conf $builddir/makepkg.conf
sed -i -r \
    -e '/^CFLAGS=/s/-O2/-O2 -w/' \
    -e '/^CXXFLAGS=/s/-O2/-O2 -w/' \
    -e '/MAKEFLAGS=/s/.*/MAKEFLAGS="-j4"/' \
    -e '/BUILDDIR=/s|.*|BUILDDIR='"$tmpfsbuilddir"'|' \
    -e '/SRCDEST=/s|.*|SRCDEST='"$builddir/sources"'|' \
    -e '/PACKAGER=/s/.*/PACKAGER="Siddhartha <dev@sdht.in>"/' $builddir/makepkg.conf

for i in $packages;do
    echo "#### $i"
    cd $i-git

    # Add repo if present and not already added
    if [[ -f $repodir/local-repo.db.tar.gz ]] && ! grep local-repo /etc/pacman.conf &>/dev/null;then
        sudo sed -i -e '$a[local-repo]\nSigLevel = Never\nServer = file://'"$repodir"'\n' /etc/pacman.conf && \
        sudo pacman -Syu
    fi

    # Run makepkg
    if makepkg -s --config $builddir/makepkg.conf --noconfirm --needed;then
        true
    else
        # Exit unless the error is "package already present"
        [[ "$?" != "13" ]] && exit 1
    fi
    
    . PKGBUILD
    # Remove old versions
    ls *.zst | grep -v $pkgver | xargs -L1 -I{} mv -v {} $builddir/old_packages/ || true
    # Cleanup tmpfs to avoid OOM
    rm -rf $tmpfsbuilddir/$i-git || true
    # Add new packages to pacman repo if not already present
    for of in *.tar.zst;do
        if [[ -f $repodir/$of && "$(md5sum $of | cut -d" " -f1)" == "$(md5sum $repodir/$of | cut -d" " -f1)" ]];then
            echo "Already present"
        else
            cp $of $repodir && repo-add -R -p $repodir/local-repo.db.tar.gz $repodir/$of && sudo pacman -Syu
        fi
    done
    cd ..
done

