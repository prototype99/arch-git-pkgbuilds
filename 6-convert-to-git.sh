#!/bin/bash

set -euo pipefail; shopt -s nullglob

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

cd ${builddir}/pkgbuilds/working-packages

for i in */PKGBUILD;do
	echo $i;
    if grep "pkgbase=" "$i" > /dev/null;then
        sed -i -r \
            -e "/^pkgbase=/s/-git//g" \
            -e "/^pkgname=/s/-git//g" \
            -e "s/^pkgbase=(.*)/_pkgname=\1/" \
            -e "/^pkgname=/s/([^ ])( |\))/\1-git\2/g" \
            "$i";
    else
        sed -i -r \
            -e "/^pkgname=/s/-git//g" \
            -e "s/^pkgname=(.*)/_pkgname=\1\npkgname=\$\{_pkgname\}-git/" \
            "$i";
    fi
    grep "^prepare" "$i" > /dev/null && selector=prepare || selector=build
    sed -i -r \
        -e "s/\\\$\{?pkg(name|base)\}?[0-9]?\-\\\$pkgver/\$\{_pkgname\}/g" \
        -e "s/^pkgver=.*/pkgver=0/" \
        -e "s/pkgrel=.*/pkgrel=1/" \
        -e "/BUILD_QCH/s/ON/OFF/" \
        -e "/epoch=/d" \
        -e "/groups=/s/([^ ])( |\))/\1-git\2/g" \
        -e "/groups=/s/\)/ kde-git)/" \
        -e '/install=/s/\$pkgname/$_pkgname/' \
        -e "/conflicts|provides|replaces/d" \
        -e "/cmake -B build/a\    \-DCMAKE_BUILD_TYPE\=RelWithDebInfo \\\\" \
        -e '/^'$selector'/i\\npkgver() {\n  cd $_pkgname\n  printf "r%s.%s.%s" "\$\(git rev-list --count HEAD\)" "\$\(git log -1 --date=format:"%Y%m%d" --format="%ad"\)" "\$\(git rev-parse --short HEAD\)"\n}\n' \
        -e 's|source=\(.*download.kde.org[^ )]*|source=\(\$\{_pkgname\}::git\+https://anongit.kde.org/\$\{_pkgname\}|' \
        -e "/depends=/s/ ?phonon-qt[45]-backend ?//" \
        -e "/makedepends=/s/ qt5-doc| sip//g" \
        $i && \
    . $i && \
    grep "groups" "$i" > /dev/null || sed -i -r "/source=/igroups=\(kde-git\)" "$i"
    sed -i -r \
        -e "/sha256sums/,/pkgver/c\sha1sums=($(python -c 'print("SKIP "*'${#source[@]}')'))\noptions=(debug "'!'"strip)\nconflicts=(\${_pkgname})\nprovides=(\${_pkgname})\n\npkgver() {" \
        "$i";
done

#sed -i -r "/source=/s/\)/5)/" oxygen-icons-git/PKGBUILD
sed -i -r "/source=/s/\}\)/%2})/" kirigami2-git/PKGBUILD

echo "success"
