local present, rt = pcall(require, "rust-tools")
local mason_present, mason_registry = pcall(require, "mason-registry")

if not present then
  return
end

if not mason_present then
  return
end

local codelldb = mason_registry.get_package "codelldb"

rt.setup {
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb:get_install_path() .. "/codelldb",
      codelldb:get_install_path() .. "/extension/lldb/lib/liblldb.dylib"
    ),
  },
}
