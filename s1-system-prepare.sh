pacman -Syu --needed base-devel git zsh tmux htop glances
useradd -m sdh
passwd sdh
sed -i -r -e "/^#?Port/cPort 9980" -e "/^#?PermitRootLogin/cPermitRootLogin no" -e "/^#?PasswordAuthentication/cPasswordAuthentication no" /etc/ssh/sshd_config
echo "Run: ssh-copy-id sdh@"
echo "Run: systemctl restart sshd"
