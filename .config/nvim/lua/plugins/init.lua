local util = require("config.util")

return {
    { "vim-airline/vim-airline", init = function() vim.g.airline_powerline_fonts = 1 end},
    { "vim-airline/vim-airline-themes", init = function() vim.g.airline_theme = "catppuccin" end },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "preservim/nerdcommenter", init = function() vim.g.NERDSpaceDelims = 1 end},
    { "mbbill/undotree" , init = function() util.shortcut("U", vim.cmd.UndotreeToggle) end },
    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

    -- colorschemes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "EdenEast/nightfox.nvim" },
}
