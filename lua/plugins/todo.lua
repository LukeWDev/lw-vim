return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({
       search = {
        exclude_dirs = { "Vendor" },
      },
      vim.keymap.set("n", "<leader>td", "<cmd>TodoLocList<CR>", {})
    })
  end
}
