#!/bin/bash

# Function to check the OS type
install_macos() {
    echo "Installing dependencies for macOS..."
    brew install htop gh ffmpeg vim tmux quick-lint-js node fzf fd
}

install_linux() {
    echo "Installing dependencies for Linux..."
    sudo apt update
    sudo apt install -y htop vim tmux nodejs fzf
}

rm -rf $HOME/.oh-my-zsh

# Install FZF
echo "Installing FZF..."
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# Install oh-my-zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Remove existing .zshrc and configure it
echo "Removing existing .zshrc and configuring new one..."
rm -rf $HOME/.zshrc
rm -rf $HOME/.vim
rm -rf $HOME/.vimrc
rm -rf $HOME/.tmux.conf
rm -rf $HOME/.gitignore
rm -rf $HOME/.gitconfig
rm -rf $HOME/.zsh_aliases
rm -rf $HOME/.zsh_exports
rm -rf $HOME/.zsh_functions

# Clone Zsh plugins
echo "Cloning Zsh plugins (zsh-autosuggestions and zsh-syntax-highlighting)..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Link dotfiles
echo "Linking dotfiles..."
ln -s $PWD/vim $HOME/.vim
ln -s $PWD/zsh/zshrc $HOME/.zshrc
ln -s $PWD/zsh/zsh_aliases $HOME/.zsh_aliases
ln -s $PWD/zsh/zsh_exports $HOME/.zsh_exports
ln -s $PWD/zsh/zsh_functions $HOME/.zsh_functions
ln -s $PWD/vim/vimrc $HOME/.vimrc
ln -s $PWD/git/gitignore $HOME/.gitignore
ln -s $PWD/git/gitconfig $HOME/.gitconfig
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf

# Install dependencies based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    install_macos
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    install_linux
else
    echo "Unsupported OS. Please install the necessary dependencies manually."
fi

echo "Setup completed!"

