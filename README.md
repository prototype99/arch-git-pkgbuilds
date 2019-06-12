# Archlinux KDE Alternative

These scripts and PKGBUILDs help build the git version of KDE packages (frameworks, plasma and
selected applications).

## Steps

* Prepare the system by executing scripts `[1-7]-*.sh`
* Install [`clean-chroot-manager`](https://github.com/sdht0/clean-chroot-manager). This forked version has some additional features.
* `cd ~/arch-kde-git/builds/pkgbuilds/working-packages`
* `for i in $(cat ~/arch-kde-git/packages.txt);do echo $i; bash -c "cd $i-git && ls | grep pkg.tar > /dev/null || sudo ccm s || exit 1" || break; done`
* To start from a package: `from=kapidox && for i in $(cat ~/arch-kde-git/packages.txt | sed "s/.*$from /$from /");do echo $i; bash -c "cd $i-git && ls | grep pkg.tar > /dev/null || sudo ccm s || exit 1" || break; done`
* To start just after a package: `after=kapidox && for i in $(cat ~/arch-kde-git/packages.txt | sed "s/.*$after //");do echo $i; bash -c "cd $i-git && ls | grep pkg.tar > /dev/null || sudo ccm s || exit 1" || break; done`
