echo ${kf5[@]} | tr '\n' ' ' > packages.txt
e packages.txt
y=$(cat packages.txt )
cp download.sh generate-packages.sh
ls pkgbuilds/arch-packages
ls pkgbuilds/arch-packages | wc -l
rr kf5 plasma && mkdir working-packages
readlink -f working-packages
bash download.sh
mkdir scripts
mv *sh *txt kdesrc-buildrc* scripts
gca "a"
cat download.sh
e download.sh
ls ../pkgbuilds/working-packages
for x in plasma kf5;do for i in $(curl -s https://www.archlinux.org/groups/x86_64/$x/ | grep "/packages/extra/" | sed -r 's|.*/packages/extra/[^/]+/([^"/]+).*|\1|' | grep -v knetattach | sort | uniq);do printf "-e 's/"'([ (^])'"$i"'([ )$])'"/"'\\1'"$i-git"'\\2'"/' "; done; done; echo
grep pkgbase
xs pkgbase
less ./plasma-desktop-git/PKGBUILD
xs source
xs source | grep -v RelWithDebInfo
xs source | grep -v download.kde.org
less ./kinfocenter-git/PKGBUILD
echo --help
man echo
cat sed-pkgnames.sh
e sed-pkgnames.sh
e copy-working-packages.sh
bash copy-working-packages.sh
xs pkgbase=
xs pkgbase= | awk -F':' '{print $1}' | xargs -L1 grep pkgname
xs oxygen-icons
xs phonon-qt5
less ./phonon-git/PKGBUILD
xs plasma-desktop
e /home/sdh/builds/sources/kdesrc-build/kf5-workspace-build-include
e /home/sdh/builds/sources/kdesrc-build/kf5-frameworks-build-include
/home/sdh/builds/sources/kdesrc-build
bash ./generate-packages.sh
e generate-packages.sh
bash generate-packages.sh
mv generate-packages.sh 1-generate-packages.sh
mv download.sh 2-download.sh
mv copy-working-packages.sh 3-copy-working-packages.sh
less 1-generate-packages.sh
readlink -f packages.txt
xs
xs knetattach
less sed-pkgnames.sh
ls ../pkgbuilds/arch-packages
ls ../pkgbuilds/arch-packages | wc -l
readlink -f sed-pkgnames.sh
rm sed-pkgnames.sh
e 4-sed-pkgnames.sh
less 4-sed-pkgnames.sh
rm 4-sed-pkgnames.sh
ls working-packages | wc -l
less 4-sed-pkgnames-generated.sh
ls -l .git
rr .git
git init
ga working-packages
gc "init"
e .git/ine
cp 3-copy-working-packages.sh 5-convert-to-git.sh
bash 5-convert-to-git.sh
less attica-git/PKGBUILD
git diff | grep "a/working-packages"
git diff | grep "a/working-packages" | grep diff
git diff | grep "a/working-packages" | grep diff | sed -r 's|.*a/working-packages/([^/]+).*|\1|'
git diff | grep "a/working-packages" | grep diff | sed -r 's|.*a/working-packages/([^/]+).*|\1|' | sort | uniq | wc -l
ls | wc -l
git diff breeze-g
git diff breeze-git/
mkdir breeze-git oxygen-git oxygen-icons-git plasma-workspace-git phonon-qt5-git phonon-qt5-gstreamer plasma-desktop-git
cp ../arch-packages/breeze/trunk/* breeze-git
cp ../arch-packages/oxygen/trunk/* oxygen-git
cp ../arch-packages/oxygen-icons/trunk/* oxygen-icons-git
cp ../arch-packages/plasma-workspace/trunk/* plasma-workspace-git
cp ../arch-packages/ph/trunk/* phonon-qt5-git
for i in breeze oxygen oxygen-icons plasma-workspace phonon phonon-gstreamer plasma-desktop;do mkdir /home/sdh/builds/pkgbuilds/tmp/$i-git;cp /home/sdh/builds/pkgbuilds/arch-packages/$i/trunk/* /home/sdh/builds/pkgbuilds/tmp/$i-git;done
rr *
for i in breeze oxygen oxygen-icons plasma-workspace phonon phonon-gstreamer plasma-desktop;do mkdir /home/sdh/builds/pkgbuilds/tmp/$i-git;cp /home/sdh/builds/pkgbuilds/working-packages/$i-git/* /home/sdh/builds/pkgbuilds/tmp/$i-git;done
e oxygen-git
less phonon-git/PKGBUILD
less phonon-gstreamer-git/PKGBUILD
e oxygen-icons-git/PKGBUILD
e plasma-desktop-git/PKGBUILD
e plasma-workspace-git
less ../pkgbuilds/arch-packages/plasma-workspace/trunk/PKGBUILD
e plasma-workspace-git/PKGBUILD
gca "b"
for i in for i in breeze oxygen oxygen-icons plasma-workspace phonon phonon-gstreamer plasma-desktop;do ls $i-git;done
less breeze-git/PKGBUILD
cat 3-copy-working-packages.sh
../pkgbuilds/tmp
e phonon-git
../phonon-gstreamer-git
e phonon-gstreamer-git/PKGBUILD
cp /home/sdh/builds/pkgbuilds/tmp/phonon-gstreamer-git/PKGBUILD .
e phonon-git/PKGBUILD
../phonon-git
cp /home/sdh/builds/pkgbuilds/tmp/phonon-git/PKGBUILD .
../solid-git
x=$(cat /home/sdh/builds/scripts/packages.txt)
x=("${x[@]:3}")
echo $x
for i in $(cat /home/sdh/builds/scripts/packages.txt | sed -r "s/extra-cmake-modules|phonon|phonon-gstreamer|solid//");do cd $i-git && { ccm s || break; } && cd ..;done
cat packages.txt
for i in $(cat /home/sdh/builds/scripts/packages.txt | sed -r "s/extra-cmake-modules|phonon|phonon-gstreamer|solid//g");do cd $i-git && { ccm s || break; } && cd ..;done
~/builds/ccm_chroot/root
se etc/makepkg.conf
ccm a
gca "c"
git fetch
cd builds/sources/kcoreaddons
cd ../../pkgbuilds/working-packages/kcoreaddons-git
y=$(cat packages.txt)
y=$(cat ~/builds/scripts/packages.txt)
for i in $(cat /home/sdh/builds/scripts/packages.txt);do cd $i-git && { ccm s || break; } && cd ..;done
tmux attach -d -t 1
psg tmux
tmux ls
echo $TMUX
cd dotfiles
swapon --show
sudo fallocate -l 1.5G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapoff /dev/sdb
sudo swapon /swapfile
cat /home/sdh/builds/scripts/packages.txt
skipuntil=kwidgetsaddons
cat /home/sdh/builds/scripts/packages.txt | sed 's/.*$skipuntil //'
cat /home/sdh/builds/scripts/packages.txt | sed "s/.*$skipuntil //"
y=$(cat /home/sdh/builds/scripts/packages.txt | sed "s/.*$skipuntil //")
y=$(cat /home/sdh/builds/scripts/packages.txt | sed "s/.*$skipuntil //") && echo $y
for i in $y;do cd $i-git && { ccm s || break; } && cd ..;done
for i in "$y";do cd $i-git && { ccm s || break; } && cd ..;done
y=($(cat /home/sdh/builds/scripts/packages.txt | sed "s/.*$skipuntil //")) && echo $y
mkdir old_packages
cd pkgbuilds
ls working-packages
ls working-packages/*
ls working-packages/*.tar
ls working-packages/*/*.tar
cd sources/kdesrc-build
ls b
ls t
lsa
git fetch --all
~/.cache/aurman/clean-chroot-manager
cd builds/scripts
cp ~/builds/ccm_chroot/root/etc/makepkg.conf .
cd ~/builds/scripts
readlink -f makepkg.conf
e makepkg.conf
e ~/.config/clean-chroot-manager.conf
cd ~/dotfiles
e .git/info/exclude
ccm
se ~/builds/ccm_chroot/root/etc/makepkg.conf
for i in "${y[@]}";do cd $i-git && { ccm s || break; } && cd ..;done
cd attica-git
for i in "${y[@]}";do cd $i-git && ccm s && cd .. || break; done
for i in "${y[@]}";do cd $i-git && mv *.pkg.tar* ~/builds/old_packages/ && ccm s && cd .. || break; done
ls */*.tar
ls ~/builds/old_packages
../..
../scripts
cd ../working-packages
less attica-opt-git
less attica-opt-git/PKGBUILD
gca "new"
../tmp
e breeze-git
ls breeze-opt-git
e breeze-opt-git/PKGBUILD
cat 4-sed-pkgnames-generated.sh
bash 4-sed-pkgnames-generated.sh
e breeze-git/PKGBUILD
xs pkgbase= | awk -F':' '{print $1}'
less ./oxygen-icons-opt-git/PKGBUILD
git diff breeze-opt-git/
xs pkgbase= | awk -F':' '{print $1}' | xargs -L1 grep pkgname=
git diff plasma-workspace-opt-git/
ccm n && ccm s
ccm n && ccm c
lla ~/builds/ccm_chroot/root/var/cache/pacman
lla ~/builds/ccm_chroot/root/var/cache/pacman/pkg
for i in "${y[@]}";do cd $i-opt-git && mv *.pkg.tar* ~/builds/old_packages/ && ccm s && cd .. || break; done
for i in "${y[@]}";do cd $i-opt-git && { mv *.pkg.tar* ~/builds/old_packages/ || true; } && ccm s && cd .. || break; done
rr ~/builds/ccm_chroot/sdh
srr ~/builds/ccm_chroot/sdh
for i in "${y[@]}";do cd $i-opt-git && { mv *.pkg.tar* ~/builds/old_packages/ 1>&2 2>/dev/null || true; } && ccm s && cd .. || break; done
for i in "${y[@]}";do cd $i-opt-git && { mv *.pkg.tar* ~/builds/old_packages/ >/dev/null 2>&1 || true; } && ccm s && cd .. || break; done
ccm n && ccm c && ccm i cmake git qt5-tools
cd ~/builds/ccm_chroot/root/repo
cd builds/pkgbuilds/working-packages
../../scripts
e 5
../working-packages
cd phonon-opt-git
e ../phonon-opt-git/PKGBUILD
xs phonon-qt4-backend
xs phonon-backend
xs phonon-qt5-backend
git diff phonon-gstreamer-opt-git/
git diff phonon-opt-git/
for i in "${y[@]}";do cd $i-opt-git && { ls | grep pkg.tar && mv *.pkg.tar* ~/builds/old_packages/ || true; } && ccm s && cd .. || break; done
git diff | grep provide
gca "e"
gcma
git diff HEAD
cd ~/builds/ccm_chroot/root
y=($(cat /home/sdh/builds/scripts/packages.txt | sed "s/.*phonon-gstreamer //")) && echo $y
for i in "${y[@]}";do cd $i-opt-git && { ls | grep pkg.tar > /dev/null && mv *.pkg.tar* ~/builds/old_packages/ || true; } && ccm s && cd .. || break; done
e kcoreaddons-opt-git
../../sources
cd kcoreaddons
ls r
ls ..
mv ~/.config/clean-chroot-manager.conf .
ln -s ~/builds/scripts/clean-chroot-manager.conf ~/.config/clean-chroot-manager.conf
lla ~/.config/clean-chroot-manager.conf
grh
git diff HEAD~1
ga .
gca "d"
ls sources
rr pkgbuilds/tmp
ls pkgbuilds
mv ~/.cache/aurman/clean-chroot-manager/PKGBUILD .
mkdir ccm
mv PKGBUILD ccm
xs qt5-tools
git clone https://github.com/siddharthasahu/arch-kde-opt.git
cd arch-kde-opt
xs scripts
mv scripts scripts-old
mv arch-kde-opt scripts
cd scripts
../pkgbuilds
ls arch-packages
ls arch-packages/packages
find ../working-packages -mindepth 1
find . -mindepth 1
find ../arch-packages -mindepth 1
../
less packages.txt
../pkgbuilds/working-packages
../working-packages2
../pkgbuilds/working-packages2
git co 3-copy-working-packages.sh 5-convert-to-git.sh
e 4-sed-pkgnames-generated.sh
pcmr clean-chroot-manager
mv ~/.cache/aurman/clean-chroot-manager/ccm.install .
makepkg -si
y=($(cat /home/sdh/builds/scripts/packages.txt | sed "s/.*kbookmarks //")) && echo $y
for i in "${y[@]}";do cd $i-opt-git && { ls | grep pkg.tar > /dev/null && continue; } && ccm s && cd .. || break; done
skipuntil=kapidox
../../working-packages2/kapidox-opt-git
rr ../../working-packages2
git co *sh
rm ccm/ccm.install
pwd
cd ccm
skipuntil=kdelibs4support
y=($(cat /home/sdh/builds/scripts/packages.txt | sed "s/.*${skipuntil} //")) && echo $y
mail --help
echo hello| mail -s "fdsf" sh.siddhartha@gmail.com
mount | column -t
less PKGBUILD
rr working-packages2
ls */*
cd working-packages
cat 5-convert-to-git.sh
sed -i -r "/source=/s/\}\)/%2})/" kirigami2-opt-git/PKGBUILD
echo $y
xs khtml
cd kdelibs4support
less makepkg.conf
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep knew
../sources/kdesrc-build
ls | grep dev
cd kdes
j s
./kdesrc-build --rc-file= ~/builds/scripts/kdesrc-buildrc --src-only --debug
./kdesrc-build --rc-file=~/builds/scripts/kdesrc-buildrc --metadata-only
e kf5-frameworks-build-include
cd sysadmin-repo-metadata
../kde-build-metadata
cd plasma-workspace
less kde-cli-tools-opt-git/PKGBUILD
e plasma-workspace-opt-git
less plasma-integration-opt-git/PKGBUILD
../kdelibs4support-opt-git
g
git co .
kdelibs4support-opt-git
ls | grep su
cd plasma-workspace-
cd plasma-workspace-opt-git
rm *tar
khotkeys-opt-git
makepkg --help
makepkg --help | grep dep
se etc/pacman.conf
echo $y | grep oxygen
echo $y | grep pa
xs oxygen
grep oxygen- */PKGBUILD
../../old_packages
../systemsettings-opt-git
ls repo
du /*
sudo du -sh /*
sudo du -sh /home/sdh
sudo du -sh /home/sdh/*
sudo du -sh /home/sdh/builds/*
sudo journalctl
crns
du .
fdisk
fdisk -l
sudo -l
sudo fdisk -l
ssh a383khan@lg-research-1.uwaterloo.ca:
ssh -p 9999 a383khan@lg-research-1.uwaterloo.ca:
ports
ssh -p 9999 a383khan@lg-research-1.uwaterloo.ca
ssh -vvv -p 9999 a383khan@lg-research-1.uwaterloo.ca
ssh -vvv -p 9999 a383khan@localhost
ssh -p 9999 a383khan@localhost
e ~/.ssh/authorized_keys
h
mkfs.ext4 /dev/disk/by-id/scsi-0Linode_Volume_sdh
sudo mkfs.ext4 /dev/disk/by-id/scsi-0Linode_Volume_sdh
lla /dev/disk/by-id/scsi-0Linode_Volume_sdh:
lla /dev/disk/by-id/scsi-0Linode_Volume_sdh
sudo mkdir /mnt/edisk
sudo mount /dev/disk/by-id/scsi-0Linode_Volume_edisk /mnt/edisk
mount
pru
~/.cache/aurman/aurman
e /etc/makepkg.conf
makepkg --help | grep gpg
makepkg --help | grep skip
makepkg -si --skippgpcheck
cd
sudo mkdir /mnt/edisk/builds/sources
sudo mkdir -p /mnt/edisk/builds/sources
sudo chown sdh: /mnt/edisk/builds/sources
cd builds
sudo chown sdh: /mnt/edisk/builds
rr /mnt/edisk/builds/sources
lla /mnt/edisk/builds/
mv sources /mnt/edisk/builds/
ln -s /mnt/edisk/builds/sources sources
bash 2-download.sh
bash 3-copy-working-packages.sh
gca "Update"
bash 4-sed-pkgnames-generated.sh && bash 5-convert-to-git.sh
ccm n
ccm c
ccm i qt5-tools git cmake
sed -i 's/sip//' */PKGBUILD
cd kxmlgui
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep xml
cd kpackage-opt-git
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep book
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep kiri
rr oxygen-*
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep oxygen
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep plasma
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep runn
e 5-convert-to-git.sh
xs groups=
xs groups= | grep -opt
xs groups= | grep -v "-opt"
xs groups= | grep -v '-opt'
xs groups= | grep -v "\-opt"
cat 5-convert-to-git.sh| grep groups=
xs oxygen-
cat ~/builds/scripts/5-convert-to-git.sh|grep groups=
sed -r -e "/groups=/s/([^ ])(-opt)?( \))/\1-opt/g" */PKGBUILD
sed -r -e "/groups=/s/([^ ])(-opt)?( \))/\1-opt/g" */PKGBUILD | grep groups=
sed -r -e "/groups=/s/-opt//g" -e "/groups=/s/([^ ])( \))/\1-opt/g" */PKGBUILD | grep groups=
pcms fft
e 2-download.sh
e 3-copy-working-packages.sh
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep bree
../breeze-opt-git
xextract breeze-opt-git-r1725.f28e3333-1-x86_64.pkg.tar
ls opt/kde/*
opt/kde
tree
ls *
cd lib
ldd libbreezecommon.so
../../..
rr opt
gp
less kf5-qt5-build-include
less kf5-extragear-build-include
../kde-cli-tools-opt-git
../plasma-integration-opt-git
../plasma-workspace-
../plasma-workspace-opt-git
cd xdg-desktop-portal-kde
../kscreen-opt-git
../drkonqi-opt-git
../khotkeys-opt-git
j working-packages
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep xdg
for i in "${y[@]}";do cd $i-opt-git && echo $i && { ls | grep pkg.tar > /dev/null || echo ccm s; } && cd .. || break; done
e 0-prepare.sh
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep menu
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep hot
e logical-module-structure
../kdesrc-build
../sysadmin-repo-metadata
e README.md
ls output
cat .gitignore
e kdesrc-buildrc
ls l
ls ls s
ls l s b
ls s
rr s
git co kdesrc-buildrc
rr kde-build-metadata sysadmin-repo-metadata
cd kdesrc-build
mkdir s
./kdesrc-build --rc-file=/home/sdh/builds/scripts/kdesrc-buildrc --metadata-only
cd s
cd kde-build-metadata
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep men
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep add
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep ssh
xs groups= */PKGBUILD
grep "groups=" */PKGBUILD
grep "groups=" */PKGBUILD | awk -F':' '{print $3}'
grep "groups=" */PKGBUILD | awk -F':' '{print $3}2
grep "groups=" */PKGBUILD | awk -F':' '{print $2}'
grep "groups=" */PKGBUILD | awk -F':' '{print $2}' | grep -v (kf5-opt)
grep "groups=" */PKGBUILD | awk -F':' '{print $2}' | grep -v (kf5\-opt)
grep "groups=" */PKGBUILD | awk -F':' '{print $2}' | grep -v "\(kf5\-opt\)"
grep "groups=" */PKGBUILD | awk -F':' '{print $2}' | grep -v "\(kf5\-opt\)" | grep -v "\(plasma\-opt\)"
grep "groups=" */PKGBUILD| grep -v "\(kf5\-opt\)" | grep -v "\(plasma\-opt\)"
less plasma-workspace-opt-git/PKGBUILD
less kwalletmanager-opt-git/PKGBUILD
../polkit-kde-agent-opt-git
j kde-build-metadata
um kde-build-metadata
mks
cd kdesrc-build/s/kde-build-metadata
m
e dependency-data-kf5-qt5
git diff .
b
bash 1-generate-packages.sh
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep pol
..
for i in "${y[@]}";do cd $i-opt-git && echo $i && { ls | grep pkg.tar > /dev/null || ccm s; } && cd .. || break; done
git diff
e 1-generate-packages.sh
cat 1-generate-packages.sh
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep info
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep pa
e
e plasma-pa-no-gconf.patch
j sources
plasma-pa/
git log
~/builds
y=($(cat /home/sdh/builds/scripts/packages.txt)) && echo $y | grep desk
j scripts
gs
lla
e PKGBUILD
arch-nspawn ~/builds/ccm_chroot/sdh /bin/bash
j root
../sdh
ls
e build/plasma-desktop-opt-git/src/build/kcms/fonts/kcm_fonts.json
sudo swapoff /swapfile
sudo fallocate -l 3G /mnt/edisk/swapfile
sudo chmod 600 /mnt/edisk/swapfile
sudo mkswap /mnt/edisk/swapfile
sudo swapon /mnt/edisk/swapfile
se /etc/fstab
free
free -h
ccm s
rr /swapfile
srr /swapfile
df
while true;do free -h;sleep 3;done
htop
