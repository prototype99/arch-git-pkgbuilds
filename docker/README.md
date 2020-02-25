Commands
========

* `docker run -ti -v /opt/sdh/arch-git-pkgbuilds:/opt --tmpfs /opt/builds/tmpfs:exec archlinux_s3sahu bash`
* `mkdir -p /opt/builds/tmpfs/build && chown s3sahu: /opt/builds/tmpfs/build && pacman -Syu`
* `for i in $(cat ../packages.txt);do echo "#### $i"; bash -c "cd $i-git; makepkg -si --config ../../builds/makepkg.conf --noconfirm --needed && . PKGBUILD && ls *.zst | grep -v \$pkgver | xargs -L1 -I{} mv -v {} ../../builds/oldpkgs/" || break; done`
