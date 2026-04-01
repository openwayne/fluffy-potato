-- UI plugins: statusline, file tree, icons, diagnostics panel, keybinding help, tabline

return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "solarized_dark",
          section_separators    = { left = "", right = "" },
          component_separators  = { left = "", right = "" },
          disabled_filetypes = {},
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { { "filename", file_status = true, path = 0 } },
          lualine_x = {
            { "diagnostics", sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " } },
            "encoding", "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {}, lualine_b = {},
          lualine_c = { { "filename", file_status = true, path = 1 } },
          lualine_x = { "location" },
          lualine_y = {}, lualine_z = {},
        },
        extensions = { "fugitive", "nvim-tree" },
      })
    end,
  },

  -- File icons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },

  -- File tree (replaces NERDTree + Defx)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 32, side = "left" },
        renderer = {
          icons = {
            glyphs = {
              git = {
                unstaged  = "✹", staged  = "✚", untracked = "✭",
                renamed   = "➜", unmerged = "═", deleted = "✖",
                ignored   = "☒",
              },
            },
          },
        },
        filters = { dotfiles = false },
        git = { enable = true },
      })
    end,
  },

  -- Diagnostics panel (replaces loclist)
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({ use_diagnostic_signs = true })
    end,
  },

  -- Which-key: keybinding discovery popup (v3+ API)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({ win = { border = "rounded" } })
      -- Register key group prefixes using v3 API
      wk.add({
        { "<leader>x", group = "trouble/diagnostics" },
        { "<leader>t", group = "tabs" },
        { "<leader>w", group = "window" },
        { "<leader>h", group = "git hunks" },
        { "<space>w",  group = "workspace" },
      })
    end,
  },

  -- Rainbow brackets
  { "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = 1
    end,
  },

  -- Indent guides
  {
    "nathanaelkane/vim-indent-guides",
    config = function()
      vim.g.indent_guides_enable_on_vim_startup = 1
    end,
  },

  -- Custom tabline (kept as VimScript, loaded via after/plugin)
  -- tabline.rc.vim is kept in after/plugin/tabline.rc.vim

  -- Startify start screen
  {
    "mhinz/vim-startify",
    config = function()
      vim.g.startify_custom_header = { "FUCKING EVERY DAY!" }
    end,
  },
}
