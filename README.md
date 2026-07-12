# Zsh & Tmux Config

## Requirements

- [Oh My Zsh](https://ohmyz.sh/)
- Git

## Installation

**1. Install zsh** (if not already installed):

- **Ubuntu/Debian:** `sudo apt install zsh`
- **Arch Linux:** `sudo pacman -S zsh`
- **Fedora:** `sudo dnf install zsh`
- **macOS (Homebrew):** `brew install zsh`
- **macOS (built-in):** zsh is pre-installed on macOS Catalina and later

**2. Set zsh as your default shell:**

```bash
chsh -s $(which zsh)
```

Log out and back in, or open a new terminal.

**3. Install Oh My Zsh:**

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**4. Clone and run setup:**

```bash
git clone https://github.com/kara7z/zsh-config.git ~/zsh-config
cd ~/zsh-config
./setup.sh
```

**5. Restart your shell:**

```bash
source ~/.zshrc
```

Or open a new terminal.

**6. Open tmux and install plugins:**

Press `prefix + I` (Capital I) to install TPM plugins (tmux-resurrect, tmux-continuum).
