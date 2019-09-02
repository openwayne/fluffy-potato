# fluffy-potato

my terminal config.

---

please install `vim-plug` first.

if u want format jsx, u should visit [prettier.io](https://prettier.io/docs/en/install.html) install it by `yarn global add prettier`

#### Vim

###### Unix

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

###### Windows (PowerShell)

```powershell
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))
```

#### tmux

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Neovim

###### Unix

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

###### Windows (PowerShell)

```powershell
md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\AppData\Local\nvim\autoload\plug.vim"))
```

#### local config

just link `your git path`/fluffy-potato/tmux/.tmux.conf to `~/.tmux.conf`

```sh
ln -s {your git path}/fluffy-potato/tmux/.tmux.conf ~/.tmux.conf
ln -s {your git path}/fluffy-potato/tmux/.tmux.conf.local ~/.tmux.conf.local

# if you want try nvim just append this lines to .zshrc / .bashrc
alias vim=nvim
alias vi=nvim

ln -s {your git path}/fluffy-potato/nvim ~/.config/nvim
```

#### ERROR

```
YouCompleteMe unavailable: requires Vim compiled with Python (2.6+ or 3.3+) support
UltiSnips requires py >= 2.7 or py3
Error: Required vim compiled with +python
```

just install neovim form pip like this `pip install neovim`
