# Zsh & Tmux Config

## Requirements

- [Oh My Zsh](https://ohmyz.sh/)
- Git

## Installation

**1. Set zsh as your default shell** (if not already):

```bash
chsh -s $(which zsh)
```

Log out and back in, or open a new terminal.

**2. Install Oh My Zsh:**

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**3. Clone and run setup:**

```bash
git clone https://github.com/kara7z/zsh-config.git ~/zsh-config
cd ~/zsh-config
./setup.sh
```

**4. Restart your shell:**

```bash
source ~/.zshrc
```

Or open a new terminal.

**5. Open tmux and install plugins:**

Press `prefix + I` (Capital I) to install TPM plugins (tmux-resurrect, tmux-continuum).
