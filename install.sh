#!/usr/bin/env bash

set -e

mkdir -p ~/.config

ln -sfn "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
ln -sfn "$HOME/dotfiles/kitty" "$HOME/.config/kitty"
ln -sfn "$HOME/dotfiles/yazi" "$HOME/.config/yazi"

ln -sfn "$HOME/dotfiles/tmux/.tmux" "$HOME/.tmux"
ln -sfn "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "✅ Dotfiles linked!"
