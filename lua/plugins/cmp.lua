return {
	-- cmp-nvim-lsp provides language specific completion suggestions to nvim-cmp
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	-- nvim-cmp provides auto completion and auto completion dropdown ui
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- buffer based completion options
			"hrsh7th/cmp-buffer",
			-- path based completion options
			"hrsh7th/cmp-path",
		},
		config = function()
			-- Gain access to the functions of the cmp plugin
			local cmp = require("cmp")

			-- All the cmp setup function to configure our completion experience
			cmp.setup({
				-- How should completion options be displayed to us?
				completion = {
					-- menu: display options in a menu
					-- menuone: automatically select the first option of the menu
					-- preview: automatically display the completion candiate as you navigate the menu
					-- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
					competeopt = "menu,menuone,preview,noselect",
				},
				-- setup how we interact with completion menus and options
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- Where and how should cmp rank and find completions
				-- Order matters, cmp will provide lsp suggestions above all else
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
