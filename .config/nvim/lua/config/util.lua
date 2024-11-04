return {
    shortcut = function(keys, action, opts)
        vim.keymap.set("n", "<leader>" .. keys, action, opts or {})
    end,
}
