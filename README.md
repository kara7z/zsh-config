# Zsh & Tmux Config

## Requirements

- [Oh My Zsh](https://ohmyz.sh/)
- Git

## Installation

**1. Install Oh My Zsh** (if not already installed):

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**2. Clone and run setup:**

```bash
git clone https://github.com/kara7z/zsh-config.git ~/zsh-config
cd ~/zsh-config
./setup.sh
```

**3. Restart your shell:**

```bash
source ~/.zshrc
```

Or open a new terminal.

**4. Open tmux and install plugins:**

Press `prefix + I` (Capital I) to install TPM plugins (tmux-resurrect, tmux-continuum).
