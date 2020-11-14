# Archlinux Git PKGBUILDs

These scripts and PKGBUILDs help build the git version of KDE (frameworks, plasma, selected applications) and other packages.

## Prepare

* Clone the repo: `git clone https://github.com/sdht0/arch-git-pkgbuilds.git ~/arch-kde-git`
* Prepare directories by executing `bash ./1-prepare.sh`

## Build packages

```bash
$ cd ~/arch-kde-git/docker
$ cp Dockerfile.sample Dockerfile
$ sed -i -e 's/UID/1000/g' -e 's/GID/1000/g' Dockerfile
$ docker build -t archbuilder .
$ cd ..
$ bash ./1-prepare-directories.sh
$ docker run -ti --user archbuilder:archbuilder -v ~/arch-kde-git:/opt/arch-kde-git -v ~/arch-kde-git/repo:/opt/repo --tmpfs /opt/tmpfs:exec --name archbuilder archbuilder bash
# Exit docker using Ctrl+P+Q, then build all packages:
$ docker exec -ti archbuilder bash /opt/7-build.sh
# To start from a specific package:
$ docker exec -ti archbuilder bash /opt/7-build.sh from kio
# To start after a specific package:
$ docker exec -ti archbuilder bash /opt/7-build.sh after kio
# To build a single package:
$ docker exec -ti archbuilder bash /opt/7-build.sh after kio
```
