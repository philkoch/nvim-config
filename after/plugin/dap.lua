-- https://github.com/mfussenegger/nvim-dap-python
--
dap_py = require("dap-python")
dap_py.setup("~/.config/nvim/.virtualenvs/debugpy/bin/python")
dap_py.test_runner = "pytest"

-- https://github.com/rcarriga/nvim-dap-ui
local dap, dapui = require("dap"), require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
