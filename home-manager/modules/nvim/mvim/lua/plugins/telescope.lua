return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },

      "nvim-tree/nvim-web-devicons",
    },

    cmd = "Telescope",

    keys = {
      {
        "<leader>tf",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files",
      },
      {
        "<leader>tg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Live Grep",
      },
      {
        "<leader>tb",
        "<cmd>Telescope buffers<cr>",
        desc = "Find Buffers",
      },
      {
        "<leader>tr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent Files",
      },
      {
        "<leader>th",
        "<cmd>Telescope help_tags<cr>",
        desc = "Help Tags",
      },
      {
        "<leader>tc",
        "<cmd>Telescope git_files<cr>",
        desc = "Git Files",
      },
    },

    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        path_display = { "smart" },

        sorting_strategy = "ascending",

        layout_strategy = "horizontal",

        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },

          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        border = true,
        winblend = 0,
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },

    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
  },
}
