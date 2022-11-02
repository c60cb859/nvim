local status_ok, dap = pcall(require, "dap")
if not status_ok then
	vim.notify("dap not found")
	return
end

local get_path = function()
	local path
	vim.ui.input({
		prompt = "Path to executable: ",
		default = vim.loop.cwd() .. "/build/",
		completion = "file",
	}, function(input)
		path = input
	end)
	vim.cmd([[redraw]])
	return path
end

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = get_path,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
		env = function()
			local variables = {}
			for k, v in pairs(vim.fn.environ()) do
				table.insert(variables, string.format("%s=%s", k, v))
			end
			return variables
		end,
	},
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
