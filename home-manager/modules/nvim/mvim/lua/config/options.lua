local options = {
  -- Нумерация строк
  number = true,
  relativenumber = true,
  -- Отступы;
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
  smartindent = true,
  -- Поиск;
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  incsearch = true,
  -- Интерфейс;
  termguicolors = true,
  signcolumn = "yes",
  cursorline = true,
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  -- Буфер обмена;
  clipboard = "unnamedplus",
  -- Файлы;
  undofile = true,
  swapfile = false,
  backup = false,

  cmdheight = 0,
  -- Производительность;
  updatetime = 250,
  timeoutlen = 400,
}

local globals = {
  mapleader               = ' ', --- Map leader key to SPC
  maplocalleader          = ',', --- Map local leader key to comma
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
