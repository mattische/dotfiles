#!/usr/bin/env bash
# Creates symlinks from dotfiles to their expected locations.
# Run: bash install.sh

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked: $dst"
}

echo "Installing dotfiles from $DOTFILES ..."

link "$DOTFILES/zsh/.zshrc"     "$HOME/.zshrc"
link "$DOTFILES/zsh/.zprofile"  "$HOME/.zprofile"
link "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"
link "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

echo "Done. Open a new shell to apply changes."
echo ""
echo "Remember to edit ~/.gitconfig and ~/.zprofile with machine-specific values."
