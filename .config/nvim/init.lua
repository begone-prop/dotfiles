local configdir = vim.fn.stdpath("config") .. "/undodir"
local undodir = configdir .. "/undodir"

local util = require("config.util")

vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.encoding = "utf-8"
vim.o.autoread = true
vim.o.wrap = false
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.compatible = false
-- opt.cursorline = true
vim.o.scrolloff = 8
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.signcolumn = "yes"
vim.o.showmode = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = undodir
vim.o.clipboard = "unnamedplus"

vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.formatoptions = {c = false, r = false, o = false}
vim.opt.completeopt = {menu = true, menuone = true, select = false}

vim.api.nvim_create_autocmd({"BufWritePre"}, { pattern = "*", command = [[%s/\s\+$//e]], })

vim.api.nvim_create_autocmd({"BufWritePre"}, { pattern = "*", command = [[%s/\n\+\%$//e]], })

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<M-j>", ":resize -2<CR>")
vim.keymap.set("n", "<M-k>", ":resize +2<CR>")
vim.keymap.set("n", "<M-h>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<M-l>", ":vertical resize -2<CR>")

vim.keymap.set("c", "<C-k>", "<UP>")
vim.keymap.set("c", "<C-j>", "<DOWN>")


util.shortcut("r", ":w! | !runner.sh %<CR>")

-- load plugin manager
require("config.lazy")

util.shortcut("<leader>", function() vim.cmd("so"); print("Reloaded nvim config") end)

vim.cmd.colorscheme("nightfox")
