return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			--  This function gets run when an LSP connects to a particular buffer.
			local telescope = require("telescope.builtin")
			local on_attach = function(_, bufnr)
				-- sets the mode, buffer and description for us each time.
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
				nmap("gr", telescope.lsp_references, "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("gt", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				-- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

				-- Lesser used LSP functionality
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
				nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
				nmap("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "[W]orkspace [L]ist Folders")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })
			end

			local servers = {
				ts_ls = {},
				eslint = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
				jdtls = {},
				gopls = {}
			}
			-- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			-- Configure each server via vim.lsp.config()
			for server_name, server_opts in pairs(servers) do
				-- we do jdtls setup separately because it is very involved (see the config.jdtls)
				if server_name ~= "jdtls" then
					vim.lsp.config(server_name, {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = server_opts,
						filetypes = (server_opts or {}).filetypes,
					})
				end
			end

			require("mason-lspconfig").setup()
		end,
	},
	-- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			-- ensure the java debug adapter is installed
			require("mason-nvim-dap").setup({
				ensure_installed = { "java-debug-adapter", "java-test" },
			})
		end,
	},
	-- utility plugin for configuring the java language server for us
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},
}
