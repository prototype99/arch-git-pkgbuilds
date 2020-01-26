FROM archlinux/base
RUN pacman -Syu base-devel git cmake vim qt5-tools --needed --noconfirm
RUN useradd -m -u 11173 s3sahu
RUN bash -c "mkdir -p /etc/sudoers.d && echo 's3sahu ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/90-s3sahu"

