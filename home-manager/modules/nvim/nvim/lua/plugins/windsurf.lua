return
{
  "Exafunction/windsurf.vim",
  event = "InsertEnter",
  config = function()
    vim.g.codeium_disable_bindings = 1
    -- ACCEPT whole suggestion
    vim.keymap.set("i", "<C-g>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })

    -- accept one word
    vim.keymap.set("i", "<C-w>", function()
      return vim.fn["codeium#AcceptWord"]()
    end, { expr = true, silent = true })

    -- accept one line
    vim.keymap.set("i", "<C-l>", function()
      return vim.fn["codeium#AcceptLine"]()
    end, { expr = true, silent = true })

    -- next / prev suggestion
    vim.keymap.set("i", "<M-]>", function()
      return vim.fn
    end, { expr = true, silent = true })

    vim.keymap.set("i", "<M-[>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true })

    -- clear suggestion
    vim.keymap.set("i", "<C-]>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true })

    -- manual trigger
    vim.keymap.set("i", "<M-\\>", function()
      return vim.fn["codeium#Complete"]()
    end, { expr = true, silent = true })
  end,
}
