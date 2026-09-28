-- Miscellaneous tools: copilot, ale, youdao, NrrwRgn, etc.

return {
  -- GitHub Copilot
  { "github/copilot.vim" },

  -- ALE: async linting (separate from LSP)
  {
    "dense-analysis/ale",
    -- ESLint diagnostics already come from the native eslint LSP.
    enabled = false,
    config = function()
      vim.g.ale_linters_explicit = 1
      vim.g.ale_linters = {
        javascript      = { "eslint" },
        javascriptreact = { "eslint" },
        typescript      = { "eslint" },
        typescriptreact = { "eslint" },
      }
      -- Let conform.nvim handle formatting; ALE only lints
      vim.g.ale_fix_on_save = 0
      vim.g.ale_sign_error   = "✗"
      vim.g.ale_sign_warning = "⚠"
    end,
  },

  -- Youdao translator
  {
    "ianva/vim-youdao-translater",
    -- keymaps defined in lua/config/keymaps.lua
  },

  -- Bufferline
  { "bling/vim-bufferline" },

}
