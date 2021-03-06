#!/bin/bash

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc
sudo apt-get install vlc xmonad vim-gtk suckless-tools libdvdread4 \
  subversion synaptic mosh calibre sshfs bcache-tools \
  gnome-panel python-boto fish gnome-tweak-tool


# Programming tools
sudo apt-get install lua5.2 gcc g++ autoconf clang cabal-install \
  golang ipython exuberant-ctags

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

# I'll want it later
mkdir ~/bin

# Enable DVD playback
sudo /usr/share/doc/libdvdread4/install-css.sh

# Get cabal going
cabal update

# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
#sudo apt-add-repository ppa:oibaf/graphics-drivers

# Install yeganesh
cabal install yeganesh

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/vimrc ~/.vimrc
mkdir ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/shutdown.sh ~/bin/shutdown.sh
ln -s ~/dotfiles/suspend.sh ~/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/bin/restart.sh
ln -s ~/dotfiles/hibernate.sh ~/bin/hibernate.sh
ln -s ~/dotfiles/yeganesh_run.sh ~/bin/yeganesh_run.sh

# Install all my vim addons
mkdir ~/.vim
cd ~/.vim
git clone https://github.com/tpope/vim-pathogen.git
mkdir autoload
ln -s ~/.vim/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
git clone https://github.com/nanotech/jellybeans.vim.git
mkdir colors
ln -s ~/.vim/jellybeans.vim/colors/jellybeans.vim ~/.vim/colors/jellybeans.vim
mkdir bundle
cd bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/jeetsukumaran/vim-buffergator.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/zah/nimrod.vim.git

gnome-tweak-tool
