local function getBuffName()
  return vim.fn.expand("%")
end

local function getBuffCount()
  local count = 0
  for _ in ipairs(vim.fn.getbufinfo({buflisted=1})) do
    count = count + 1
  end
  return count
end

vim.api.nvim_create_user_command('CloseBuffer', function()
  vim.cmd('NvimTreeClose')
  vim.cmd('bdelete')
end, { desc = 'Close buffer and NvimTree if open' })

vim.api.nvim_create_user_command('GetCurrentBufferName', function()
  local name = getBuffName()
  print(name)
end, { desc = 'Return name of currently active buffer' })

vim.api.nvim_create_user_command('GetBufferCount', function()
  local count = getBuffCount()
  print(count)
end, { desc = 'Return number of loaded buffers' })

vim.api.nvim_create_user_command('NvimTreeQuit', function()
  local treeOpen = require 'nvim-tree.view'.is_visible()
  local numberOfOpenBuffers = getBuffCount()
  local treeFlag = false

  if getBuffName() == "" then
    if treeOpen then
      vim.cmd('NvimTreeClose')
      treeFlag = true
    end
    vim.cmd('quit!')
    if treeFlag then vim.cmd('NvimTreeOpen') end
    return
  end

  if not treeOpen then vim.cmd('quit'); return end

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
  local numberOfOpenBuffers = getBuffCount()

  if not treeOpen then
    vim.cmd('write')
    vim.cmd('quit')
  end

  if treeOpen and numberOfOpenBuffers <= 1 then
    vim.cmd('write')
    vim.cmd('NvimTreeClose')
    vim.cmd('quit')
  else
    vim.cmd('write')
    vim.cmd('NvimTreeClose')
    vim.cmd('bd')
    vim.cmd('NvimTreeOpen')
  end

end, { desc = 'Close the current buffer, if there is only 1 buffer then close buffer, nvimtree, and nvim' })

vim.api.nvim_create_user_command('NvimTreeSaveBufferDelete', function()
  local treeOpen = require 'nvim-tree.view'.is_visible()
  local numberOfOpenBuffers = getBuffCount()

  if not treeOpen then
    vim.cmd('write')
    vim.cmd('NvimTreeClose')
    vim.cmd('quit')
  else
    vim.cmd('write')
    vim.cmd('NvimTreeClose')
    vim.cmd('bd')
    vim.cmd('NvimTreeOpen')
  end
end, { desc = 'Save the current buffer and close it leaving nvimtree open' })
