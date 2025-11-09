return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			style = "dark",
			transparent = true, -- Show/hide background
		})
		require("onedark").load()
		-- vim.o.bg = "dark"
	end,
}
