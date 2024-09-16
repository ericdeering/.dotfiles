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
