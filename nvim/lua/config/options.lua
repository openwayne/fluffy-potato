-- Core vim options

local opt = vim.opt

-- Leader keys (must be set before plugins load)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable built-in file browser (using nvim-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Appearance
opt.background = "dark"
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "85"
opt.signcolumn = "yes"
opt.termguicolors = true
vim.cmd("syntax on")
vim.cmd("hi Normal ctermfg=252 ctermbg=none")

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileencodings = "utf-8,ucs-bom,gb18030,gbk,gb2312,cp936"

-- Editing
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autoindent = true
opt.cindent = true
opt.backspace = { "indent", "eol", "start" }

-- Search
opt.ignorecase = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Completion
opt.completeopt = { "menuone", "noinsert", "noselect" }

-- Folding
opt.foldmethod = "indent"
opt.foldlevelstart = 99

-- Status
opt.laststatus = 2

-- Misc
opt.errorbells = false

-- Wildignore
opt.wildignore:append("*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*.gif,*.jpeg,.DS_Store,node_modules/*")

-- Plugin-specific globals
vim.g.move_key_modifier = "C"
vim.g.EasyMotion_leader_key = ","
vim.g.rustfmt_autosave = 1
vim.g.startify_custom_header = { "FUCKING EVERY DAY!" }

-- Emmet settings for various filetypes
vim.g.user_zen_settings = {
  php  = { extends = "html", filters = "c" },
  xml  = { extends = "html" },
  axml = { extends = "html" },
  haml = { extends = "html" },
  erb  = { extends = "html" },
}
