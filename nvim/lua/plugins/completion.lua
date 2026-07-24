return {
        -- {
        --   "hrsh7th/cmp-nvim-lsp",
        -- },
        -- {
        --   "L3MON4D3/LuaSnip",
        --   dependencies = {
        --     "rafamadriz/friendly-snippets",
        --   },
        -- },
        -- {
        --   "hrsh7th/nvim-cmp",
        --
        --   config = function()
        --     local cmp = require("cmp")
        --     local luasnip = require("luasnip")
        --     require("luasnip.loaders.from_vscode").lazy_load()
        --
        --     cmp.setup({
        --       snippet = {
        --         expand = function(args)
        --           require("luasnip").lsp_expand(args.body) -- For `luasnip` users. i
        --         end,
        --       },
        --       window = {
        --         completion = cmp.config.window.bordered(),
        --         documentation = cmp.config.window.bordered(),
        --       },
        --       mapping = cmp.mapping.preset.insert({
        --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
        --         ["<C-Space>"] = cmp.mapping.complete(),
        --         ["<C-e>"] = cmp.mapping.abort(),
        --         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --
        --         ["<Tab>"] = cmp.mapping(function(fallback)
        --           if cmp.visible() then
        --             cmp.select_next_item()
        --           elseif luasnip.locally_jumpable(1) then
        --             luasnip.jump(1)
        --           else
        --             fallback()
        --           end
        --         end, { "i", "s" }),
        --
        --         ["<S-Tab>"] = cmp.mapping(function(fallback)
        --           if cmp.visible() then
        --             cmp.select_prev_item()
        --           elseif luasnip.locally_jumpable(-1) then
        --             luasnip.jump(-1)
        --           else
        --             fallback()
        --           end
        --         end, { "i", "s" }),
        --       }),
        --       sources = cmp.config.sources({
        --         { name = "nvim_lsp" },
        --         { name = "luasnip" }, -- For luasnip users.
        --       }, {
        --         { name = "buffer" },
        --       }),
        --     })
        --   end,
        -- },

        {
                "saghen/blink.cmp",
                dependencies = { "rafamadriz/friendly-snippets" },
                version = "1.*",

                ---@module 'blink.cmp'
                ---@type blink.cmp.Config
                opts = {
                        keymap = {
                                preset = "enter",

                                ["<S-Tab>"] = { "select_prev", "fallback" },
                                ["<Tab>"] = { "select_next", "fallback" },
                                ["<C-Leader>"] = { "show", "hide" },
                        },
                        appearance = {
                                nerd_font_variant = "mono",
                        },

                        completion = {
                                documentation = { auto_show = false },
                                menu = { auto_show = false },
                        },

                        sources = {
                                default = { "lsp", "path", "snippets", "buffer" },
                        },
                        fuzzy = { implementation = "lua" },
                },
                opts_extend = { "sources.default" },
        },
}
