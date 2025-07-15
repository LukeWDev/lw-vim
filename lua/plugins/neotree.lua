return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>")

    require("neo-tree").setup({
      sources = { "filesystem", "buffers", "git_status" },
      enable_git_status = true,
      name = {
        trailing_slash = false,
        use_git_status_colors = false,
        highlight = "NeoTreeFileName",
      },

      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "➜",
          untracked = "",
          ignored = "◌",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },

      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_gitignored = true,
          hide_hidden = true,
        },
      },
    })
  end,
}
