local function file_size()
  local size = vim.fn.getfsize(vim.fn.expand("%:p"))

  if size < 0 then
    return ""
  end

  if size < 1024 then
    return size .. " B"
  elseif size < 1024 * 1024 then
    return string.format("%.1f KB", size / 1024)
  else
    return string.format("%.1f MB", size / (1024 * 1024))
  end
end

local function os_icon()
  local os = vim.uv.os_uname().sysname

  local icons = {
    Linux = "",
    Darwin = "",
    Windows_NT = "󰍲",
  }

  return icons[os] or "󰀻"
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      },

      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:upper()
            end,
          },
        },

        lualine_b = {
          "branch",
          {
            "diff",
            symbols = {
              added = "+",
              modified = "~",
              removed = "-",
            },
          },
        },

        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
          {
            "lsp_status",
            icon = "󰒋",
          },
        },

        lualine_x = {
          {
            os_icon,
            color = { gui = "bold" },
          },
          {
            "filetype",
            icon_only = false,
          },
          {
            file_size,
            icon = "󰋊",
          },
          {
            "encoding",
            fmt = function(str)
              return str:upper()
            end,
          },
        },

        lualine_y = {
          "fileformat",
        },

        lualine_z = {
          "progress",
          "location",
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          "lsp_status",
        },
        lualine_x = {
          os_icon,
          "filetype",
          file_size,
          "encoding",
        },
        lualine_y = {},
        lualine_z = {
          "location",
        },
      },
    },
  },
}

