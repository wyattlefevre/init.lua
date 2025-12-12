return {
	"phrmendes/todotxt.nvim",
	cmd = { "TodoTxt", "DoneTxt" },
	ft = "todotxt",
	opts = {
		todotxt = vim.env.HOME .. "/wydocs2/tasks/todo.txt",
		donetxt = vim.env.HOME .. "/wydocs2/tasks/done.txt",
		ghost_text = {
			enable = true,
			mappings = {
				["(A)"] = "now",
				["(B)"] = "next",
				["(C)"] = "today",
			},
		},
	},
}
