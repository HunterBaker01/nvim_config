-- plugins/quarto.lua
return {
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            'quarto-dev/quarto-nvim',
            'jmbuhr/otter.nvim',
            'hrsh7th/nvim-cmp',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require('quarto').setup({
                lspFeatures = {
                    languages = { "r" },
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" }
                    },
                    completion = { enabled = true },
                },
            })
        end
    }
}
