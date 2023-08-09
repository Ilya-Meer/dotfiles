  -- Show by default 4 spaces for a tab
vim.cmd('autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4')

  -- :GoBuild
vim.cmd('autocmd FileType go nmap <leader>b  <Plug>(go-build)')

-- :GoTest
vim.cmd('autocmd FileType go nmap <leader>t  <Plug>(go-test)')

-- :GoRun
vim.cmd('autocmd FileType go nmap <leader>r  <Plug>(go-run)')

-- :GoDoc
vim.cmd('autocmd FileType go nmap <leader>d <Plug>(go-doc)')

-- :GoCoverageToggle
vim.cmd('autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)')

-- :GoInfo
vim.cmd('autocmd FileType go nmap <leader>i <Plug>(go-info)')

-- Show identifier info on hover
vim.cmd("let g:go_auto_type_info = 1")

-- Highlight identifiers on hover
vim.cmd("let g:go_auto_sameids = 1")

-- Syntax highlighting
vim.cmd("let g:go_highlight_fields = 1")
vim.cmd("let g:go_highlight_functions = 1")
vim.cmd("let g:go_highlight_function_calls = 1")
vim.cmd("let g:go_highlight_extra_types = 1")
vim.cmd("let g:go_highlight_operators = 1")

-- Auto formatting and importing
vim.cmd("let g:go_fmt_autosave = 1")
vim.cmd("let g:go_fmt_command = 'goimports'")

