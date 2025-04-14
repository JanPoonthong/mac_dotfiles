return {
    {
        "neovim/nvim-lspconfig",
        dependences = 'saghen/blink.cmp',
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')
            lspconfig.pyright.setup{capabilites = capabilities}
            lspconfig.lua_ls.setup{capabilites = capabilities}
            lspconfig.ts_ls.setup{capabilites = capabilities}

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = true,
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "ts_ls", "pyright"}
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            vim.keymap.set("n", "<leader>s", function()
              vim.lsp.buf.format()
            end, { desc = "Format file" })
        end
    }
}
