-- Use a protected call to prevent the default error handler from being called.
local status_ok, autosave = pcall(require, "autosave")
if not status_ok then
	return
end

autosave.setup({
	enabled = true,
})
