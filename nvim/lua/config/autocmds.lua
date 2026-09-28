-- Autocommands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- ─── Cursor line highlight ─────────────────────────────────────────────────
local cursor_group = augroup("CursorHighlight", { clear = true })
autocmd("InsertLeave", { group = cursor_group, command = "setlocal nocursorline nocursorcolumn" })
autocmd("InsertEnter", { group = cursor_group, command = "setlocal cursorline cursorcolumn" })

-- ─── Filetype-specific indentation ────────────────────────────────────────
local indent_group = augroup("FiletypeIndent", { clear = true })

autocmd("FileType", {
  group = indent_group,
  pattern = { "python" },
  command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent",
})
autocmd("FileType", {
  group = indent_group,
  pattern = { "lua", "vim" },
  command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent",
})
autocmd("FileType", {
  group = indent_group,
  pattern = { "typescriptreact", "typescript", "javascript", "javascriptreact", "json", "html", "css", "scss", "sass", "less" },
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent",
})

-- ─── Filetype mappings ─────────────────────────────────────────────────────
local ft_group = augroup("FiletypeMappings", { clear = true })

autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.skim",  command = "set filetype=slim" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.wxml",  command = "set filetype=html" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.wxss",  command = "set filetype=less" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.axml",  command = "set filetype=html" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.acss",  command = "set filetype=less" })
