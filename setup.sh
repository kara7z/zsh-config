#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

ZSH="${ZSH:-$HOME/.oh-my-zsh}"
if [ ! -d "$ZSH" ]; then
  echo "Oh My Zsh is not installed at $ZSH."
  echo "Install it first: https://ohmyz.sh/"
  exit 1
fi

ln -sf "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"

ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
mkdir -p "$ZSH_CUSTOM/plugins"

# Install Oh My Zsh plugins
install_omz_plugin() {
  local name="$1"
  local url="$2"
  local dir="$ZSH_CUSTOM/plugins/$name"
  if [ ! -d "$dir" ]; then
    git clone "$url" "$dir"
  fi
}

install_omz_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_omz_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"

# Install TPM if not present
mkdir -p "$HOME/.tmux/plugins"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "Symlinks created. Restart your shell or run: source ~/.zshrc"
echo "Open tmux and press prefix+I to install tmux plugins."
