return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    priority = 1000,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "camgraff/telescope-tmux.nvim",
        "LukasPietzschmann/telescope-tabs",
    },
    config = function()
        local builtin = require("telescope.builtin")
	    local util = require("config.util")

        local ts_tmux = require('telescope').load_extension('tmux')
        local ts_tabs = require('telescope').load_extension('telescope-tabs')

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

        util.shortcut("od", builtin.lsp_references)
        util.shortcut("otw", function() ts_tmux.windows{} end)
        util.shortcut("ots", function() ts_tmux.sessions{} end)
        util.shortcut("oT", ts_tabs.list_tabs)
    end
}
