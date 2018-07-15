#!/bin/bash

set -e

pkgdir=/home/sdh/builds/pkgbuilds/working-packages
cd $pkgdir

for i in */PKGBUILD;do
	echo $i;
	sed -i -r \
		-e "s/^pkgname=(.*)/_pkgname=\1\npkgname=\$\{_pkgname\}-git/" \
		-e "s/\\\$pkgname\-\\\$pkgver/\$\{_pkgname\}/g" \
		-e "/CMAKE_INSTALL_PREFIX/a\    \-DCMAKE_BUILD_TYPE\=RelWithDebInfo \\\\" \
		-e '/^prepare/i\\npkgver() {\n  cd $_pkgname\n  printf "r%s.%s" "\$\(git rev-list --count HEAD\)" "\$\(git rev-parse --short HEAD\)"\n}\n' \
		-e '/download.kde.org.*\)/csource=\(\$\{_pkgname\}::git\+https://anongit.kde.org/\$\{_pkgname\}\)' \
		-e '/download.kde.org/csource=\(\$\{_pkgname\}::git\+https://anongit.kde.org/\$\{_pkgname\}' \
		-e '/^build/a\  export PATH="/opt/kde/bin:\$\{PATH\}"\n  export XDG_DATA_DIRS="/opt/kde5/share:\${XDG_DATA_DIRS\}"\n' \
		-e "s|/usr|/opt/kde|" $i && \
	. $i && \
	sed -i -r "/sha256sums/,/pkgver/c\sha1sums=($(python -c 'print("SKIP "*'${#source[@]}')'))\noptions=(debug "'!'"strip)\n\npkgver() {" $i;
done

echo "success"

