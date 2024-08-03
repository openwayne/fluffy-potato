local status, mason = pcall(require, "mason")
if (not status) then return end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local status, masonLspconfig = pcall(require, "mason-lspconfig")
if (not status) then return end

masonLspconfig.setup()

