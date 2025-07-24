return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        header = {
          [[                                                    ]],
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	[[                                                    ]],
        },
        shortcut = {},
        packages = { enable = true },
        project = {
          enable = true,
          limit = 8,
          icon = "󰝰 ",
          label = "Recent Projects",
          --action = "Telescope find_files cwd=",
          action = function(path)
            vim.cmd("cd " .. path)
            require("telescope.builtin").find_files({ cwd = path })
          end,
        },
        mru = { enable = true, limit = 10, icon = " ", label = "Recent Files", cwd_only = false },
        footer = {}, -- footer
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
