local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "typescript" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Go
  b.formatting.gofmt,

  -- rust
  b.formatting.rustfmt,

  -- python
  b.formatting.black.with { filetypes = { "python" }},
  -- b.diagnostics.pyright,
  b.diagnostics.ruff,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
