#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -sf "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"

# Install TPM if not present
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "Symlinks created. Restart your shell or run: source ~/.zshrc"
echo "Open tmux and press prefix+I to install tmux plugins."
