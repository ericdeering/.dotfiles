return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		--   or                              , branch = '0.1.x',

		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"sharkdp/fd",
			"nvim-treesitter/nvim-treesitter",
		},

		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						find_command = {
							"rg",
							"--files",
							"--glob=!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock}",
							"--hidden",
							"--follow",
              "--no-ignore",
						},
					},
					live_grep = {
						additional_args = {
							"--hidden",
              "--follow",
              "--glob=!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock}",
              "--no-ignore",
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})

			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {})
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
}
