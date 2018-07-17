#!/bin/bash

set -e

basedir=/home/sdh/builds
cd ${basedir}/pkgbuilds/working-packages

for i in */PKGBUILD;do
	echo $i;
    if grep "pkgbase=" "$i" > /dev/null;then
        sed -i -r \
            -e "s/^pkgbase=(.*)/_pkgname=\1/" \
            -e "/pkgname=/s/([^ ])( \))/\1-opt-git/g" \
            "$i";
    else
        sed -i -r \
            -e "s/^pkgname=(.*)/_pkgname=\1\npkgname=\$\{_pkgname\}-opt-git/" \
            "$i";
    fi
    sed -i -r \
        -e "s/\\\$\{?pkg(name|base)\}?[0-9]?\-\\\$pkgver/\$\{_pkgname\}/g" \
        -e "/groups=/s/([^a-z0-9\-])kf5([^a-z0-9\-])/\1kf5-opt\2/" \
        -e "/groups=/s/([^a-z0-9\-])plasma([^a-z0-9\-])/\1plasma-opt\2/" \
        -e "/conflicts|provides|replaces/d" \
        -e "/CMAKE_INSTALL_PREFIX/i\    \-DCMAKE_BUILD_TYPE\=RelWithDebInfo \\\\" \
        -e '/^prepare/i\\npkgver() {\n  cd $_pkgname\n  printf "r%s.%s" "\$\(git rev-list --count HEAD\)" "\$\(git rev-parse --short HEAD\)"\n}\n' \
        -e 's|source=\(.*download.kde.org[^ )]*|source=\(\$\{_pkgname\}::git\+https://anongit.kde.org/\$\{_pkgname\}|' \
        -e '/^build/a\  export PATH="/opt/kde/bin:\$\{PATH\}"\n  export XDG_DATA_DIRS="/opt/kde5/share:\${XDG_DATA_DIRS\}"\n' \
        -e "s|/usr|/opt/kde|g" \
        -e "/depends=/s/ ?phonon-qt[45]-backend ?//" \
        $i && \
    . $i && \
    sed -i -r "/sha256sums/,/pkgver/c\sha1sums=($(python -c 'print("SKIP "*'${#source[@]}')'))\noptions=(debug "'!'"strip)\n\npkgver() {" $i;
done

echo "success"
