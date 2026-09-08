local M = {}

M.settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim', 'bit', 'packer_plugins', 'hl' }
    },
    hint = { enable = true },
  }
}

return M
