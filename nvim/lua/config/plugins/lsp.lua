return {
    {
        "neovim/nvim-lspconfig",
        dependencies = 'saghen/blink.cmp',
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- Lua
            vim.lsp.config('lua_ls', { capabilities = capabilities })
            vim.lsp.enable('lua_ls')

            -- Python
            vim.lsp.config('pyright', { capabilities = capabilities })
            vim.lsp.enable('pyright')

            -- TypeScript / JavaScript
            vim.lsp.config('ts_ls', { capabilities = capabilities })
            vim.lsp.enable('ts_ls')

            -- Keymap for hover
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

            -- Diagnostics config
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
