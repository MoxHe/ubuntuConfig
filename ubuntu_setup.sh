#!/bin/zsh
# Author: MoxHe
# About: This script is used to set up a developing evironmnet for MacOS using zsh, nvim, tmux,
#        iterm2, fzf and powerline and etc.
# Note: This sript is intended for setting up freshed MacOS. It's assuming you are using zsh
#       Please read through the script and comment out software you don't want. It will
#       overlap your exiting .zshrc, init.vim, tmux.conf, and pwerline configs for tmux.
#       Please be careful, and back up your exiting config files before running this script.

echo "Start setting up...\n"
echo "Checking software that need to be installed...\n"

# Check for curl, Install if we don't have it
echo "Installing curl..."
apt install curl

# Check for xclip, Install if we don't have it
echo "Installing xclip..."
apt install xclip

# Check for zsh, Install if we don't have it
echo "Installing zsh..."
apt install zsh

# Check for git, Install if we don't have it
echo "Installing git..."
apt install git

# Check for fzf, Install if we don't have it
echo "Installing fzf..."
apt install fzf

# Check for ripgrep, Install if we don't have it
echo "Installing ripgrep..."
apt install ripgrep

# Check for tmux, Install if we don't have it
echo "Installing tmux..."
apt install tmux

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
apt install zsh-syntax-highlighting

# Install yarn
echo "Installing yarn..."
apt install yarn

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
apt install zsh-autosuggestions

# Check for neovim, Install if we don't have it
echo "Installing neovim..."
apt install neovim

# Check for bat, Install if we don't have it
echo "Installing bat..."
apt install bat

# Install python3
echo "Installing python3..."
apt install python3

# Install python3-pip
echo "Installing python3-pip..."
apt install python3-pip

# Install pynvim
echo "Installing pynvim..."
pip3 install pynvim

# Install powerline
echo "Installing powerline..."
pip3 install powerline-status

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh

# Install node.js
echo "Installing Node.js..."
nvm install stable


# Install node neovim
echo "Installing node neovim..."
npm install -g neovim

echo "Updating terminfo to add abilities of showing italics and curly underline"
tic -x ./terminfo/xterm-256color.terminfo
tic -x ./terminfo/tmux.terminfo
tic -x ./terminfo/tmux-256color.terminfo


echo "\nDone!"

