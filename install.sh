#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

FORCE=false
if [[ "${1:-}" == "--force" ]]; then
    FORCE=true
fi

link() {
    local src="$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [[ -L "$dst" ]]; then
        rm "$dst"
    elif [[ -e "$dst" ]]; then
        if $FORCE; then
            echo "Removing $dst"
            rm -rf "$dst"
        else
            echo "Backing up $dst -> ${dst}.backup"
            mv "$dst" "${dst}.backup"
        fi
    fi

    ln -s "$src" "$dst"
    echo "Linked $dst -> $src"
}

link "$DOTFILES/nvim"          "$HOME/.config/nvim"
link "$DOTFILES/kitty"         "$HOME/.config/kitty"
link "$DOTFILES/yazi"          "$HOME/.config/yazi"
link "$DOTFILES/tmux/.tmux"    "$HOME/.tmux"
link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

if [ ! -f "$HOME/.config/kitty/local.conf" ]; then
    cat > "$HOME/.config/kitty/local.conf" <<EOF
# Local Kitty overrides
# Example:
# font_size 16
EOF
fi

echo "✅ Done!"
