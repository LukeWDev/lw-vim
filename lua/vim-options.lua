vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true
vim.g.mapleader = " "
vim.opt.winbar = "%=%{strftime('%H:%M')}"

vim.fn.timer_start(60000, function()
  vim.cmd("redrawstatus")  -- works for winbar too
end, { ["repeat"] = -1 })
