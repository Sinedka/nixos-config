-- LSP конфигурация для lazy.nvim
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Опционально: для автодополнения
		-- "hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- Общие настройки для всех LSP серверов
		local on_attach = function(client, bufnr)
			-- Включаем completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Маппинги
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, bufopts)
		end

		-- Общие capabilities (для поддержки nvim-cmp если используете)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- Раскомментируйте если используете nvim-cmp:
		-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		-- Настройка символов для диагностики
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Настройки диагностики
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = false,
		})

		-- Конфигурация серверов
		local servers = {
			-- TypeScript/JavaScript - tsserver
			tsserver = {
				filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
			},

			-- HTML - html-lsp
			html = {
				filetypes = { "html" },
			},

			-- CSS - cssls
			cssls = {
				filetypes = { "css", "scss", "less" },
			},

			-- C++ - clangd
			clangd = {
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
				cmd = { "clangd" },
				root_dir = lspconfig.util.root_pattern(
					".clangd",
					".clang-tidy",
					".clang-format",
					"compile_commands.json",
					"compile_flags.txt",
					"configure.ac",
					".git"
				),
			},

			-- QML - qmlls
			qmlls = {
				filetypes = { "qml" },
				cmd = { "qmlls" },
				root_dir = lspconfig.util.root_pattern("*.qml", ".git"),
			},

			-- Lua - lua_ls
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
		}

		-- Применяем настройки для всех серверов
		for server, config in pairs(servers) do
			config.on_attach = on_attach
			config.capabilities = capabilities
			lspconfig[server].setup(config)
		end
	end,
}
