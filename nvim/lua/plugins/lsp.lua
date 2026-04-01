-- LSP: mason + lspconfig + lspsaga

return {
  -- Mason: LSP/DAP/linter installer
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

  -- Mason <-> lspconfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",        -- TypeScript / JavaScript
          "jsonls",       -- JSON
          "cssls",        -- CSS / SCSS / LESS
          "html",         -- HTML
          "eslint",       -- ESLint via LSP
          "lua_ls",       -- Lua
        },
        automatic_installation = true,
      })
    end,
  },

  -- Core LSP config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/lsp-colors.nvim",
    },
    config = function()
      local lspconfig  = require("lspconfig")
      local protocol   = require("vim.lsp.protocol")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      -- CompletionItemKind icons
      protocol.CompletionItemKind = {
        "", "", "", "", "", "", "", "ﰮ", "", "",
        "", "", "", "", "﬌", "", "", "", "", "",
        "", "", "", "ﬦ", "",
      }

      -- Per-buffer LSP keymaps
      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
        end

        map("n", "gD",        "<cmd>lua vim.lsp.buf.declaration()<CR>")
        map("n", "gd",        "<cmd>lua vim.lsp.buf.definition()<CR>")
        map("n", "gi",        "<cmd>lua vim.lsp.buf.implementation()<CR>")
        map("n", "gr",        "<cmd>lua vim.lsp.buf.references()<CR>")
        map("n", "K",         "<cmd>Lspsaga hover_doc<CR>")
        map("n", "gh",        "<cmd>Lspsaga finder<CR>")
        map("n", "gp",        "<cmd>Lspsaga peek_definition<CR>")
        map("n", "<C-j>",     "<cmd>Lspsaga diagnostic_jump_next<CR>")
        map("n", "<S-C-j>",   "<cmd>Lspsaga diagnostic_jump_prev<CR>")
        map("i", "<C-k>",     "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        map("n", "<space>wa",  "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
        map("n", "<space>wr",  "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
        map("n", "<space>wl",  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
        map("n", "<space>D",   "<cmd>lua vim.lsp.buf.type_definition()<CR>")
        map("n", "<space>rn",  "<cmd>Lspsaga rename<CR>")
        map("n", "<space>ca",  "<cmd>Lspsaga code_action<CR>")
        map("n", "<space>e",   "<cmd>lua vim.diagnostic.open_float()<CR>")
        map("n", "<space>q",   "<cmd>lua vim.diagnostic.setloclist()<CR>")
        map("n", "<space>f",   "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")

        -- Disable tsserver formatting (conform.nvim handles it)
        if client.name == "ts_ls" then
          client.server_capabilities.documentFormattingProvider = false
        end
      end

      -- Diagnostic display config
      vim.diagnostic.config({
        underline = true,
        virtual_text = { spacing = 4, prefix = "" },
        signs = true,
        update_in_insert = false,
      })

      -- Servers
      local servers = { "flow", "jsonls", "cssls", "html", "lua_ls" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({ on_attach = on_attach, capabilities = capabilities })
      end

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
      })

      -- diagnosticls for eslint_d + prettier_d_slim
      lspconfig.diagnosticls.setup({
        on_attach = on_attach,
        filetypes = { "javascript", "javascriptreact", "json", "typescript", "typescriptreact", "css", "less", "scss" },
        init_options = {
          linters = {
            eslint = {
              command = "eslint_d",
              rootPatterns = { ".git" },
              debounce = 100,
              args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
              sourceName = "eslint_d",
              parseJson = {
                errorsRoot = "[0].messages",
                line = "line", column = "column",
                endLine = "endLine", endColumn = "endColumn",
                message = "[eslint] ${message} [${ruleId}]",
                security = "severity",
              },
              securities = { [2] = "error", [1] = "warning" },
            },
          },
          filetypes = {
            javascript = "eslint", javascriptreact = "eslint",
            typescript = "eslint", typescriptreact = "eslint",
          },
          formatters = {
            eslint_d = {
              command = "eslint_d",
              rootPatterns = { ".git" },
              args = { "--stdin", "--stdin-filename", "%filename", "--fix-to-stdout" },
            },
            prettier = {
              command = "prettier_d_slim",
              rootPatterns = { ".git" },
              args = { "--stdin", "--stdin-filepath", "%filename" },
            },
          },
          formatFiletypes = {
            css = "prettier", javascript = "prettier", javascriptreact = "prettier",
            json = "prettier", scss = "prettier", less = "prettier",
            typescript = "prettier", typescriptreact = "prettier",
          },
        },
      })
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
