return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--glob",
					"!Vendor/*",
				},
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
			},
			vim.keymap.set("n", "<leader>td", "<cmd>TodoLocList<CR>", {}),
		})
	end,
}
