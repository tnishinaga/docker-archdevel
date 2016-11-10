FROM base/devel
MAINTAINER Toshifumi NISHINAGA <tnishinaga.dev+docker@gmail.com>

#sync
RUN pacman -Syy

#update keyring first
RUN pacman -S archlinux-keyring --noconfirm

#update
RUN pacman -Syu --noconfirm
RUN pacman-db-upgrade
RUN /usr/bin/update-ca-trust

#install base-devel
RUN pacman -S base-devel --noconfirm

#install sudo
RUN pacman -S sudo --noconfirm

#Create developer account
RUN useradd -m developer -G wheel && echo "developer:developer" | chpasswd
#Add wheel to sudoer
COPY sudoers_wheel /etc/sudoers.d/wheel

USER developer

## package-query and yaourt are already installed
# #install yaourt
# RUN cd /home/developer && \
#     curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz && \
#     tar zxf package-query.tar.gz && \
#     cd package-query && \
#     makepkg -s --noconfirm && \
#     sudo pacman -U package-query*.tar.xz --noconfirm
# RUN cd /home/developer && \
#     curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz && \
#     tar zxf yaourt.tar.gz && \
#     cd yaourt && \
#     makepkg -s --noconfirm && \
#     sudo pacman -U yaourt*.pkg.tar.xz --noconfirm

#entrypoint
CMD /bin/bash
