-- LSP configuration for NixOS without Mason

-- =========================
-- UFO (folding)
-- =========================
local ufo_utils = require("utils._ufo")

local ufo_config_handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
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
      table.insert(newVirtText, { chunkText, chunk[2] })

      if curWidth + vim.fn.strdisplaywidth(chunkText) < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end

    curWidth = curWidth + chunkWidth
  end

  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

-- =========================
-- LSP base
-- =========================
local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = "rounded",
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
  ),
}

local capabilities = require("blink.cmp").get_lsp_capabilities()

local function on_attach(_, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

-- =========================
-- Global floating border
-- =========================
local orig_open = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_open(contents, syntax, opts, ...)
end

-- =========================
-- TypeScript / JavaScript
-- =========================
require("typescript-tools").setup({
  capabilities = capabilities,
  handlers = require("config.lsp.servers.tsserver").handlers,
  on_attach = require("config.lsp.servers.tsserver").on_attach,
  settings = require("config.lsp.servers.tsserver").settings,
})

-- =========================
-- Tailwind CSS
-- =========================
local tailwind_capabilities = vim.deepcopy(capabilities)
tailwind_capabilities.textDocument.completion.completionItem.snippetSupport = true
tailwind_capabilities.textDocument.colorProvider = { dynamicRegistration = false }
tailwind_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lspconfig.tailwindcss.setup({
  capabilities = tailwind_capabilities,
  filetypes = require("config.lsp.servers.tailwindcss").filetypes,
  handlers = handlers,
  init_options = require("config.lsp.servers.tailwindcss").init_options,
  on_attach = require("config.lsp.servers.tailwindcss").on_attach,
  settings = require("config.lsp.servers.tailwindcss").settings,
  flags = {
    debounce_text_changes = 1000,
  },
})

-- =========================
-- CSS
-- =========================
lspconfig.cssls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.servers.cssls").on_attach,
  settings = require("config.lsp.servers.cssls").settings,
})

-- =========================
-- QML
-- =========================
lspconfig.qmlls.setup({
  cmd = { "qmlls", "-E" },
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})

-- =========================
-- ESLint
-- =========================
lspconfig.eslint.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.servers.eslint").on_attach,
  settings = require("config.lsp.servers.eslint").settings,
  flags = {
    allow_incremental_sync = false,
    debounce_text_changes = 1000,
    exit_timeout = 1500,
  },
})

-- =========================
-- JSON
-- =========================
lspconfig.jsonls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("config.lsp.servers.jsonls").settings,
})

-- =========================
-- Lua
-- =========================
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("config.lsp.servers.lua_ls").settings,
})

-- =========================
-- Vue
-- =========================
lspconfig.vuels.setup({
  filetypes = require("config.lsp.servers.vuels").filetypes,
  handlers = handlers,
  init_options = require("config.lsp.servers.vuels").init_options,
  on_attach = require("config.lsp.servers.vuels").on_attach,
  settings = require("config.lsp.servers.vuels").settings,
})

-- =========================
-- Bash
-- =========================
lspconfig.bashls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})

-- =========================
-- GLSL
-- =========================
lspconfig.glslls.setup({
  cmd = { "glslls" },
  filetypes = { "glsl", "vert", "frag", "geom" },
  root_dir = require("lspconfig.util").root_pattern(".git"),
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})

-- =========================
-- HTML
-- =========================
lspconfig.html.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})

-- =========================
-- GraphQL
-- =========================
lspconfig.graphql.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})

-- =========================
-- Prisma
-- =========================
lspconfig.prismals.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})

-- =========================
-- C / C++
-- =========================
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})

-- =========================
-- Nix
-- =========================
lspconfig.nil_ls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})

-- =========================
-- UFO setup
-- =========================
require("ufo").setup({
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds_for_ft = {
    default = { "imports" },
  },
})

