# Archlinux KDE Alternative

These scripts and PKGBUILDs help build an alternate version of KDE packages (frameworks and plasma 
for now) that installs to `/opt/kde` without interfering with the main KDE system packages. The
packages are built from git to get the latest and greatest features.

## Steps

* Prepare the system by executing scripts `[0-5]-*.sh`
* Install [`clean-chroot-manager`](https://github.com/graysky2/clean-chroot-manager)
* `y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y`
* To skip until some package, `skipuntil=kapidox && y=($(cat /home/sdh/builds/scripts/packages.txt | sed "s/.*${skipuntil} //")) && echo $y`
* `cd /home/sdh/builds/pkgbuilds/working-packages`
* `for i in "${y[@]}";do cd $i-opt-git && { ls | grep pkg.tar > /dev/null && mv *.pkg.tar* ~/builds/old_packages/ || true; } && ccm s && cd .. || break; done`
