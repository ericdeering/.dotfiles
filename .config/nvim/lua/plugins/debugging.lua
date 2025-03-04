return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
		},
		{
			"leoluz/nvim-dap-go",
		},
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = 'OpenDebugAD7',
    }

    dap.adapters.lldb = {
      name = 'lldb',
      type = 'executable',
      command = '/opt/homebrew/opt/llvm/bin/lldb-dap',
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        args = {},
      },
    }

		require("dap-go").setup()
		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {desc = 'Debug: toggle breakpoint'})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {desc = 'Debug: continue'})
		vim.keymap.set("n", "<Leader>dx", dap.close, {desc = 'Debug: close'})
	end,
}
