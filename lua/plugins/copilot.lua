return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<Right>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		vim.api.nvim_set_keymap("i", "<Down>", "copilot#Next()", { silent = true, expr = true })
		vim.api.nvim_set_keymap("i", "<Up>", "copilot#Previous()", { silent = true, expr = true })
	end,
}
