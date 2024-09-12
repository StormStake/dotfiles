return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        keys = {
            { "<leader>lf", vim.lsp.buf.format,          desc = "Language server Format file" },
            { "<leader>ca", vim.lsp.buf.code_action,     desc = "language server Code Action" },
            { "<leader>ld", vim.diagnostic.open_float,     desc = "Language server Diagnostic" },
            { "<leader>gd", vim.lsp.buf.definition,      desc = "Goto Definition" },
            { "<leader>lr", vim.lsp.buf.rename,          desc = "Langauge server Rename" },
            { "<leader>gr", vim.lsp.buf.references,      desc = "Goto References" },
            { "<leader>gr", vim.lsp.buf.execute_command, desc = "Goto References" },

        }
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "rust_analyzer", "lua_ls", "vimls", "gopls", "pyright" },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,
                ['rust_analyzer'] = function()
                    require('lspconfig').rust_analyzer.setup {
                        cargo = {
                            extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = 'dev', },
                            extraArgs = { "--profile", "rust-analyzer", },
                        }

                    }
                end,
                -- Setup lua_ls for nvim plugin configs
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        on_init = function(client)
                            local path = client.workspace_folders[1].name
                            if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                                return
                            end
                            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                                runtime = {
                                    version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME,
                                        "${3rd}/luv/library"
                                    }
                                    -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            })
                        end,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end


            }
        }
    },
}
