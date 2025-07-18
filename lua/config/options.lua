vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.o.hlsearch = true
vim.wo.number = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.swapfile = false
vim.o.tabstop = 2        -- Display width of a tab character
vim.o.softtabstop = 2    -- Editing operations treat tab as 2 spaces
vim.o.shiftwidth = 2     -- Indent operations use 2 spaces

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
