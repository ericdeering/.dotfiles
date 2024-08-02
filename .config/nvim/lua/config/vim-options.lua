vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("cnoremap Q q")
vim.cmd("cnoremap q NvimTreeQuit")
vim.cmd("cnoremap qa qa")
vim.cmd("cnoremap wq NvimTreeSaveQuit")

vim.wo.number = true
