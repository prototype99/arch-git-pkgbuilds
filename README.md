# Archlinux Git PKGBUILDs

These scripts and PKGBUILDs help build the git version of KDE (frameworks, plasma, selected applications) and other packages.

## Prepare

* Clone the repo: `git clone https://github.com/sdht0/arch-git-pkgbuilds.git ~/arch-kde-git`
* Prepare the system by executing scripts `[1-2]-*.sh`
* Install [`clean-chroot-manager`](https://github.com/sdht0/clean-chroot-manager) by running `cd ~/arch-kde-git/git-pkgbuilds/ccm-git && makepkg -si`. This forked version has some additional features.

## Build packages

### KDE
* `cd ~/arch-kde-git/builds/pkgbuilds/working-packages`
* `for i in $(cat ~/arch-kde-git/packages.txt);do echo $i; bash -c "cd $i-git && sudo ccm S" || break; done`

### Other packages

* `cd ~/arch-kde-git/builds/pkgbuilds/working-packages-2`
* `for i in $(cat ~/arch-kde-git/packages-2.txt);do echo $i; bash -c "cd $i-git && sudo ccm S" || break; done`

### Tips

* To start from a package: `from=kapidox && for i in $(cat ~/arch-kde-git/packages.txt | sed "s/.*$from /$from /");do echo $i; bash -c "cd $i-git && sudo ccm S" || break; done`
* To start just after a package: `after=kapidox && for i in $(cat ~/arch-kde-git/packages.txt | sed "s/.*$after //");do echo $i; bash -c "cd $i-git && sudo ccm S" || break; done`
