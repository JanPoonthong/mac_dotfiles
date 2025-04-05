-- return {
--   "nvim-tree/nvim-tree.lua",
--   dependencies = "nvim-tree/nvim-web-devicons",
--   config = function()
--     local nvimtree = require("nvim-tree")
-- 
--     -- recommended settings from nvim-tree documentation
--     vim.g.loaded_netrw = 1
--     vim.g.loaded_netrwPlugin = 1
-- 
--     nvimtree.setup({
--     tab = {
--         sync = {
--             open  = true,
--             close = true,
--         },
--     },
--       view = {
--         width = 30,
--         relativenumber = true,
--       },
--       actions = {
--         open_file = {
--           window_picker = {
--             enable = false,
--           },
--         },
--       },
--       filters = {
--         custom = { ".DS_Store" },
--       },
--       git = {
--         ignore = false,
--       },
--     })
-- 
--     -- set keymaps
--     local keymap = vim.keymap -- for conciseness
-- 
--     keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
--     keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
--     keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
--     keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
-- 
--   end
-- }

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
    toggle = true,
    separate_windows_across_tabs = false,
    filesystem = {
      filtered_items = {
        visible = true,
        never_show = { ".git", "node_modules", ".next", ".DS_Store" },
      },
    },
  },
-- vim.keymap.set("n", "<leader>ee", "<cmd>Neotree<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
}
