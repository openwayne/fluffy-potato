-- LSP: mason + vim.lsp.config (Neovim 0.11+ native API) + lspsaga

return {
  -- Mason: LSP/DAP/linter installer UI
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason <-> nvim LSP bridge (auto-install + wire up vim.lsp.enable)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",   -- TypeScript / JavaScript
          "jsonls",  -- JSON
          "cssls",   -- CSS / SCSS / LESS
          "html",    -- HTML
          "eslint",  -- ESLint via LSP
          "lua_ls",  -- Lua
        },
        -- Servers are configured and enabled explicitly below.
        automatic_enable = false,
      })
    end,
  },

  -- nvim-lspconfig: provides server default configs for vim.lsp.config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/lsp-colors.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Diagnostic display
      vim.diagnostic.config({
        underline = true,
        virtual_text = { spacing = 4, prefix = "" },
        signs = true,
        update_in_insert = false,
      })

      -- Per-buffer keymaps, called via LspAttach autocmd
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = ev.buf })
          end

          map("n", "gD",        "<cmd>lua vim.lsp.buf.declaration()<CR>")
          map("n", "gd",        "<cmd>lua vim.lsp.buf.definition()<CR>")
          map("n", "gi",        "<cmd>lua vim.lsp.buf.implementation()<CR>")
          map("n", "gr",        "<cmd>lua vim.lsp.buf.references()<CR>")
          map("n", "K",         "<cmd>Lspsaga hover_doc<CR>")
          map("n", "gh",        "<cmd>Lspsaga finder<CR>")
          map("n", "gp",        "<cmd>Lspsaga peek_definition<CR>")
          map("i", "<C-k>",     "<cmd>lua vim.lsp.buf.signature_help()<CR>")
          map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
          map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
          map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
          map("n", "<space>D",  "<cmd>lua vim.lsp.buf.type_definition()<CR>")
          map("n", "<space>rn", "<cmd>Lspsaga rename<CR>")
          map("n", "<space>ca", "<cmd>Lspsaga code_action<CR>")
          map("n", "<space>e",  "<cmd>lua vim.diagnostic.open_float()<CR>")
          map("n", "<space>q",  "<cmd>lua vim.diagnostic.setloclist()<CR>")
          -- Disable ts_ls formatting (conform.nvim handles it)
          if client and client.name == "ts_ls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end,
      })

      -- Configure servers via new vim.lsp.config API
      local servers = { "jsonls", "cssls", "html", "lua_ls" }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
      })
      vim.lsp.enable("ts_ls")

      vim.lsp.config("eslint", { capabilities = capabilities })
      vim.lsp.enable("eslint")
    end,
  },

  -- LSP UI enhancements
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("lspsaga").setup({
        ui = {
          border = "rounded",
          code_action = "",
        },
        symbol_in_winbar = { enable = false },
        lightbulb = { enable = false },
      })
    end,
  },

  -- LSP diagnostic colors
  {
    "folke/lsp-colors.nvim",
    config = function()
      require("lsp-colors").setup({
        Error       = "#db4b4b",
        Warning     = "#e0af68",
        Information = "#0db9d7",
        Hint        = "#10B981",
      })
    end,
  },
}
