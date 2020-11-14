#!/bin/bash

set -euo pipefail; shopt -s nullglob

pacman -Syu --needed base-devel git zsh tmux htop glances
useradd -m -s /bin/zsh username
passwd username
su -c "cd;git clone https://github.com/siddharthasahu/dotfiles.git;cd dotfiles && git checkout work-env && bash setup.sh && cd" username
echo "Run: ssh-copy-id username@"
sed -i -r -e "/^#?Port/cPort 9980" -e "/^#?PermitRootLogin/cPermitRootLogin no" -e "/^#?PasswordAuthentication/cPasswordAuthentication no" /etc/ssh/sshd_config
echo "Run: systemctl restart sshd"
