return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,

        -- Нумерация буферов
        numbers = function(opts)
          return tostring(opts.ordinal)
        end,

        -- Внешний вид разделителей
        separator_style = "thin",

        -- Закрытие буфера средней кнопкой мыши
        middle_mouse_command = "bdelete! %d",

        -- Поведение при закрытии
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",

        -- Отступы (например, для NvimTree)
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
            text_align = "center",
            separator = false,
          },
        },
      },
    },

    keys = {
      -- Переключение буферов
      { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },

      -- Закрытие буферов
      { "<leader>x", "<cmd>bdelete<CR>", desc = "Close buffer" },
      { "<leader>bD", "<cmd>bdelete!<CR>", desc = "Force close buffer" },

      -- Закрытие остальных буферов
      { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    },
  },
}

