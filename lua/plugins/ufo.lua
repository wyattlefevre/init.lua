return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		-- Fold settings
		vim.o.foldcolumn = "1" -- show fold column
		vim.o.foldlevel = 99 -- unfold all by default
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local ufo = require("ufo")

		-- Keymaps
		vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
		vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Open folds except specified kinds" })
		vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Close folds with specified kinds" })
		vim.keymap.set("n", "zp", ufo.peekFoldedLinesUnderCursor, { desc = "Peek folded lines under cursor" })

		-- Custom leader keymaps
		vim.keymap.set("n", "<leader>j", "za", { desc = "Toggle fold" }) -- toggle current fold
		vim.keymap.set("n", "<leader>h", ufo.openAllFolds, { desc = "Open all folds" }) -- open all folds

		-- UFO setup
		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
