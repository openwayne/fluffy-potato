call plug#begin('~/.local/share/nvim/plugged')

Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/xml.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Lokaltog/vim-easymotion'

" Deps {
if executable('ag')
    Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }
" General {
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rhysd/conflict-marker.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'gcmt/wildfire.vim'
" }

" General Programming {
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'bling/vim-bufferline'
Plug 'sbdchd/neoformat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Snippets & AutoComplete {
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tami5/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-syntastic/syntastic'
" }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'

Plug 'mhinz/vim-startify'
Plug 'vim-scripts/wildfire.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ianva/vim-youdao-translater'
Plug 'matze/vim-move'
Plug 'pbrisbin/vim-mkdir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Plugin(s) for frontend
Plug 'leafgarland/typescript-vim'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'w0rp/ale' "removing unused modules and vars
Plug 'chrisbra/NrrwRgn'

call plug#end()

