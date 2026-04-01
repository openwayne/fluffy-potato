# fluffy-potato

> Terminal config for macOS — Neovim · tmux · Hammerspoon

## Quick start

```sh
git clone https://github.com/yourname/fluffy-potato.git ~/code/fluffy-potato
cd ~/code/fluffy-potato
bash install.sh
```

The script will symlink configs, install Node/Python formatter tools, and set up tpm. On first Neovim launch, **lazy.nvim auto-installs all plugins**.

## Manual setup (if you prefer)

```sh
ln -s ~/code/fluffy-potato/nvim           ~/.config/nvim
ln -s ~/code/fluffy-potato/tmux/.tmux.conf       ~/.tmux.conf
ln -s ~/code/fluffy-potato/tmux/.tmux.conf.local  ~/.tmux.conf.local
ln -s ~/code/fluffy-potato/hammerspoon    ~/.hammerspoon
```

## Dependencies

| Tool | Install |
|------|---------|
| Neovim 0.9+ | `brew install neovim` |
| ripgrep | `brew install ripgrep` (Telescope live grep) |
| prettier / eslint_d | `npm i -g prettier prettier_d_slim eslint_d` |
| black / autopep8 | `pip3 install black autopep8` (Python fmt) |
| tpm | auto-installed by `install.sh` |
| [Nerd Font](https://www.nerdfonts.com/) | auto-installed by `install.sh` (JetBrainsMono) |

## Neovim

After opening nvim, run `:Mason` to install LSP servers. Recommended: `ts_ls`, `eslint`, `cssls`, `jsonls`, `lua_ls`.

### Key bindings

| Key | Action |
|-----|--------|
| `<leader><space>` | File tree |
| `;f` | Find files |
| `;r` | Live grep |
| `\\` | Buffers |
| `;;` | Help tags |
| `<leader>xx` | Diagnostics panel |
| `K` | Hover docs |
| `gd` | Go to definition |
| `gh` | LSP finder |
| `<space>rn` | Rename |
| `<space>ca` | Code action |
| `<C-j>` / `<S-C-j>` | Prev/next diagnostic |
| `]c` / `[c` | Prev/next git hunk |
| `<leader>hs` | Stage hunk |
| `]x` / `[x` | Prev/next git conflict |

## tmux

After launch: `prefix + I` to install plugins.

## Hammerspoon

Copy and edit the example config:

```sh
cp ~/.hammerspoon/config-example.lua ~/.hammerspoon/config.lua
```
