return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        shortcut = {},
        packages = { enable = true }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a function type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
        project = {
          enable = true,
          limit = 8,
          icon = "󰝰 ",
          label = "Recent Projects",
          action = "",
        },
        mru = { enable = true, limit = 10, icon = " ", label = "Recent Files", cwd_only = false },
        footer = {}, -- footer
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
