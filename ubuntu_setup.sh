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

sudo -i

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

# Install python3
echo "Installing python3..."
apt install python3-pip

logout

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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | sh

# Install node.js
echo "Installing Node.js..."
nvm install stable


# Install node neovim
echo "Installing node neovim..."
npm install -g neovim

mkdir -p ~/.config/nvim/after/ftplugin
mkdir -p ~/.config/bat/config
mkdir -p ~/.config/bat/themes
mkdir -p ~/.config/powerline/themes/tmux
mkdir -p ~/.config/powerline/colorschemes/tmux
mkdir -p ~/.config/skhd
mkdir -p ~/.config/yabai
mkdir -p ~/.config/limelight

# Hard link .zshrc
if [ -f ~/.zshrc ]; then
  echo "Rmeoved existing .zshrc"
  rm ~/.zshrc
fi
echo "Hard link .zshrc"
ln ./zsh/.zshrc ~/.zshrc

# Hard link .zshenv
if [ -f ~/.zshenv ]; then
  echo "Rmeoved existing .zshenv"
  rm ~/.zshenv
fi
echo "Hard link .zshenv"
ln ./zsh/.zshenv ~/.zshenv

# Hard link ~/.tmux.conf
if [ -f ~/.tmux.conf ]; then
  echo "Rmeoved existing ~/.tmux.conf"
  rm ~/.tmux.conf
fi
echo "Hard link ~/.tmux.conf"
ln ./tmux/.tmux.conf ~/.tmux.conf

echo "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Hard link init.vim
if [ -f ~/.config/nvim/init.vim ]; then
  echo "Rmeoved existing init.vim"
  rm ~/.config/nvim/init.vim
fi
echo "Hard link init.vim"
ln ./nvim/init.vim ~/.config/nvim/init.vim

# Hard link fugitive.vim
if [ -f ~/.config/nvim/after/ftplugin/fugitive.vim ]; then
  echo "Rmeoved existing fugitive.vim"
  rm ~/.config/nvim/after/ftplugin/fugitive.vim
fi
echo "Hard link fugitive.vim"
ln ./nvim/after/ftplugin/fugitive.vim ~/.config/nvim/after/ftplugin/fugitive.vim

# Hard link coc-settings.json
if [ -f ~/.config/nvim/coc-settings.json ]; then
  echo "Rmeoved existing coc-settings.json"
  rm ~/.config/nvim/coc-settings.json
fi
echo "Hard link coc-settings.json"
ln ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# Install vim plug manager
echo "Installing vim plug manager"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Hard link bat.conf
if [ -f ~/.config/bat/config/bat.conf ]; then
  echo "Rmeoved existing bat.conf"
  rm ~/.config/bat/config/bat.conf
fi
echo "Hard link bat.conf"
ln ./bat/config/bat.conf ~/.config/bat/config/bat.conf

# Hard link gruvbox.tmTheme
if [ -f ~/.config/bat/themes/gruvbox.tmTheme ]; then
  echo "Rmeoved existing bat.conf"
  rm ~/.config/bat/themes/gruvbox.tmTheme
fi
echo "Hard link gruvbox.tmTheme"
ln ./bat/themes/gruvbox.tmTheme ~/.config/bat/themes/gruvbox.tmTheme

# Update bat binary cache
echo "Update bat binary cache..."
bat cache --build

# Hard link powerline/colors.json
if [ -f ~/.config/powerline/colors.json ]; then
  echo "Rmeoved existing powerline/colors.json"
  rm ~/.config/powerline/colors.json
fi
echo "Hard link powerline/colors.json"
ln ./powerline/colors.json ~/.config/powerline/colors.json

# Hard link powerline/config.json
if [ -f ~/.config/powerline/config.json ]; then
  echo "Rmeoved existing powerline/config.json"
  rm ~/.config/powerline/config.json
fi
echo "Hard link powerline/config.json"
ln ./powerline/config.json ~/.config/powerline/config.json

# Hard link powerline/themes/tmux/default.json
if [ -f ~/.config/powerline/themes/tmux/default.json ]; then
  echo "Rmeoved existing powerline/themes/tmux/default.json"
  rm ~/.config/powerline/themes/tmux/default.json
fi
echo "Hard link powerline/themes/tmux/default.json"
ln ./powerline/themes/tmux/default.json ~/.config/powerline/themes/tmux/default.json

# Hard link powerline/colorschemes/gruvbox_dark.json
if [ -f ~/.config/powerline/colorschemes/gruvbox_dark.json ]; then
  echo "Rmeoved existing powerline/colorschemes/gruvbox_dark.json"
  rm ~/.config/powerline/colorschemes/gruvbox_dark.json
fi
echo "Hard link powerline/colorschemes/gruvbox_dark.json"
ln ./powerline/colorschemes/gruvbox_dark.json ~/.config/powerline/colorschemes/gruvbox_dark.json

# Hard link powerline/colorschemes/tmux/gruvbox_dark.json
if [ -f ~/.config/powerline/colorschemes/tmux/gruvbox_dark.json ]; then
  echo "Rmeoved existing powerline/colorschemes/tmux/gruvbox_dark.json"
  rm ~/.config/powerline/colorschemes/tmux/gruvbox_dark.json
fi
echo "Hard link powerline/colorschemes/tmux/gruvbox_dark.json"
ln ./powerline/colorschemes/tmux/gruvbox_dark.json ~/.config/powerline/colorschemes/tmux/gruvbox_dark.json

# Hard link nvim/github-markdown.css
if [ -f ~/.config/nvim/github-markdown.css ]; then
  echo "Rmeoved existing github-markdown.css"
  rm ~/.config/nvim/github-markdown.css
fi
echo "Hard link github-markdown.css"
ln ./nvim/github-markdown.css ~/.config/nvim/github-markdown.css


# # Install nerd font
# echo "Installing nerd font..."
# apt tap homebrew/cask-fonts
# apt cask install font-hack-nerd-font


echo "\nDone!"

