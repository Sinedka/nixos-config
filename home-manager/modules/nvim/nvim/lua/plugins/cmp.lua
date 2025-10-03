return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",     -- адаптер для cmp
          "rafamadriz/friendly-snippets", -- готовые сниппеты
        },

        config = function()
          local luasnip = require("luasnip")
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      }

    },

    config = function()
      local cmp = require("cmp")
      local types = require("cmp.types")

      local kind_icons = {
        Copilot = "",
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',
        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',
        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',
        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',
        Keyword = '󰻾',
        Constant = '󰏿',
        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      }

      local luasnip = require("luasnip")


      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },

        mapping = cmp.mapping.preset.insert({
          ["<UP>"] = cmp.mapping(function(fallback)
            fallback()
          end, { "i", "s" }),
          ["<Down>"] = cmp.mapping(function(fallback)
            fallback()
          end, { "i", "s" }),
          ['<C-j>'] = {
            i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
          },
          ['<C-k>'] = {
            i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
          },
          ['<C-n>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-j>"] = cmp.mapping.scroll_docs(4),
          ["<S-k>"] = cmp.mapping.scroll_docs(-4),
        }),

        preselect = cmp.PreselectMode.Item,

        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            entry_filter = function(entry)
              return entry:get_kind() ~= require("cmp").lsp.CompletionItemKind.Snippet
            end,
          },
          { name = "path" },
          { name = "luasnip" },
          { name = "buffer" },
        }),

        formatting = {
          format = function(entry, vim_item)
            -- if entry.source.name == "nvim_lsp" and vim_item.kind == "Snippet" then
            --   return nil
            -- end
            vim_item.kind = (kind_icons[vim_item.kind] or "") .. " " .. vim_item.kind
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              buffer = "[Buf]",
              path = "[Path]",
              luasnip = "[Snip]",
            })[entry.source.name]
            return vim_item
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        experimental = {
          ghost_text = false,
        },
      })
    end,
  },
}
