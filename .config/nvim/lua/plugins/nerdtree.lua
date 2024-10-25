return {
    "preservim/nerdtree",
    config = function()
        local util = require("config.util")
        vim.g.NERDTreeHijackNetrw = 0
        util.shortcut("F", ":NERDTreeToggle<CR>")
    end
}
