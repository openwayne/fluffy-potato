-- Autocommands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- ─── Cursor line highlight ─────────────────────────────────────────────────
local cursor_group = augroup("CursorHighlight", { clear = true })
autocmd("InsertLeave", { group = cursor_group, command = "se nocul nocuc" })
autocmd("InsertEnter", { group = cursor_group, command = "se cul cuc" })

-- ─── Filetype-specific indentation ────────────────────────────────────────
local indent_group = augroup("FiletypeIndent", { clear = true })

autocmd({ "BufRead", "BufNewFile" }, {
  group = indent_group,
  pattern = { "*.py" },
  command = "set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab autoindent",
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = indent_group,
  pattern = { "*.lua", "*.vim" },
  command = "set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab autoindent",
})
autocmd({ "BufRead", "BufNewFile" }, {
  group = indent_group,
  pattern = { "*.tsx", "*.ts", "*.js", "*.jsx", "*.axml", "*.acss", "*.json", "*.html", "*.htm", "*.less" },
  command = "set shiftwidth=2 tabstop=2 softtabstop=2 expandtab smarttab autoindent",
})

-- ─── Filetype mappings ─────────────────────────────────────────────────────
local ft_group = augroup("FiletypeMappings", { clear = true })

autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.skim",  command = "set filetype=slim" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.wxml",  command = "set filetype=html" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.wxss",  command = "set filetype=less" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.axml",  command = "set filetype=html" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = "*.acss",  command = "set filetype=less" })
autocmd({ "BufNewFile", "BufRead" }, { group = ft_group, pattern = { "*.scss", "*.sass" }, command = "set filetype=scss" })
