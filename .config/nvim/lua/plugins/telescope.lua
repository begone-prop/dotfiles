return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local builtin = require("telescope.builtin")
	    local util = require("config.util")

        util.shortcut("of", builtin.find_files)
        util.shortcut("oF", function()
            builtin.find_files{search_dirs = {os.getenv("HOME")}}
        end)
        util.shortcut("ow", builtin.grep_string)
        util.shortcut("oW", function()
            builtin.grep_string{search = vim.fn.expand("<cWORD>")}
        end)
        util.shortcut("o/", builtin.live_grep)
        --util.shortcut("ob", builtin.oldfiles)
        util.shortcut("oM", builtin.man_pages)
        util.shortcut("oC", builtin.colorscheme)
    end
}
