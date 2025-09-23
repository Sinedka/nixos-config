-- LSP configuration for NixOS without Mason
local ufo_utils = require("utils._ufo")
local lspconfig = vim.lsp.config
local ufo_config_handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' 󰁂 %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0

  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end

  table.insert(newVirtText, { suffix, 'MoreMsg' })

  return newVirtText
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = "rounded",
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  }),
}

local capabilities = require("blink.cmp").get_lsp_capabilities()

local function on_attach(_, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr })
end

-- Global override for floating preview border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- TypeScript/JavaScript LSP (typescript-tools)
require("typescript-tools").setup({
  capabilities = capabilities or vim.lsp.protocol.make_client_capabilities(),
  handlers = require("config.lsp.servers.tsserver").handlers,
  on_attach = require("config.lsp.servers.tsserver").on_attach,
  settings = require("config.lsp.servers.tsserver").settings,
})

-- Tailwind CSS LSP
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lspconfig["tailwindcss"] = {
  capabilities = capabilities,
  filetypes = require("config.lsp.servers.tailwindcss").filetypes,
  handlers = handlers,
  init_options = require("config.lsp.servers.tailwindcss").init_options,
  on_attach = require("config.lsp.servers.tailwindcss").on_attach,
  settings = require("config.lsp.servers.tailwindcss").settings,
  flags = {
    debounce_text_changes = 1000,
  },
}

-- CSS LSP
vim.lsp.config["cssls"] = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.servers.cssls").on_attach,
  settings = require("config.lsp.servers.cssls").settings,
}

vim.lsp.config["qmlls"] = {
  cmd = { "qmlls", "-E" },
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach
}

-- ESLint LSP
vim.lsp.config["eslint"] = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.servers.eslint").on_attach,
  settings = require("config.lsp.servers.eslint").settings,
  flags = {
    allow_incremental_sync = false,
    debounce_text_changes = 1000,
    exit_timeout = 1500,
  },
}

-- JSON LSP
vim.lsp.config["jsonls"] = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("config.lsp.servers.jsonls").settings,
}

-- Lua LSP
vim.lsp.config["lua_ls"] = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("config.lsp.servers.lua_ls").settings,
}

-- Vue LSP
vim.lsp.config["vuels"] = {
  filetypes = require("config.lsp.servers.vuels").filetypes,
  handlers = handlers,
  init_options = require("config.lsp.servers.vuels").init_options,
  on_attach = require("config.lsp.servers.vuels").on_attach,
  settings = require("config.lsp.servers.vuels").settings,
}

-- Bash LSP
vim.lsp.config["bashls"] = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
}

vim.lsp.config["glslls"] = {
  cmd = { "glslls" },                             -- путь к серверу, если установлен глобально через npm
  filetypes = { "glsl", "vert", "frag", "geom" }, -- типы файлов GLSL
}

-- HTML LSP
vim.lsp.config["html"] = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
}

-- GraphQL LSP
vim.lsp.config["graphql"] = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
}

-- Prisma LSP
vim.lsp.config["prismals"] = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
}

vim.lsp.config["clangd"] = {
  cmd = { "clangd", "--background-index" }, -- Можно добавить опции, если нужно
  filetypes = { "c", "cpp", "objc", "objcpp" },
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
}

-- UFO setup for code folding
require("ufo").setup {
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds_for_ft = { default = { "imports" } },
}
