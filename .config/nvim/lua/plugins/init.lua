local util = require("config.util")

return {
    { "vim-airline/vim-airline" },
    { "vim-airline/vim-airline-themes", config = function() vim.g.airline_theme = "deus" end },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "preservim/nerdcommenter" },
    { "mbbill/undotree" , config = function() util.shortcut("U", vim.cmd.UndotreeToggle) end },
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },

    -- colorschemes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "EdenEast/nightfox.nvim" },
}
