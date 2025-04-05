return {
    {
        "neovim/nvim-lspconfig",
        dependences =
            { 'saghen/blink.cmp' },
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')
            lspconfig.pyright.setup({capabilities = capabilities})
            lspconfig.lua_ls.setup({capabilities = capabilities})
            lspconfig.ts_ls.setup({capabilities = capabilities})
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
        end
    }
}
