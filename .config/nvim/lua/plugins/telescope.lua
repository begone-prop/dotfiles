return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        local builtin = require('telescope.builtin')
	local util = require("config.util")

	util.shortcut("fg", builtin.live_grep, { desc = "Telescope live grep" })
	util.shortcut("ff", builtin.find_files, { desc = "Telescope find files" })
	util.shortcut("lf", builtin.git_files, { desc = "Telescope find git files" })
    util.shortcut("fs", builtin.grep_string)
    end
}
