#!/bin/bash

set -euo pipefail; shopt -s nullglob

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
builddir=${root}/builds

mkdir -p ${builddir}/{logs,old_packages,sources,repo}
mkdir -p ${builddir}/pkgbuilds/{arch-packages,working-packages}
