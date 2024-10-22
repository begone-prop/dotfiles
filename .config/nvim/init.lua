local configdir = vim.fn.stdpath("config") .. "/undodir"
local undodir = configdir .. "/undodir"

local opt = vim.opt
local key = vim.keymap.set

opt.number = true
opt.relativenumber = true
opt.encoding = "utf-8"
opt.autoread = true
opt.wrap = false
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.compatible = false
-- opt.cursorline = true
opt.scrolloff = 8
opt.smartindent = true
opt.smartcase = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.updatetime = 50
-- opt.signcolumn = "number"
opt.showmode = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = undodir
opt.clipboard = 'unnamedplus'

opt.splitright = true
opt.splitbelow = true

opt.formatoptions = {c = false, r = false, o = false}
opt.completeopt = {menu = true, menuone = true, select = false}

vim.g.mapleader = " "

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*", command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*", command = [[%s/\n\+\%$//e]],
})

key("n", "<C-h>", "<C-w>h")
key("n", "<C-j>", "<C-w>j")
key("n", "<C-k>", "<C-w>k")
key("n", "<C-l>", "<C-w>l")
key("n", "<M-j>", ":resize -2<CR>")
key("n", "<M-k>", ":resize +2<CR>")
key("n", "<M-h>", ":vertical resize +2<CR>")
key("n", "<M-l>", ":vertical resize -2<CR>")

key("c", "<C-k>", "<UP>")
key("c", "<C-j>", "<DOWN>")
key("", "<leader>r", ":w! | !runner.sh %<CR>")

-- load plugin manager
require("config.lazy")

vim.cmd.colorscheme("nightfox")
vim.g.airline_theme = "deus"
