local function recent_projects()
  return function()
    local ok, history = pcall(require, "neovim-project.utils.history")

    local section = {
      icon = " ",
      title = "Projects",
      padding = 1,
      indent = 2,
    }

    if not ok then
      return section
    end

    local projects = history.get_recent_projects()
    local limit = 5
    local count = #projects

    if count == 0 then
      table.insert(section, {
        icon = " ",
        desc = "No recent projects",
      })
      return section
    end


    local first = math.max(1, count - limit + 1)

    for i = count, first, -1 do
      local dir = projects[i]
      local name = vim.fn.fnamemodify(dir, ":t")
      local path = vim.fn.fnamemodify(dir, ":~")

      table.insert(section, {
        icon = "󰆍 ",
        desc = name .. "  " .. path,
        key = tostring(count - i + 1),
        action = function()
          require("neovim-project.project").switch_project(dir)
        end,
      })
    end

    return section
  end
end

Snacks = Snacks
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      input        = { enabled = true },
      scroll       = { enabled = false },
      image        = { enabled = false },
      statuscolumn = { enabled = true },
      words        = { enabled = false },
      -- notifier     = { enabled = false },

      dashboard    = {
        enabled = true,

        width = 60,


        preset = {
          header = [[
 ███╗   ██╗██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██║   ██║██║████╗ ████║
 ██╔██╗ ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]],

          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = ":Telescope find_files",
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":Telescope oldfiles",
            },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = ":Telescope live_grep",
            },

            {
              icon = " ",
              key = "p",
              desc = "Recent Projects",
              action = ":NeovimProjectHistory",
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":Telescope find_files cwd=" .. vim.fn.stdpath("config"),
            },
            {
              icon = "󰒲 ",
              key = "L",
              desc = "Lazy",
              action = ":Lazy",
            },
            {
              icon = " ",
              key = "q",
              desc = "Quit",
              action = ":qa",
            },
          },
        },

        sections = {
          {
            section = "header",
            padding = 2,
          },

          {
            section = "keys",
            gap = 1,
            padding = 1,
          },


          recent_projects(),

          {
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            padding = 2,
            limit = 4,
          },

          {
            icon = " ",
            title = "Git Status",
            section = "terminal",
            cmd = "git status --short --branch",
            height = 5,
            padding = 1,
            indent = 3,
            ttl = 5 * 60,
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
          },

          {
            section = "startup",
            padding = 1,
          },
        },
      },

    },
    keys = {
      -- ╭─────────────────────────────────────────────────────────╮
      -- │ Lazygit                                                 │
      -- ╰─────────────────────────────────────────────────────────╯
      { "<leader>gg",  function() Snacks.lazygit() end,          desc = "Lazygit" },
      { "<leader>gla", function() Snacks.lazygit.log() end,      desc = "Lazygit Log (cwd)" },
      { "<leader>glc", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    },
  }
}
