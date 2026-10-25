# ============================================================
# Oh My Zsh
# ============================================================

# Respect an existing installation, then check common user/system locations.
for zsh_dir in "${ZSH:-}" "$HOME/.oh-my-zsh" \
    "$HOME/.nix-profile/share/oh-my-zsh" \
    "/etc/profiles/per-user/$USER/share/oh-my-zsh" \
    /run/current-system/sw/share/oh-my-zsh /usr/share/oh-my-zsh; do
    if [[ -r "$zsh_dir/oh-my-zsh.sh" ]]; then
        export ZSH="$zsh_dir"
        break
    fi
done
unset zsh_dir

ZSH_THEME="robbyrussell"

# Oh My Zsh plugins
plugins=(git)

# Keep completion cache in a fixed location
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"

# Don't check untracked files in Git repositories
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load Oh My Zsh
if [[ -n "$ZSH" && -r "$ZSH/oh-my-zsh.sh" ]]; then
    mkdir -p "${ZSH_COMPDUMP:h}"
    source "$ZSH/oh-my-zsh.sh"
fi


# ============================================================
# FZF
# ============================================================

# Enable fzf's Zsh integration
if (( $+commands[fzf] )); then
    source <(fzf --zsh)
fi

# fzf preview with bat
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:501 {} 2>/dev/null || ls -la {}'"


# ============================================================
# Zoxide
# ============================================================

if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
fi


# ============================================================
# Zsh Autosuggestions
# ============================================================

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=9'

# Support setup.sh's custom plugins as well as distro/Nix packages.
source_zsh_plugin() {
    local plugin="$1" base
    for base in "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins" \
        "$HOME/.nix-profile/share" "/etc/profiles/per-user/$USER/share" \
        /run/current-system/sw/share /usr/share/zsh/plugins /usr/share; do
        if [[ -r "$base/$plugin/$plugin.zsh" ]]; then
            source "$base/$plugin/$plugin.zsh"
            return
        fi
    done
    return 0
}

source_zsh_plugin zsh-autosuggestions


# ============================================================
# Zsh Syntax Highlighting
# ============================================================

# Keep syntax highlighting LAST among Zsh plugins
source_zsh_plugin zsh-syntax-highlighting
unfunction source_zsh_plugin


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
