local status_ok, incline = pcall(require, "incline")
if not status_ok then
	vim.notify("incline not found")
	return
end

local render = function(props)
	local bufname = vim.api.nvim_buf_get_name(props.buf)
	local res = bufname ~= "" and vim.fn.fnamemodify(bufname, ":.t") or " [No Name]"
	if vim.api.nvim_buf_get_option(props.buf, "modified") then
		res = res .. " "
	end
	return res
end

incline.setup({
	render = render,
})
