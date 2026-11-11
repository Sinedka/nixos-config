local keymap = vim.keymap.set
local silent = { silent = true }

return function(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
  keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
  keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", silent)
  keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
  keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
  keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
  -- TODO: add format
  -- keymap("n", "<leader>cf", "<cmd>lua require('config.lsp.functions').format()<CR>", silent)

  keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
  keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
  keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
end
