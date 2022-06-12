" Description: Keymaps

"For Youdao Translater Plugin
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR>

nnoremap <C-s> :bn<CR>
nnoremap <C-a> :bp<CR>

" sh打开终端
nnoremap <leader>z :new<CR>:terminal<CR>source $HOME/.zshrc<CR>c<CR>

"tabs
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove

" tab navigation like zsh
nmap <leader>h :tabprevious<CR>
nmap <leader>l :tabnext<CR>

" settings for resize splitted window
nmap w[ :vertical resize -3<CR>
nmap w] :vertical resize +3<CR>

nmap w- :resize -3<CR>
nmap w= :resize +3<CR>

"For neomake
map <leader>m :Neomake<CR>

"Disable highlight
map <leader>n :nohl<CR>

" open/close NERDTree
map <leader>f :NERDTreeToggle<CR>

"Settings for TagBar
map <leader>g :TagbarToggle<CR>

"switch window
:map <leader>w <C-W>w

"use in  edit
imap <C-A> <C-C><c-p>

" move lines up or down (command - D)
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Tab move lines left or right (c-Ctrl,s-Shift)
nmap    <c-tab>     v>
nmap    <s-tab>     v<
vmap    <c-tab>     >gv
vmap    <s-tab>     <gv
