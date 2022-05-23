vim.cmd [[
try
  colorscheme kanagawa
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme kanagawa
  set background=dark
endtry
]]
