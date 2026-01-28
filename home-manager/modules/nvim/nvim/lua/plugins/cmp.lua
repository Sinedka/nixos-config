return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },

    config = function()
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      require("blink.cmp").setup({
        snippets = {
          expand = function(snippet)
            luasnip.lsp_expand(snippet)
          end,
          active = function(filter)
            return luasnip.expand_or_jumpable()
          end,
          jump = function(direction)
            if direction == 1 then
              luasnip.expand_or_jump()
            else
              luasnip.jump(-1)
            end
          end,
        },

        fuzzy = {
          prebuilt_binaries = {
            force_version = "v1.8.0"
          }
        },

        completion = {
          menu = {
            auto_show = true,
            border = "rounded",
          },
          documentation = {
            auto_show = true,
            border = "rounded",
          },
          ghost_text = { enabled = false },
        },

        keymap = {
          ["<C-j>"]  = { "select_next" },
          ["<C-k>"]  = { "select_prev" },

          ["<C-n>"]  = { "snippet_forward", "fallback" },
          ["<C-p>"]  = { "snippet_backward", "fallback" },

          ["<Up>"]   = { "fallback" },
          ["<Down>"] = { "fallback" },
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },

          providers = {
            lsp = {
              name = "LSP",
              module = "blink.cmp.sources.lsp",
              --- фильтр элементов
              transform_items = function(_, items)
                local CompletionItemKind = vim.lsp.protocol.CompletionItemKind
                return vim.tbl_filter(function(item)
                  return item.kind ~= CompletionItemKind.Snippet
                end, items)
              end,
            },

            path = {
              name = "Path",
              module = "blink.cmp.sources.path",
            },

            snippets = {
              name = "Snippets",
              module = "blink.cmp.sources.snippets",
            },

            buffer = {
              name = "Buffer",
              module = "blink.cmp.sources.buffer",
            },
          },
        },
        appearance = {
          kind_icons = {
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
          },
        },
      })
    end,
  },
}
