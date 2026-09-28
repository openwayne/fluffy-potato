#!/usr/bin/env bash
# install.sh — fluffy-potato dotfiles installer
# Usage: bash install.sh [--dry-run]

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

# ─── Helpers ──────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
info()  { echo -e "${GREEN}[✓]${NC} $*"; }
warn()  { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }

run() {
  if $DRY_RUN; then
    echo "  (dry-run) $*"
  else
    eval "$*"
  fi
}

link() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    warn "Backing up existing $dst → ${dst}.bak"
    run "mv '$dst' '${dst}.bak'"
  fi
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    info "Already linked: $dst"
  else
    run "ln -sf '$src' '$dst'"
    info "Linked: $dst → $src"
  fi
}

require_cmd() {
  command -v "$1" &>/dev/null || { error "Required: $1 (not found)"; return 1; }
}

# ─── Checks ───────────────────────────────────────────────────────────────────
echo ""
echo "  fluffy-potato dotfiles"
echo "  ────────────────────────────────"
$DRY_RUN && warn "Dry-run mode — no changes will be made"
echo ""

# macOS only
[[ "$(uname)" != "Darwin" ]] && { error "macOS only."; exit 1; }

# Neovim version check
if command -v nvim &>/dev/null; then
  NVIM_VER=$(nvim --version | head -1 | grep -oE '[0-9]+\.[0-9]+' | head -1)
  NVIM_MAJOR=$(echo "$NVIM_VER" | cut -d. -f1)
  NVIM_MINOR=$(echo "$NVIM_VER" | cut -d. -f2)
  if [ "$NVIM_MAJOR" -lt 1 ] && [ "$NVIM_MINOR" -lt 9 ]; then
    warn "Neovim 0.9+ recommended (found $NVIM_VER)"
  else
    info "Neovim $NVIM_VER"
  fi
else
  warn "Neovim not found — install with: brew install neovim"
fi

# ─── Symlinks ─────────────────────────────────────────────────────────────────
echo ""
echo "  Setting up symlinks..."
echo ""

# Neovim
link "$DOTFILES/nvim" "$HOME/.config/nvim"

# Tmux
link "$DOTFILES/tmux/.tmux.conf"       "$HOME/.tmux.conf"
link "$DOTFILES/tmux/.tmux.conf.local" "$HOME/.tmux.conf.local"

# Hammerspoon (optional)
if [ -d "$HOME/.hammerspoon" ] || [ -L "$HOME/.hammerspoon" ]; then
  warn "~/.hammerspoon already exists — skipping (link manually if needed)"
else
  link "$DOTFILES/hammerspoon" "$HOME/.hammerspoon"
fi

# ─── Node tools (for Neovim formatters / linters) ─────────────────────────────
echo ""
echo "  Installing Node tools..."
echo ""

if command -v npm &>/dev/null; then
  NODE_PKGS=(prettier prettier_d_slim eslint_d)
  for pkg in "${NODE_PKGS[@]}"; do
    if npm list -g "$pkg" &>/dev/null 2>&1; then
      info "$pkg already installed"
    else
      info "Installing $pkg..."
      run "npm install -g $pkg"
    fi
  done
else
  warn "npm not found — skipping Node tools (prettier, eslint_d)"
fi

# ripgrep (for Telescope live_grep)
if command -v rg &>/dev/null; then
  info "ripgrep already installed"
elif command -v brew &>/dev/null; then
  info "Installing ripgrep..."
  run "brew install ripgrep"
else
  warn "ripgrep not found — install for Telescope live grep: brew install ripgrep"
fi

# Treesitter's main branch requires the standalone parser compiler CLI.
if command -v tree-sitter &>/dev/null; then
  info "tree-sitter CLI already installed"
elif command -v brew &>/dev/null; then
  info "Installing tree-sitter CLI..."
  run "brew install tree-sitter-cli"
else
  warn "tree-sitter CLI not found — install for Neovim parsers: brew install tree-sitter-cli"
fi

# ─── Nerd Fonts ───────────────────────────────────────────────────────────────
echo ""
echo "  Installing Nerd Font..."
echo ""

FONT_CASK="font-jetbrains-mono-nerd-font"
if command -v brew &>/dev/null; then
  if brew list --cask "$FONT_CASK" &>/dev/null 2>&1; then
    info "JetBrainsMono Nerd Font already installed"
  else
    info "Installing JetBrainsMono Nerd Font..."
    run "brew install --cask $FONT_CASK"
    info "Font installed — set it in your terminal emulator preferences"
  fi
else
  warn "Homebrew not found — install Nerd Font manually from https://www.nerdfonts.com/font-downloads"
  warn "Recommended: JetBrainsMono Nerd Font"
fi

# ─── Python tools (optional, for Python formatting) ──────────────────────────
echo ""
echo "  Checking Python tools..."
echo ""

if command -v pip3 &>/dev/null; then
  for pkg in black autopep8; do
    if pip3 show "$pkg" &>/dev/null 2>&1; then
      info "$pkg already installed"
    else
      info "Installing $pkg..."
      run "pip3 install $pkg"
    fi
  done
else
  warn "pip3 not found — skipping Python formatters (black, autopep8)"
fi

# ─── Tmux plugin manager ──────────────────────────────────────────────────────
echo ""
echo "  Setting up tmux..."
echo ""

TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
  info "tpm already installed"
else
  info "Installing tpm..."
  run "git clone https://github.com/tmux-plugins/tpm '$TPM_DIR'"
fi

# Fix tmux copy-mode syntax (macOS)
TMUX_OSX="$DOTFILES/tmux/.tmux-osx.conf"
if [ -f "$TMUX_OSX" ] && grep -q 'bind-key -t vi-copy' "$TMUX_OSX" 2>/dev/null; then
  warn "Fixing deprecated tmux copy-mode syntax in .tmux-osx.conf..."
  run "sed -i.bak 's/bind-key -t vi-copy y/bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel/g' '$TMUX_OSX'"
fi

# ─── Done ─────────────────────────────────────────────────────────────────────
echo ""
echo "  ────────────────────────────────"
info "Done!"
echo ""
echo "  Next steps:"
echo "  1. Open Neovim — lazy.nvim will auto-install all plugins"
echo "  2. Run :Mason to install LSP servers (ts_ls, eslint, cssls…)"
echo "  3. In tmux: prefix + I  to install tmux plugins (continuum, yank, vim-tmux-navigator)"
echo ""
