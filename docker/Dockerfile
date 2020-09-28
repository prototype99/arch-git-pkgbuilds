FROM archlinux/base
RUN pacman -Syu base-devel git cmake vim qt5-tools --needed --noconfirm
RUN groupadd -g 1000 kde
RUN useradd -m -u 1000 -g 1000 kde
RUN bash -c "mkdir -p /etc/sudoers.d && echo 'kde ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/90-kde"

