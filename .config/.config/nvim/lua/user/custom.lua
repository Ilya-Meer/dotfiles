-- Insert timestamp for log
function Logd()
  local str = os.date('**%a %B %d, %Y - %H:%M:%S**') 
  local line = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, line - 1, line, true, {str, '', ''})

  vim.cmd("norm 2j")
  vim.cmd("startinsert")
end

vim.cmd([[command! Logd lua Logd()]])

function Logf()
  local str = os.date('### %A %B %d, %Y') 
  local line = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, line - 1, line, true, {str, '', ''})

  vim.cmd("norm 2j")
  vim.cmd("startinsert")

  Logd()
end

vim.cmd([[command! Logf lua Logf()]])

-- Open file of current buffer in VS Code
function OpenInVSCode()
  local filePath = vim.api.nvim_buf_get_name(0)

  os.execute("code " .. filePath)
end

vim.cmd([[command! Code lua OpenInVSCode()]])

-- Reload config without exiting vim session
function ReloadConfig()
  vim.cmd("source ~/.config/nvim/init.lua")
  print("Config reloaded!")
end

vim.cmd("command! Reload lua ReloadConfig()")


-- Set colors for markdown
function MarkdownColours()
-- vim.cmd([[highlight mkdHeading ctermfg=141]])
-- vim.cmd([[highlight htmlH1 ctermfg=141]])
-- vim.cmd([[highlight htmlH2 ctermfg=141]])
-- vim.cmd([[highlight htmlH3 ctermfg=141]])
-- vim.cmd([[highlight htmlH4 ctermfg=141]])
-- vim.cmd([[highlight htmlH5 ctermfg=141]])
-- vim.cmd([[highlight htmlH6 ctermfg=141]])
 vim.cmd([[highlight htmlBold ctermfg=141 guifg=#af87ff cterm=bold]])
 vim.cmd([[highlight htmlItalic cterm=italic]])
 vim.cmd([[highlight mkdItalic cterm=italic]])
 vim.cmd([[highlight mkdBold ctermfg=141 guifg=#af87ff cterm=bold]])
 vim.cmd([[highlight mkdLink ctermfg=199]])
 vim.cmd([[highlight mkdURL ctermfg=133 ]])
 -- vim.cmd([[highlight mkdCodeDelimiter ctermfg=84]])
 -- vim.cmd([[highlight mkdCodeStart ctermfg=84]])
 -- vim.cmd([[highlight mkdCodeEnd ctermfg=84]])
 -- vim.cmd([[highlight mkdBlockquote ctermfg=228]])
end

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.md" }, command = "lua MarkdownColours()" }
)

-- lightline.vim colorscheme
vim.cmd("let g:lightline = { 'colorscheme': 'one'}")
