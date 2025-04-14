-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", ":Neotree position=current toggle<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>l", ":nohlsearch<CR>")

for i = 1, 10 do
  local key = (i == 10) and "0" or tostring(i)
  vim.keymap.set("n", "<leader>" .. key, ":" .. i .. "tabnext<CR>", { noremap = true, silent = true })
end

vim.keymap.set('n', '<A-Left>', ':-tabmove<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Right>', ':+tabmove<CR>', { noremap = true, silent = true })
