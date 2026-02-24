# dotfiles

Config for zsh (oh-my-zsh), ghostty, and git.

## Install

```bash
git clone <repo-url> ~/dotfiles
bash ~/dotfiles/install.sh
```

Then edit `~/.gitconfig` and `~/.zprofile` with machine-specific values (see comments in each file).

---

## macOS

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Tools
brew install git git-lfs thefuck

# Extra tools
brew install bat scc gitbatch

# Ghostty
brew install --cask ghostty

# zsh is the default shell on macOS — no install needed

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash

# uv (Python)
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Add Homebrew init and any PATH entries to `~/.zprofile` (see comments in that file).

---

## Linux (Ubuntu/Debian)

```bash
sudo apt update && sudo apt install -y git git-lfs zsh thefuck

# Set zsh as default shell
chsh -s $(which zsh)

# Ghostty — community .deb package (ghostty is not on Flathub/Flatpak)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
# Alternatively, build from source: https://ghostty.org/docs/install/build

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash

# uv (Python)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Extra tools
sudo apt install -y bat
sudo snap install scc
# gitbatch — download and install latest binary
curl -sL https://github.com/isacikgoz/gitbatch/releases/latest/download/gitbatch_linux_amd64.tar.gz \
  | tar xz -C /tmp && sudo mv /tmp/gitbatch /usr/local/bin/gitbatch

# bat is installed as batcat on Ubuntu — add alias to ~/.zshrc:
echo 'alias bat=batcat' >> ~/.zshrc

# Verify zsh path — update ghostty/config command = /bin/zsh if different
which zsh

# Set Ghostty as default terminal (GNOME)
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which ghostty) 50
sudo update-alternatives --set x-terminal-emulator $(which ghostty)
gsettings set org.gnome.desktop.default-applications.terminal exec 'ghostty'
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''
```

---

## zsh theme

`intheloop` — bundled with oh-my-zsh, no extra install needed.

---

## Ghostty theme

`vesper` — bundled with ghostty. The `cmd+s` leader key is used for all keybindings (splits, tabs, etc).
On Linux, replace `cmd` with `ctrl` or `super` in `ghostty/config` if preferred.
