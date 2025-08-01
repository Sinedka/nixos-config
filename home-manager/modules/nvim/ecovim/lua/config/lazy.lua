require("lazy").setup("plugins", {
	defaults = { lazy = false },
	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = true },
	concurrency = 10,
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tutor",
				"zipPlugin",
			},
		},
	},
	debug = false,
	ui = {
		border = EcoVim.ui.float.border,
	},
})

vim.keymap.set("n", "<leader>/l", "<cmd>:Lazy<cr>")
