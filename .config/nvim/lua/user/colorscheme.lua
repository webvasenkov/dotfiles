-- vim.cmd([[
-- try
--   let g:dracula_colorterm = 0
--   colorscheme dracula
--   hi cursorline guibg = #1e2029
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]])

require("rose-pine").setup({
	styles = {
		transparency = true,
	},
})

vim.cmd("colorscheme rose-pine")

--[[ vim.cmd([[ ]]
--[[ try ]]
--[[    if has('termguicolors') ]]
--[[     set termguicolors ]]
--[[   endif ]]
--[[   " For dark version. ]]
--[[   set background=dark ]]
--[[   " This configuration option should be placed before `colorscheme everforest`. ]]
--[[   " Available values: 'hard', 'medium'(default), 'soft' ]]
--[[   let g:everforest_background = 'soft' ]]
--[[   " For better performance ]]
--[[   let g:everforest_better_performance = 1 ]]
--[[   let g:everforest_transparent_background = 2 ]]
--[[   colorscheme everforest ]]
--[[ catch /^Vim\%((\a\+)\)\=:E185/ ]]
--[[   colorscheme default ]]
--[[   set background=dark ]]
--[[ endtry ]]
