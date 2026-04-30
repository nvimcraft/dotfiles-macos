# PowerLevel10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR="nvim"
export BAT_THEME="TwoDark"

typeset -U path PATH

path=(
  /opt/homebrew/bin
  $HOME/.cargo/bin
  $HOME/go/bin
  $HOME/.local/share/bob/nvim-bin(N)
  $path
)

export PATH

ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR"

autoload -Uz compinit

ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump"

# If dump is corrupted or missing, rebuild safely
if [[ ! -s "$ZSH_COMPDUMP" ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -d "$ZSH_COMPDUMP" -C
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

if command -v jj >/dev/null 2>&1; then
  source <(COMPLETE=zsh jj)
fi

if [[ -f /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
fi

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

alias ls='eza --long --all --git --icons --time-style=iso --group --classify'
alias tree='eza --all --tree --icons --ignore-glob="node_modules|.git|.jj"'

alias brew-maint="$HOME/dotfiles-macos/scripts/brew-maintenance.sh"
alias cleanup="$HOME/dotfiles-macos/scripts/system-cleanup.sh"
alias tmux-s="$HOME/dotfiles-macos/scripts/tmux-session.sh"
alias jjid="$HOME/dotfiles-macos/scripts/jj-set-identity.sh"
