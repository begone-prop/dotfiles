return {
    "tpope/vim-fugitive",
    config = function()
	    local util = require("config.util")
        util.shortcut("gs", ":Git status<CR>")
        util.shortcut("gd", ":Git diff<CR>")
        util.shortcut("gb", ":Git blame<CR>")
    end
}
