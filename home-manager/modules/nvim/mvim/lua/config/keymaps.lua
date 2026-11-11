local keymap = vim.keymap.set
local silent = { silent = true }

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Remove highlights
keymap("n", "<esc>", ":noh<CR><CR>", silent)

-- Don't yank on delete char
keymap({ "n", "v" }, "x", '"_x', silent)
keymap({ "n", "v" }, "X", '"_X', silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)


-- Quickfix
keymap("n", "<Leader>,", ":cp<CR>", silent)
keymap("n", "<Leader>.", ":cn<CR>", silent)

-- TODO: Toggle quicklist
-- keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Manually invoke speeddating in case switch.vim didn't work
-- keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", silent)
-- keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
--   silent)

-- Open links under cursor in browser with gx
keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)

local modes = { "n", "i", "v", "c" }

for _, mode in ipairs(modes) do
  vim.keymap.set(mode, "<Up>", "<Nop>")
  vim.keymap.set(mode, "<Down>", "<Nop>")
  vim.keymap.set(mode, "<Left>", "<Nop>")
  vim.keymap.set(mode, "<Right>", "<Nop>")
end
