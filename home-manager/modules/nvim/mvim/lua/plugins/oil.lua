local previous_buf = nil

return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,

    opts = {
      default_file_explorer = true,

      skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
      prompt_save_on_select_new_entry = false,
      constrain_cursor = "name",
      lsp_file_methods = {
        -- Enable or disable LSP file operations
        enabled = true,
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = true,
      },
      columns = {
        "permissions",
        "size",
        "mtime",
        "icon",
      },

      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },

      view_options = {
      },

      float = {
        -- Padding around the floating window
        padding = 2,
        -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
        get_win_title = nil,
        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
        preview_split = "auto",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    },

    keys = {
      {
        "<leader>e",
        function()
          require("oil").toggle_float();
        end,
        desc = "Toggle Oil",
      },
      {
        "<Esc>",
        function()
          if vim.bo.filetype == "oil" then
            require("oil").toggle_float()
          end
        end,
        desc = "Close Oil",
      },
      {
        "q",
        function()
          if vim.bo.filetype == "oil" then
            require("oil").toggle_float()
          end
        end,
        desc = "Close Oil",
      }, }
  }
}
