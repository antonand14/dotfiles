-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader><leader>", "<c-o>", { desc = "Return to previous location" })
map("t", "<ESC>", "<C-\\><C-n>")
map("v", "<leader>y", "+y")
map("n", "<leader>q", "<cmd>:q<CR>", { desc = "window close" })
