vim.api.nvim_create_user_command('CloseBuffer', function()
  vim.cmd('NvimTreeClose')
  vim.cmd('bdelete')
end, { desc = 'Close buffer and NvimTree if open' })

vim.api.nvim_create_user_command('NvimTreeQuit', function()
  local treeOpen = require 'nvim-tree.view'.is_visible()
  local numberOfOpenBuffers = 0

  for buf in ipairs(vim.fn.getbufinfo({buflisted=1})) do
    numberOfOpenBuffers = numberOfOpenBuffers + 1
  end

  if treeOpen and numberOfOpenBuffers <= 1 then
    vim.cmd('NvimTreeClose')
    vim.cmd('quit')
  else
    vim.cmd('NvimTreeClose')
    vim.cmd('bd')
    vim.cmd('NvimTreeOpen')
    vim.cmd('TmuxNavigateRight')
  end

end, { desc = 'Close the current buffer, if there is only 1 buffer then close buffer, nvimtree, and nvim' })

vim.api.nvim_create_user_command('NvimTreeSaveQuit', function()
  local treeOpen = require 'nvim-tree.view'.is_visible()
  local numberOfOpenBuffers = 0

  for buf in ipairs(vim.fn.getbufinfo({buflisted=1})) do
    numberOfOpenBuffers = numberOfOpenBuffers + 1
  end

  if treeOpen and numberOfOpenBuffers <= 1 then
    vim.cmd('write')
    vim.cmd('NvimTreeClose')
    vim.cmd('quit')
  else
    vim.cmd('NvimTreeClose')
    vim.cmd('write')
    vim.cmd('bd')
    vim.cmd('NvimTreeOpen')
    vim.cmd('TmuxNavigateRight')
  end

end, { desc = 'Close the current buffer, if there is only 1 buffer then close buffer, nvimtree, and nvim' })
