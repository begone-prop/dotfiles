return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        "nvim-treesitter/playground"
    },

    build = ":TSUpdate",

    init = function()
        require('nvim-treesitter.configs').setup{
            ensure_installed = { "c", "lua", "python" },
            sync_install = false,
            auto_install = true,
            highlight = {enable = true},
            additional_vim_regex_highlighting = { "markdown" },
        }

        local util = require("config.util")
        util.shortcut("T", ":TSPlaygroundToggle<CR>")
    end
}
