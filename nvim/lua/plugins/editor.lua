-- Editor plugins: telescope, treesitter, autopairs, autotag, conform, surround, etc.

return {
  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local actions   = require("telescope.actions")
      telescope.setup({
        defaults = {
          -- Telescope 0.1.x uses Treesitter APIs removed on its main branch.
          -- Keep previews working with Vim's regex-based syntax highlighting.
          preview = { treesitter = false },
          mappings = {
            n = { ["q"] = actions.close },
          },
        },
      })
    end,
  },
  { "nvim-lua/plenary.nvim" },

  -- Treesitter: syntax highlighting + indent
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup({})
      treesitter.install({
        "tsx", "typescript", "javascript",
        "json", "yaml", "toml",
        "html", "css", "scss",
        "lua", "vim", "vimdoc",
        "bash", "python", "go", "rust",
        "fish", "php", "swift", "markdown", "markdown_inline",
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterFeatures", { clear = true }),
        callback = function(event)
          -- Missing/unsupported parsers should leave normal editing available.
          if pcall(vim.treesitter.start, event.buf) then
            vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  -- Auto-close brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
      -- Connect autopairs to nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Auto HTML/JSX tag closing
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Formatter (replaces neoformat)
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript      = { "prettier" },
          javascriptreact = { "prettier" },
          typescript      = { "prettier" },
          typescriptreact = { "prettier" },
          css             = { "prettier" },
          less            = { "prettier" },
          scss            = { "prettier" },
          html            = { "prettier" },
          json            = { "prettier" },
          yaml            = { "prettier" },
          markdown        = { "prettier" },
          graphql         = { "prettier" },
          python          = { "black", "autopep8", stop_after_first = true },
          lua             = { "stylua" },
        },
        format_on_save = {
          timeout_ms   = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },

  -- Surround text objects
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },

  -- Commentary
  { "tpope/vim-commentary" },

  -- Emmet (HTML/JSX expansion)
  { "mattn/emmet-vim" },

  -- Multiple cursors
  { "terryma/vim-multiple-cursors" },

  -- Smart text selection
  { "gcmt/wildfire.vim" },

  -- Move lines with Ctrl+j/k
  { "matze/vim-move" },

  -- Auto-create missing directories on :w
  { "pbrisbin/vim-mkdir" },

  -- Git conflict navigation
  {
    "rhysd/conflict-marker.vim",
    config = function()
      -- Navigate conflicts
      vim.keymap.set("n", "]x", "<Plug>(conflict-marker-next-conflict)", { silent = true })
      vim.keymap.set("n", "[x", "<Plug>(conflict-marker-prev-conflict)", { silent = true })
      -- Choose side: ourselves (o), theirs (t), base (b)
      vim.keymap.set("n", "co", "<Plug>(conflict-marker-ourselves)", { silent = true })
      vim.keymap.set("n", "ct", "<Plug>(conflict-marker-theirs)", { silent = true })
      vim.keymap.set("n", "cb", "<Plug>(conflict-marker-base)", { silent = true })
    end,
  },

  -- Narrow region editing
  { "chrisbra/NrrwRgn" },

  -- Align text
  { "godlygeek/tabular" },

  -- EasyMotion for jump navigation
  { "Lokaltog/vim-easymotion" },

  -- fzf (used by some plugins)
  { "junegunn/fzf", build = "./install --all" },

  -- Tagbar for code outline
  { "majutsushi/tagbar" },

  -- XML editing helpers
  { "vim-scripts/xml.vim" },

  -- Seamless navigation between tmux panes and nvim splits (C-h/j/k/l)
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft", "TmuxNavigateDown",
      "TmuxNavigateUp",   "TmuxNavigateRight",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },
}
