-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup {}

-- Tree
require("nvim-tree").setup({
    view = {
        number = true,
        relativenumber = true,
    },
    renderer = {
        hidden_display = "simple",
        highlight_opened_files = "all",
    },
})

-- Telescope
require("telescope").setup({
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
})

-- Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('quarto').setup {
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
        enabled = true,
        chunks = "curly",
        languages = { "r", "python", "julia", "bash", "html" },
        diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
        },
        completion = {
            enabled = true,
        },
    },
    codeRunner = {
        enabled = true,
        default_method = "slime", -- "molten", "slime", "iron" or <function>
        ft_runners = {},          -- filetype to runner, ie. `{ python = "molten" }`.
        -- Takes precedence over `default_method`
        never_run = { 'yaml' },   -- filetypes which are never sent to a code runner
    },
}

require("lspconfig").air.setup({
    on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end,
})
