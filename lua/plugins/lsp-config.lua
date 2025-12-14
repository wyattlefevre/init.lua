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
			"williamboman/mason.nvim",
		},
		config = function()
			-- Automatically install these servers
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "eslint", "lua_ls", "gopls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvim-telescope/telescope.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
			"folke/neodev.nvim",
		},
		config = function()
			--  This function gets run when an LSP connects to a particular buffer.
			local has_telescope, telescope = pcall(require, "telescope.builtin")

			-- Fallback to LSP builtin functions if telescope isn't available
			local goto_definition = has_telescope and telescope.lsp_definitions or vim.lsp.buf.definition
			local goto_references = has_telescope and telescope.lsp_references or vim.lsp.buf.references
			local document_symbols = has_telescope and telescope.lsp_document_symbols or vim.lsp.buf.document_symbol
			local workspace_symbols = has_telescope and telescope.lsp_dynamic_workspace_symbols or vim.lsp.buf.workspace_symbol

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

				nmap("gd", goto_definition, "[G]oto [D]efinition")
				nmap("gr", goto_references, "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("gt", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")

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

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			local servers = {
				ts_ls = {},
				eslint = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
				gopls = {}
			}

			-- Configure each server using native Neovim 0.11 API
			for server_name, server_opts in pairs(servers) do
				vim.lsp.config(server_name, {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = server_opts,
					filetypes = (server_opts or {}).filetypes,
				})
			end

			-- mason-lspconfig will automatically call vim.lsp.enable() for installed servers
		end,
	},
}
