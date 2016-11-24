# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.19
MAINTAINER Philipp Gross

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Use bash when building the image
RUN mv /bin/sh /bin/sh.orig && ln -s /bin/bash /bin/sh

RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing && \
    apt-get -y install vim-nox git curl silversearcher-ag build-essential

# Set default timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN apt-get install -y wget fontconfig python
RUN useradd -m editor -u 1000
USER editor
ENV HOME /home/editor
WORKDIR /home/editor

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# Powerline needs fonts. Install:
RUN wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf \
    https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
RUN mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
RUN mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf \
    ~/.config/fontconfig/conf.d/

# Install Vim color scheme
ADD https://raw.githubusercontent.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night-Eighties.vim \
    /home/editor/.vim/colors/Tomorrow-Night-Eighties.vim

# Copy default vimrc
ADD vimrc /home/editor/.vimrc

# Install Vim plugins
RUN vim +PluginInstall +qall

# Copy user specific Vim settings
COPY vimrc.user.vim /home/editor/.vimrc.user.vim

WORKDIR /home/editor/src

USER root

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Restore default shell
RUN rm /bin/sh && mv /bin/sh.orig /bin/sh

USER editor
