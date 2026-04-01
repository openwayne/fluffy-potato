-- All keymaps in one place
-- Collected from: maps.vim, lspconfig.rc.vim, telescope.rc.vim, cmp.rc.vim

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ─── Buffer navigation ─────────────────────────────────────────────────────
map("n", "<C-s>", ":bn<CR>", opts)
map("n", "<C-a>", ":bp<CR>", opts)

-- ─── Terminal ──────────────────────────────────────────────────────────────
map("n", "<leader>z", ":new<CR>:terminal<CR>", opts)

-- ─── Tabs ──────────────────────────────────────────────────────────────────
map("n", "<leader>tn", ":tabnew<CR>", opts)
map("n", "<leader>te", ":tabedit ", { noremap = true })
map("n", "<leader>tc", ":tabclose<CR>", opts)
map("n", "<leader>tm", ":tabmove ", { noremap = true })
map("n", "<leader>h", ":tabprevious<CR>", opts)
map("n", "<leader>l", ":tabnext<CR>", opts)

-- ─── Window resize ─────────────────────────────────────────────────────────
map("n", "w[", ":vertical resize -3<CR>", opts)
map("n", "w]", ":vertical resize +3<CR>", opts)
map("n", "w-", ":resize -3<CR>", opts)
map("n", "w=", ":resize +3<CR>", opts)
map("n", "<leader>w", "<C-W>w", opts)

-- ─── Search ────────────────────────────────────────────────────────────────
map("n", "<leader>n", ":nohl<CR>", opts)

-- ─── File tree (nvim-tree) ─────────────────────────────────────────────────
map("n", "<leader><space>", ":NvimTreeToggle<CR>", opts)

-- ─── Tagbar ────────────────────────────────────────────────────────────────
map("n", "<leader>g", ":TagbarToggle<CR>", opts)

-- ─── Insert mode completion ────────────────────────────────────────────────
map("i", "<C-A>", "<C-C><c-p>", opts)

-- ─── Move lines (macOS Cmd key) ────────────────────────────────────────────
map("n", "<D-j>", "mz:m+<cr>`z", opts)
map("n", "<D-k>", "mz:m-2<cr>`z", opts)
map("v", "<D-j>", ":m'>+<cr>`<my`>mzgv`yo`z", opts)
map("v", "<D-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", opts)

-- ─── Tab indent ────────────────────────────────────────────────────────────
map("n", "<c-tab>", "v>", opts)
map("n", "<s-tab>", "v<", opts)
map("v", "<c-tab>", ">gv", opts)
map("v", "<s-tab>", "<gv", opts)

-- ─── Youdao Translator ─────────────────────────────────────────────────────
map("v", "<C-T>", "<Esc>:Ydv<CR>", opts)
map("n", "<C-T>", "<Esc>:Ydc<CR>", opts)

-- ─── Telescope ─────────────────────────────────────────────────────────────
map("n", ";f", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
map("n", ";r", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map("n", "\\\\", "<cmd>Telescope buffers<cr>", opts)
map("n", ";;", "<cmd>Telescope help_tags<cr>", opts)

-- ─── Trouble ───────────────────────────────────────────────────────────────
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)

-- ─── LSP (set in on_attach; defined here for reference / global binds) ─────
-- These are registered per-buffer via the LSP on_attach in plugins/lsp.lua
-- Global diagnostic navigation (outside of buffers with LSP)
map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "<C-j>",    "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "<S-C-j>",  "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
