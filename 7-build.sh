#!/bin/bash

set -euo pipefail; shopt -s nullglob

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds
tmpfsbuilddir=/opt/tmpfs/build
repodir=/opt/repo

case "${1:-all}" in
    after) packages=$(cat $root/packages.txt | sed -r "s/.*$2( |$)//")
    ;;
    from) packages=$(cat $root/packages.txt | sed -r "s/.*$2( |$)/$2\1/")
    ;;
    single) packages=$2
    ;;
    *) packages=$(cat $root/packages.txt)
    ;;
esac

sudo mkdir -p $tmpfsbuilddir
sudo chown $(whoami): $tmpfsbuilddir
sudo pacman -Syu --needed --noconfirm

cd $root/git-pkgbuilds

cp /etc/makepkg.conf $builddir/makepkg.conf
sed -i -r \
    -e '/^CFLAGS=/s/-O2/-O2 -w/' \
    -e '/^CXXFLAGS=/s/-O2/-O2 -w/' \
    -e '/MAKEFLAGS=/s/.*/MAKEFLAGS="-j"/' \
    -e '/BUILDDIR=/s|.*|BUILDDIR='"$tmpfsbuilddir"'|' \
    -e '/SRCDEST=/s|.*|SRCDEST='"$builddir/sources"'|' \
    -e "s|([^!])strip|\1!strip|" \
    -e "s|!debug|debug|" \
    -e "/PKGEXT=/cPKGEXT=\".pkg.tar.zst\"" \
    -e '/PACKAGER=/s/.*/PACKAGER="Packager <packager@example.in>"/' $builddir/makepkg.conf

for i in $packages;do
    echo "#### $i"
    [[ -d "$i-git" ]] && cd $i-git || cd $i

    # Add repo if present and not already added
    if [[ -f $repodir/local-repo.db.tar.gz ]] && ! grep local-repo /etc/pacman.conf &>/dev/null;then
        echo "Add local repo to pacman"
        sudo sed -i -e '$a[local-repo]\nSigLevel = Never\nServer = file://'"$repodir"'\n' /etc/pacman.conf && \
        sudo pacman -Syu
    fi

    # Run makepkg
    if makepkg -s --config $builddir/makepkg.conf --noconfirm --needed;then
        true
    else
        # Exit unless the error is "package already present"
        [[ "$?" != "13" ]] && echo "makepkg error for $i" && exit 1
    fi
    
    . PKGBUILD
    # Remove old versions
    ls *.zst | grep -v $pkgver | xargs -L1 -I{} mv -v {} $builddir/old_packages/ || true
    # Cleanup tmpfs to avoid OOM
    rm -rf $tmpfsbuilddir/$i-git || true
    # Add new packages to pacman repo if not already present
    for of in *.tar.zst;do
        if [[ -f $repodir/$of && "$(md5sum $of | cut -d" " -f1)" == "$(md5sum $repodir/$of | cut -d" " -f1)" ]];then
            echo "Pacakge already present in repo"
        else
            cp $of $repodir && repo-add -R -p $repodir/local-repo.db.tar.gz $repodir/$of && sudo pacman -Syu --needed --noconfirm
        fi
    done
    cd ..
done

