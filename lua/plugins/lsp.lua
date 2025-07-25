return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            -- Lua configuration
            require("lspconfig").lua_ls.setup({
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ async = false, bufnr = bufnr })
                            end,
                        })
                    end
                end,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                        completion = {
                            callSnippet = "Both",
                        },
                    },
                },
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            -- pylsp configuration
            require("lspconfig").pylsp.setup({
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ async = false, bufnr = bufnr })
                            end,
                        })
                    end
                end,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                settings = {
                    pylsp = {
                        plugins = {
                            jedi_completion = {
                                include_params = true,
                            },
                        },
                    },
                },
            })
            require("lspconfig").r_language_server.setup({
                on_attach = function(client, _)
                    -- client.server_capabilities.documentFormattingProvider = false
                    -- client.server_capabilities.documentRangeFormattingProvider = false
                end,
                settings = {
                    r = {
                        lsp = {
                            diagnostics = true,
                            rich_documentation = true,
                        },
                    },
                },
                capabilities = require("cmp_nvim_lsp").default_capabilities()
            })
            -- C++ LSP with clangd
            require("lspconfig").clangd.setup({
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ async = false, bufnr = bufnr })
                            end,
                        })
                    end
                end,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                cmd = { "clangd", "--background-index", "--clang-tidy" }, -- Enable clang-tidy diagnostics
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = require("lspconfig").util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
            })
        end,
    },
}
