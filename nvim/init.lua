map = vim.keymap.set

vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.o.cursorline = true

vim.g.mapleader = " "
map('i', 'jk', '<ESC><CR>')
map('n', ';', ':')
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map("n", "<leader><leader>", "<c-o>")
map("v", "<leader>y", "+y")

map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/sar/friendly-snippets.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = 'https://github.com/NvChad/showkeys',                opt = true },
})

require("mini.completion").setup()
require("mini.icons").setup()
require("mini.pick").setup()
require("mini.cursorword").setup()
require("mini.trailspace").setup()
require("mini.git").setup()
-- require("mini.surround").setup()
-- require("mini.jump2d").setup()
-- require("mini.statusline").setup()
-- require("mini.tabline").setup()

require "showkeys".setup({ position = "top-right" })
require "oil".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "typescript", "lua", "c" },
	highlight = { enable = true }
})

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
	snippets = {
		-- Load custom file with global snippets first (adjust for Windows)
		gen_loader.from_file('~/.config/nvim/snippets/global.json'),

		-- Load snippets based on current language by reading files from
		-- "snippets/" subdirectories from 'runtimepath' directories.
		gen_loader.from_lang(),
	},
})

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)
vim.keymap.set({ 'n', 'x', 'o' }, 's', require('flash').jump)
vim.keymap.set({ 'n', 'x', 'o' }, 'S', require('flash').treesitter)
-- vim.keymap.set('o', 'r', require('flash').remote)
-- vim.keymap.set({ 'o', 'x'}, 'R', require('flash').treesitter_search)

vim.lsp.enable({ "lua_ls", "clangd" })

require("vague").setup({ transparent = true })
vim.cmd("colorscheme vague")
-- vim.cmd(":hi statusline guibg=NONE")
