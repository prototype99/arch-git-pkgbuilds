#!/bin/bash

set -e

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

mkdir -p ${builddir}/{logs,old_packages,sources,repo}
mkdir -p ${builddir}/pkgbuilds/{arch-packages,working-packages}

