require("config.lazy")

-- Sandwich configs between lazy install and lazy .setup() method
require("config.options")
require("config.keymaps")
require("config.autocmds")

local lazy_opts = {
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
}

require("lazy").setup({
	{ import = "plugins" },
}, lazy_opts)
