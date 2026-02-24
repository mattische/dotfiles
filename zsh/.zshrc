# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme — https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="intheloop"

# Plugins
# zsh-autosuggestions and zsh-syntax-highlighting must be cloned manually:
#   git clone https://github.com/zsh-users/zsh-autosuggestions \
#     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#   git clone https://github.com/zsh-users/zsh-syntax-highlighting \
#     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(git z node npm ruby zsh-autosuggestions zsh-syntax-highlighting)

COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Lazy load thefuck (saves ~300ms at startup)
fuck() {
  unfunction fuck
  eval $(thefuck --alias)
  fuck "$@"
}

# Lazy load nvm (saves ~400ms at startup)
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm()  { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm()  { _load_nvm; npm "$@"; }
npx()  { _load_nvm; npx "$@"; }

# uv — activate if installed via the official installer
[ -s "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Cached completions for uv/uvx (regenerated only when uv is updated)
if command -v uv &>/dev/null; then
  _uv_comp_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/uv_completions.zsh"
  if [[ ! -f "$_uv_comp_cache" || "$commands[uv]" -nt "$_uv_comp_cache" ]]; then
    mkdir -p "$(dirname "$_uv_comp_cache")"
    uv generate-shell-completion zsh >| "$_uv_comp_cache"
    uvx --generate-shell-completion zsh >> "$_uv_comp_cache"
  fi
  source "$_uv_comp_cache"
fi
