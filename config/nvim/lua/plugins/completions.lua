return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "codeium" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({
				config_path = vim.fn.expand"$HOME/.config/codeium/config",
				bin_path = vim.fn.expand"$HOME/.config/codeium/bin",
				enable_chat = true,
				virtual_text = {
					enabled = true,
					-- Set to true if you never want completions to be shown automatically.
					manual = false,
					-- A mapping of filetype to true or false, to enable virtual text.
					filetypes = {
						python = true,
						ps1 = true,
						psm1 = true,
						psd1 = true,
						lua = true,
						luau = true,
						sh = true,
            javascript = true,
						typescript = true,
						javascriptreact = true,
						typescriptreact = true,
						["javascript.jsx"] = true,
						["typescript.tsx"] = true,
						mjs = true,
						cjs = true,
						html = true,
						css = true,
						scss = true,
						sass = true,
						less = true,
						json = true,
						jsonc = true,
						yaml = true,
						yml = true,
						toml = true,
						markdown = true,
					},
					-- Whether to enable virtual text or not for filetypes not specifically listed above.
					default_filetype_enabled = false,
					-- How long to wait (in ms) before requesting completions after typing stops.
					idle_delay = 75,
					-- Priority of the virtual text. This usually ensures that the completions appear on top of
					-- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
					-- desired.
					virtual_text_priority = 65535,
					-- Set to false to disable all key bindings for managing completions.
					map_keys = true,
					-- The key to press when hitting the accept keybinding but no completion is showing.
					-- Defaults to \t normally or <c-n> when a popup is showing.
					accept_fallback = nil,
					-- Key bindings for managing completions in virtual text mode.
					key_bindings = {
						-- Accept the current completion.
						accept = "<Tab>",
						-- Accept the next word.
						accept_word = false,
						-- Accept the next line.
						accept_line = false,
						-- Clear the virtual text.
						clear = false,
						-- Cycle to the next completion.
						next = "<M-]>",
						-- Cycle to the previous completion.
						prev = "<M-[>",
					},
				},
			})
		end,
	},
}
