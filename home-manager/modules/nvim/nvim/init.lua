require('utils.icons')

require('utils.globals')

require('config.options')
require('config.lazy')
require('config.keymappings')
require('config.autocmds')

require('internal.cursorword')


vim.lsp.enable('tailwindcss')
vim.lsp.enable('cssls')
vim.lsp.enable('qmlls')
vim.lsp.enable('eslint')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('vuels')
vim.lsp.enable('bashls')
vim.lsp.enable('glslls')
vim.lsp.enable('html')
vim.lsp.enable('graphql')
vim.lsp.enable('prismals')
vim.lsp.enable('clangd')
vim.lsp.enable('nil_ls')
vim.lsp.enable('ufo')
vim.lsp.enable('pyright')

