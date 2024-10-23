return {
    shortcut = function(keys, action, opts)
        vim.keymap.set("", "<leader>" .. keys, action, opts or {})
    end,
}
