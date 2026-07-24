-- Automatically start the Godot LSP when opening .gd files
vim.api.nvim_create_autocmd("FileType", {
        pattern = { "gd", "gdscript" },
        callback = function()
                -- Detect the project root
                local root = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1])
                if not root then
                        vim.notify("⚠️ Not inside a Godot project (project.godot not found)", vim.log.levels.WARN)
                        return
                end
                -- LSP config
                local gdscript_config = {
                        name = "gdscript",
                        cmd = vim.lsp.rpc.connect("127.0.0.1", 6008),
                        root_dir = root,
                        filetypes = { "gd", "gdscript" },
                        capabilities = vim.lsp.protocol.make_client_capabilities(),
                }

                -- Start or attach
                vim.lsp.start(gdscript_config)
        end,
})

return {
        {
                "williamboman/mason.nvim",
                config = function()
                        require("mason").setup()
                end,
        },
        {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                        require("mason-lspconfig").setup({
                                ensure_installed = { "emmet_ls", "rust_analyzer", "lua_ls", "ts_ls", "emmet_ls", "phpactor" },
                                auto_install = true,
                        })
               end,
        },
        {
                "neovim/nvim-lspconfig",
                config = function()
                        local capabilities = vim.lsp.protocol.make_client_capabilities()

                        -- Add folding capabilities
                        capabilities.textDocument.foldingRange = {
                                dynamicRegistration = false,
                                lineFoldingOnly = true,
                        }

                        -- vim.lsp.config.gdscript = {
                        --         cmd = vim.lsp.rpc.connect("127.0.0.1", 6008),
                        --         filetypes = { "gd", "gdscript" },
                        --         root_dir = lspconfig.util.root_pattern("project.godot", ".git"),
                        -- }

                        -- Merge with blink.cmp capabilities if available
                        local has_blink, blink = pcall(require, "blink.cmp")
                        if has_blink then
                                capabilities = blink.get_lsp_capabilities(capabilities)
                        end

                        -- Lua LSP
                        vim.lsp.config("lua_ls", {
                                cmd = { "lua-language-server" },
                                root_markers = {
                                        ".luarc.json",
                                        ".luarc.jsonc",
                                        ".luacheckrc",
                                        ".stylua.toml",
                                        "stylua.toml",
                                        "selene.toml",
                                        "selene.yml",
                                        ".git",
                                },
                                capabilities = capabilities,
                        })

                        -- TypeScript LSP
                        vim.lsp.config("ts_ls", {
                                cmd = { "typescript-language-server", "--stdio" },
                                root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
                                capabilities = capabilities,
                        })

                        -- Emmet LSP
                        vim.lsp.config("emmet_ls", {
                                cmd = { "emmet-ls", "--stdio" },
                                root_markers = { ".git", "package.json" },
                                filetypes = {
                                        "html",
                                        "css",
                                        "scss",
                                        "javascript",
                                        "javascriptreact",
                                        "typescript",
                                        "typescriptreact",
                                        "twig",
                                        "edge"
                                },
                                capabilities = capabilities,
                        })

                        -- Phpactor LSP
                        vim.lsp.config("phpactor", {
                                cmd = { "phpactor", "language-server" },
                                root_markers = { "composer.json", ".git" },
                                capabilities = capabilities,
                        })

                        vim.lsp.config("rust-analyzer", {
                                diagnostics = {
                                        disabled = { "unlinked-file" },
                                },
                        })

                        -- Enable LSP servers
                        vim.lsp.enable({ "lua_ls", "ts_ls", "emmet_ls", "phpactor" })
                end,
        },
}
