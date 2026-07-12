#!/bin/bash
set -e

ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"

echo "Symlinks created. Restart your shell or run: source ~/.zshrc"
