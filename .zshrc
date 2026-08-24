# ============================================================
# Oh My Zsh
# ============================================================

export ZSH="/usr/share/oh-my-zsh"

ZSH_THEME="robbyrussell"

# Oh My Zsh plugins
plugins=(git)

# Keep completion cache in a fixed location
ZSH_COMPDUMP="$ZSH/cache/.zcompdump"

# Don't check untracked files in Git repositories
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"


# ============================================================
# FZF
# ============================================================

# Enable fzf's Zsh integration
source <(fzf --zsh)

# fzf preview with bat
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:501 {} 2>/dev/null || ls -la {}'"


# ============================================================
# Zoxide
# ============================================================

eval "$(zoxide init zsh)"


# ============================================================
# Zsh Autosuggestions
# ============================================================

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=9'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# ============================================================
# Zsh Syntax Highlighting
# ============================================================

# Keep syntax highlighting LAST among Zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ============================================================
# PATH
# ============================================================

export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"


# ============================================================
# NVM
# ============================================================

export NVM_DIR="$HOME/.nvm"

lazy_load_nvm() {
    unset -f nvm node npm npx
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

for cmd in nvm node npm npx; do
    eval "${cmd}() { lazy_load_nvm; \${cmd} \"\$@\"; }"
done


# ============================================================
# Editors / Applications
# ============================================================

export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty
export YAZI_EDITOR=nvim


# ============================================================
# Yazi
# ============================================================

yy() {
    local tmp="$(mktemp -t yazi-cwd.XXXXXX)"

    yazi "$@" --cwd-file="$tmp"

    if [ -f "$tmp" ]; then
        cd "$(cat "$tmp")"
        rm -f "$tmp"
    fi
}


# ============================================================
# Aliases
# ============================================================

# OpenCode
alias oc="opencode"

# System update
alias update='sudo pacman -Syu --noconfirm && yay -Syu --noconfirm'
#install 
alias install="sudo pacman -S"
#Search
alias search="sudo pacman -Ss"
# Ttyper
alias tt="ttyper"


# ============================================================
# Terminal
# ============================================================

# Set cursor shape
printf '\e[3 q'
