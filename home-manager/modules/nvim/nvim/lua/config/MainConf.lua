local icons = require("utils.icons")

MainConf = {
  colorscheme = "tokyonight-night",
  ui = {
    font = { "FiraCode Nerd Font", ":h14" },
    float = {
      border = "rounded",
    },
  },
  plugins = {
    -- Make sure to reload nvim & "Update Plugins" after change
    ai = {
      copilot = {
        enabled = true,
      },
    },
    completion = {
      select_first_on_enter = false,
    },
    -- Completely replaces the UI for messages, cmdline and the popupmenu
    experimental_noice = {
      enabled = true,
    },
    -- Enables moving by subwords and skips significant punctuation with w, e, b motions
    jump_by_subwords = {
      enabled = false,
    },
    rooter = {
      -- Removing package.json from list in Monorepo Frontend Project can be helpful
      -- By that your live_grep will work related to whole project, not specific package
      patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }, -- Default
    },
  },
  -- Please keep it
  icons = icons,
  -- Statusline configuration
  statusline = {
    path_enabled = false,
    path = "relative", -- absolute/relative
  },
}
