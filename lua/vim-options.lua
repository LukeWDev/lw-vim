vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true
vim.g.mapleader = " "
vim.opt.winbar = "%=%{strftime('%H:%M')}"

-- Refresh window timer
vim.fn.timer_start(60000, function()
  vim.cmd("redrawstatus") -- works for winbar too
end, { ["repeat"] = -1 })

-- Auto Format On Save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.cpp", "*.h", "*.hpp", "*.c" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- CMake Commands
vim.api.nvim_create_user_command("CMakeBuild", function()
  local cmd = table.concat({
    "cmake",
    "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
    "-DCMAKE_BUILD_TYPE=Debug",
    "-S .",
    "-B Build"
  }, " ")
  --vim.cmd("!cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B Build")
  vim.cmd("!" .. cmd)
  vim.cmd("!cmake --build Build")
end, {})

vim.keymap.set("n", "<leader>cb", ":CMakeBuild<CR>", { noremap = true, silent = true })

-- General Keybinds
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true }) -- Move to Left Split
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true }) -- Move to Bottom Split
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true }) -- Move to Top Split
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true }) -- Move to Right Split

