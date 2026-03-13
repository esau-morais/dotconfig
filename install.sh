#!/usr/bin/env bash
set -e

echo "==> Installing system packages..."
sudo apt-get update -qq
sudo apt-get install -y curl git build-essential

echo "==> Installing fish (official PPA)..."
if ! command -v fish &>/dev/null; then
    sudo apt-add-repository -y ppa:fish-shell/release-4
    sudo apt-get update -qq
    sudo apt-get install -y fish
fi

echo "==> Installing remaining system packages..."
sudo apt-get install -y \
    xclip \
    picom \
    feh \
    i3 \
    i3blocks \
    xinput \
    neovim \
    ripgrep \
    lolcat

echo "==> Installing Homebrew (linuxbrew)..."
if ! command -v brew &>/dev/null; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "==> Installing brew packages..."
brew install \
    fzf \
    fd \
    bat \
    lazygit

echo "==> Installing Bun..."
if ! command -v bun &>/dev/null; then
    curl -fsSL https://bun.sh/install | bash
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

echo "==> Installing nvm..."
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash
fi

echo "==> Installing Node.js (LTS) and pnpm via nvm..."
bash -c '
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
    nvm install --lts
    npm install -g pnpm
'

echo "==> Installing Ghostty..."
if ! command -v ghostty &>/dev/null; then
    echo "  Ghostty must be installed manually: https://ghostty.org/download"
fi

echo "==> Setting fish as default shell..."
FISH_PATH="$(command -v fish)"
if ! grep -qx "$FISH_PATH" /etc/shells; then
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi
if [ "$SHELL" != "$FISH_PATH" ]; then
    sudo usermod -s "$FISH_PATH" "$USER"
fi

echo "==> Installing fisher and fish plugins..."
fish -c "
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher install jorgebucaran/fisher
    fisher update
"

echo ""
echo "Done! Log out and back in for the shell change to take effect."
echo "Then run 'tide configure' to set up your prompt style."
