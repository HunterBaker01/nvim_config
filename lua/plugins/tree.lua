return {
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false,
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        -- config = function()
        --     require("nvim-tree").setup {}
        -- end,
    },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' }
}
