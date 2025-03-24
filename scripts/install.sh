#!/bin/bash

# Cài đặt các dependencies
pkg update && pkg install -y \
  git \
  stow \
  neovim \
  ripgrep \
  python3-pip \

# Đường dẫn đến thư mục dotfiles
DOTFILES_DIR=~/.dotfiles-termux

# Danh sách các thư mục cần stow
STOW_DIRS=("bash" "zsh" "git" "nvim")

# Sử dụng Stow để tạo symlink
for dir in "${STOW_DIRS[@]}"; do
  echo "Đang thiết lập symlink cho $dir..."
  stow -d $DOTFILES_DIR -t ~ $dir
done

echo "Dotfiles đã được thiết lập thành công!"
