local function getBuffName()
	return vim.fn.expand("%")
end

local function getBuffCount()
	local count = 0
	for _ in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		count = count + 1
	end
	return count
end

vim.api.nvim_create_user_command("CloseBuffer", function()
	vim.cmd("NvimTreeClose")
	vim.cmd("bdelete")
end, { desc = "Close buffer and NvimTree if open" })

vim.api.nvim_create_user_command("GetCurrentBufferName", function()
	local name = getBuffName()
	print(name)
end, { desc = "Return name of currently active buffer" })

vim.api.nvim_create_user_command("GetBufferCount", function()
	local count = getBuffCount()
	print(count)
end, { desc = "Return number of loaded buffers" })

vim.api.nvim_create_user_command("NvimTreeQuit", function()
	local treeOpen = require("nvim-tree.view").is_visible()
	local numberOfOpenBuffers = getBuffCount()
	local treeFlag = false

	if getBuffName() == "" then
		if treeOpen then
			vim.cmd("NvimTreeClose")
			treeFlag = true
		end
		vim.cmd("quit!")
		if treeFlag then
			vim.cmd("NvimTreeOpen")
		end
		return
	end

	if not treeOpen then
		vim.cmd("quit")
		return
	end

	if treeOpen and numberOfOpenBuffers <= 1 then
		vim.cmd("NvimTreeClose")
		vim.cmd("quit")
	else
		vim.cmd("NvimTreeClose")
		vim.cmd("bd")
		vim.cmd("NvimTreeOpen")
		vim.cmd("TmuxNavigateRight")
	end
end, { desc = "Close the current buffer, if there is only 1 buffer then close buffer, nvimtree, and nvim" })

vim.api.nvim_create_user_command("NvimTreeSaveQuit", function()
	local treeOpen = require("nvim-tree.view").is_visible()
	local numberOfOpenBuffers = getBuffCount()

	if not treeOpen then
		vim.cmd("write")
		vim.cmd("quit")
	end

	if treeOpen and numberOfOpenBuffers <= 1 then
		vim.cmd("write")
		vim.cmd("NvimTreeClose")
		vim.cmd("quit")
	else
		vim.cmd("write")
		vim.cmd("NvimTreeClose")
		vim.cmd("bd")
		vim.cmd("NvimTreeOpen")
		vim.cmd("TmuxNavigateRight")
	end
end, { desc = "Close the current buffer, if there is only 1 buffer then close buffer, nvimtree, and nvim" })

vim.api.nvim_create_user_command("NvimTreeSaveBufferDelete", function()
	local treeOpen = require("nvim-tree.view").is_visible()

	if not treeOpen then
		vim.cmd("write")
		vim.cmd("NvimTreeClose")
		vim.cmd("quit")
	else
		vim.cmd("write")
		vim.cmd("NvimTreeClose")
		vim.cmd("bd")
		vim.cmd("NvimTreeOpen")
	end
end, { desc = "Save the current buffer and close it leaving nvimtree open" })

vim.api.nvim_create_user_command("NvimTreeBufferDelete", function()
	local treeOpen = require("nvim-tree.view").is_visible()
	local numberOfOpenBuffers = getBuffCount()

	if not treeOpen then
		vim.cmd("NvimTreeClose")
		vim.cmd("quit")
	else
		vim.cmd("NvimTreeClose")
		vim.cmd("bd")
		vim.cmd("NvimTreeOpen")
	end

	if numberOfOpenBuffers > 1 then
		vim.cmd("TmuxNavigateRight")
	end
end, { desc = "Save the current buffer and close it leaving nvimtree open" })

vim.api.nvim_create_user_command("InsertIndent", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	pos[2] = pos[2] + 1
	local line = vim.api.nvim_get_current_line()
	local newLine = "\t" .. line

	vim.api.nvim_set_current_line(newLine)
	vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Insert a tab at the beginning of the line" })

vim.api.nvim_create_user_command("InsertIndent", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	pos[2] = pos[2] + 1
	local line = vim.api.nvim_get_current_line()
	local newLine = "\t" .. line

	vim.api.nvim_set_current_line(newLine)
	vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Insert a tab at the beginning of the line" })

vim.api.nvim_create_user_command("RemoveIndent", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	pos[2] = pos[2] - 2
	if pos[2] < 0 then
		pos[2] = 0
	end
	local line = vim.api.nvim_get_current_line()
	local newLine
	if string.sub(line, 1, 1) == "\t" then
		newLine = string.sub(line, 2, string.len(line))
	elseif string.sub(line, 1, 2) == "  " then
		newLine = string.sub(line, 3, string.len(line))
	end
	if newLine == nil then
		return
	end
	vim.api.nvim_set_current_line(newLine)
	vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Remove a tab from the beginning of the line" })

vim.api.nvim_create_user_command("CloseFloats", function()
  -- If we find a floating window, close it.
  local found_float = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(win).relative ~= '' then
          vim.api.nvim_win_close(win, true)
          found_float = true
      end
  end
  
  if found_float then
      return
  end
  
  vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
end, {desc = "Close all floats" })
