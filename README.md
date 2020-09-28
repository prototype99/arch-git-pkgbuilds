# Archlinux Git PKGBUILDs

These scripts and PKGBUILDs help build the git version of KDE (frameworks, plasma, selected applications) and other packages.

## Prepare

* Clone the repo: `git clone https://github.com/sdht0/arch-git-pkgbuilds.git ~/arch-kde-git`
* Prepare directories by executing `bash ./1-prepare.sh`

## Build packages

```bash
$ cd ~/arch-kde-git/docker
$ docker build -t kde .
$ cd ..
$ docker exec -ti kde bash /opt/8-build.sh
// To start from a package:
$ docker exec -ti kde bash /opt/8-build.sh from kio
// To start after a package:
$ docker exec -ti kde bash /opt/8-build.sh after kio
```

