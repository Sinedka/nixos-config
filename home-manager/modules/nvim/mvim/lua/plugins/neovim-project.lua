return
{
  "coffebar/neovim-project",
  lazy = false,
  priority = 100,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "Shatur/neovim-session-manager",
  },

  init = function()
    vim.opt.sessionoptions:append("globals")
  end,

  opts = function()
    local projects = {}

    -- Automatically detect current Git repository
    local result = vim.fn.systemlist({
      "git",
      "-C",
      vim.fn.getcwd(),
      "rev-parse",
      "--show-toplevel",
    })

    if vim.v.shell_error == 0 and result[1] then
      table.insert(projects, result[1])
    end

    return {
      projects = projects,

      picker = {
        type = "telescope",
      },

      last_session_on_startup = false,
      per_branch_sessions = false,
    }
  end,

  keys = {
    {
      "<leader>tp",
      "<cmd>NeovimProjectHistory<CR>",
      desc = "Recent projects",
    },
  }

}
