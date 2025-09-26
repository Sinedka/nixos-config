-- dap.lua
local dap = require("dap")

-- Адаптер для Python (через debugpy)
dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Запустить текущий файл",
    program = "${file}", -- текущий файл
    pythonPath = function()
      return "python" -- можно заменить на venv/bin/python
    end,
  },
}

-- Адаптер для C/C++ (через lldb)
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode", -- путь к lldb-vscode
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Запуск программы",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Путь к исполняемому файлу: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- C как C++
dap.configurations.c = dap.configurations.cpp

-- Небольшие хоткеи
vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F10>", function() dap.step_over() end)
vim.keymap.set("n", "<F11>", function() dap.step_into() end)
vim.keymap.set("n", "<F12>", function() dap.step_out() end)
vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>B", function()
  dap.set_breakpoint(vim.fn.input("Условие: "))
end)
