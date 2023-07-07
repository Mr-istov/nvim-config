local present, autosave = pcall(require, "auto-save")

if not present then
  return
end

autosave.setup {
  debounce_delay = 1000,
}
