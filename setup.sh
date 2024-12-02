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

# Install oh-my-zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Remove existing .zshrc and configure it
echo "Removing existing .zshrc and configuring new one..."
rm -rf $HOME/.zshrc

# Clone Zsh plugins
echo "Cloning Zsh plugins (zsh-autosuggestions and zsh-syntax-highlighting)..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Link dotfiles
echo "Linking dotfiles..."
ln -s $PWD/zsh/zshrc $HOME/.zshrc
ln -s $PWD/vim $HOME/.vim
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

