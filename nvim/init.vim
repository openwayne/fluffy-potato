syntax on
" set autoread
" set color theme
"colorscheme busybee

let g:move_key_modifier = 'C'
let mapleader="\<Space>"
let g:mapleader="\<Space>"

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

set t_Co=16
" let g:solarized_termcolors=256
set background=dark
" solarized options
" colorscheme solarized

hi Normal ctermfg=252 ctermbg=none

"Check syntastic by neomake
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq=1

"autocmd BufWritePost * Neomake
"autocmd BufEnter * Neomake
"autocmd VimEnter * UpdateRemotePlugins .

" Configuration section of vundle
filetype on "检测文件类型
filetype plugin on " 加载相关类型文件插件
filetype plugin indent on "为特定文件类型载入相关缩进文件

" End of vundle configuration

"Powerline setting
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"Setup SuperTab
let g:SuperTabRetainCompletionType="context"

"For Indent Guides Plugin
"let g:indent_guides_enable_on_vim_startup = 1

" 设定文件浏览器目录为当前目录
set bsdir=buffer
" 设置编码
set encoding=utf-8
set nocompatible
set laststatus=2
" 设置文件编码
set fenc=utf-8

"set to use clipboard of system
set clipboard=unnamed

" 设置文件编码检测类型及支持格式
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"显示行号
set number
"Show related row numbers
set relativenumber

"settings for backspace
set backspace=2
set backspace=indent,eol,start

"忽略大小写查找
set ic

" tab宽度
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4
set expandtab

" 标尺相关 
set colorcolumn=85
"set cursorline
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
autocmd InsertLeave * se nocuc
autocmd InsertEnter * se cuc

" 去掉输入错误的提示声音
set noeb

" set 折叠
set foldmethod=indent

" 打开文件默认不折叠
set foldlevelstart=99

"For Rust settings
let g:rustfmt_autosave = 1

let g:neomake_open_list = 2
let g:neomake_list_height = 7


"  映射NERDTree插件
"let loaded_nerd_tree=1
"let NERDTreeQuitOnOpen = 0
"autocmd vimenter * NERDTree
let NERDChristmasTree=1
let g:NERDTreeWinSize = 32

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeGitStatusIndicatorMapCustom= {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

" Settings for vim-easymotion
let g:EasyMotion_leader_key = ","

"set zen coding
let g:user_zen_settings = {
            \  'php' : {
            \    'extends' : 'html',
            \    'filters' : 'c',
            \  },
            \  'xml' : {
            \    'extends' : 'html',
            \  },
            \  'axml' : {
            \    'extends' : 'html',
            \  },
            \  'haml' : {
            \    'extends' : 'html',
            \  },
            \  'erb' : {
            \    'extends' : 'html',
            \  },
            \}

"set CtrlP
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor ' .
                \ '--nogroup --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore' .
                \ ' ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif

let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*.gif,*.jpeg,.DS_Store,node_modules/*
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$|node_modules$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


"let skim use slim syntax
au BufRead,BufNewFile *.skim set filetype=slim

"for python
au BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab autoindent

"scss,sass
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=scss

"for typescript or js or axml or acss or json
au BufRead,BufNewFile *.tsx,*.ts,*.js,*jsx,*.axml,*.acss,*.json,*.html,*.htm set shiftwidth=2 tabstop=2 softtabstop=2 expandtab smarttab autoindent
au BufNewFile,BufRead *.wxml set filetype=html
au BufNewFile,BufRead *.wxss set filetype=less
au BufNewFile,BufRead *.axml set filetype=html
au BufNewFile,BufRead *.acss set filetype=less

"for typescript or js or axml or acss or json
au BufRead,BufNewFile *.tsx,*.ts,*.js,*.axml,*.acss,*.json,*.html,*.htm,*.less set shiftwidth=2 tabstop=2 softtabstop=2 expandtab smarttab autoindent

" add neoformat files
let g:neoformat_try_formatprg = 1

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.axml,*.acss,*.wcss,*.wxml Neoformat

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" vim-gitgutter {
" Disable all the git-gutter key bindings
let g:gitgutter_map_keys = 0
" Show the gutter always
" replace it with below let g:gitgutter_sign_column_always = 1
set signcolumn=yes
" }

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" For startify
let g:startify_custom_header = [
            \ 'FUCKING EVERY DAY!',
            \]

""youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
""let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
""let g:ycm_key_list_previous_completion = ['<Up>']
"
"let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
"let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
"let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
""nnoremap <leader>lo :lopen<CR> "open locationlist
""nnoremap <leader>lc :lclose<CR>    "close locationlist
""在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"

let g:UltiSnipsExpandTrigger="<tab>"

" init plugins
runtime ./plug.vim
runtime ./maps.vim

" init macos special config
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

