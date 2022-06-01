vim.cmd [[
try
  let g:dracula_colorterm = 0
  colorscheme dracula
  hi cursorline guibg = #1e2029
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
