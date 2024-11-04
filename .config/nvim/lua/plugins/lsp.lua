local show_diagnostic_on_hover = function()
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
        pattern = "*",
        group = vim.api.nvim_create_augroup("LspHoverGroup", {}),
        callback = function()
        for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_config(winid).zindex then
                return
            end
        end
        vim.diagnostic.open_float({
            scope = "cursor",
            focusable = false,
            close_events = {
                "CursorMoved",
                "CursorMovedI",
                "BufHidden",
                "InsertCharPre",
                "WinLeave",
            },
        })
        end
    })
end

local highlight_refs_on_cursor_hold = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
        local highlight_augroup = vim.api.nvim_create_augroup("highlight_refs", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = ev.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = ev.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
            callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = "highlight_refs", buffer = event2.buf }
            end,
        })
    end
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        --"j-hui/fidget.nvim",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason").setup()
        require("mason-lspconfig").setup{
            ensure_installed = {"lua_ls", "clangd", "pyright"},
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end
            }
        }

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                local opts = { buffer = ev.buf }
                local tp = require('telescope.builtin')

                vim.keymap.set("n", "gd", tp.lsp_definitions)
                vim.keymap.set("n", 'gr', tp.lsp_references)
                vim.keymap.set("n", "gI", tp.lsp_implementations)
                vim.keymap.set("n", "got", tp.lsp_type_definitions)
                vim.keymap.set("n", "goi", tp.lsp_incoming_calls)
                vim.keymap.set("n", "goo", tp.lsp_outgoing_calls)

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gA", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)

                highlight_refs_on_cursor_hold(ev)
            end
        })

        show_diagnostic_on_hover()


        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
        })

        require("cmp").setup {
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "nvim_lsp_signature_help" },
            }
        }

        vim.diagnostic.config({
            virtual_text = false,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end
}
