-- Insert timestamp for log
function Logd()
  local str = os.date('**%a %B %d, %Y - %H:%M:%S**')
  local line = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, line - 1, line, true, {str, '', ''})

  vim.cmd("norm 2j")
  vim.cmd("startinsert")
end

-- Insert log date and time for log
function Logf()
  local str = os.date('### %A %B %d, %Y')
  local line = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, line - 1, line, true, {str, '', ''})

  vim.cmd("norm 2j")
  vim.cmd("startinsert")

  Logd()
end

local function InsertEmojiAtCursor(emoji)
  local to_insert = emoji .. "  "
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  local before = line:sub(1, col)
  local after = line:sub(col + 1)
  local new_line = before .. to_insert .. after
  vim.api.nvim_set_current_line(new_line)

  -- Move cursor right past the emoji and space visually
  vim.api.nvim_win_set_cursor(0, {row, col})
  vim.cmd("normal! l")
end

local function InsertCheck()
  InsertEmojiAtCursor("✅")
end

local function InsertFire()
  InsertEmojiAtCursor("🔥")
end

local function InsertHourglass()
  InsertEmojiAtCursor("⏳")
end

-- Markdown-specific colorscheme customizations
local function SetMarkdownColors()
  local pink = "#ff79c6"
  local blue = "#7aa2f7"
  local purple = "#bd93f9"
  local cyan = "#8be9fd"
  local green = "#c3e88d"
  local orange = "#ffb86c"
  local yellow = "#f1fa8c"

  -- TreeSitter markdown highlight groups (NEW)
  -- Headers
  vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = pink, bold = true })
  vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = green })
  vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = orange })
  vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = yellow })


  -- Code blocks and inline code
  vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { fg = cyan })  -- Inline code
  vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { fg = cyan })   -- Code blocks

  -- Bold and italic
  vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { fg = purple, bold = true })    -- **bold**
  vim.api.nvim_set_hl(0, "@markup.emphasis.markdown_inline", { fg = yellow, italic = true }) -- *italic*

  -- Links
  vim.api.nvim_set_hl(0, "@markup.link.url.markdown_inline", { fg = cyan, underline = true })
  vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { fg = purple })

  -- Keep the old groups as fallback for non-TreeSitter highlighting
  vim.api.nvim_set_hl(0, "markdownH1", { fg = pink, bold = true })
  vim.api.nvim_set_hl(0, "markdownH2", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "markdownH3", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "markdownH4", { fg = green })
  vim.api.nvim_set_hl(0, "markdownH5", { fg = orange })
  vim.api.nvim_set_hl(0, "markdownH6", { fg = yellow })
  vim.api.nvim_set_hl(0, "markdownBold", { fg = purple, bold = true })
  vim.api.nvim_set_hl(0, "markdownItalic", { fg = yellow, italic = true })
  vim.api.nvim_set_hl(0, "markdownUrl", { fg = cyan, underline = true })
  vim.api.nvim_set_hl(0, "markdownLink", { fg = purple })
end

-- Apply colors when markdown file loads
SetMarkdownColors()

-- Log date and time commands
vim.cmd([[command! Logd lua Logd()]])
vim.cmd([[command! Logf lua Logf()]])

-- Insert emoji at cursor
vim.keymap.set('n', '<localleader>cc', InsertCheck, { buffer = true, desc = "Insert checkmark" })
vim.keymap.set('n', '<localleader>ff', InsertFire, { buffer = true, desc = "Insert fire" })
vim.keymap.set('n', '<localleader>hh', InsertHourglass, { buffer = true, desc = "Insert hourglass" })

-- Insert log date and time
vim.keymap.set('n', '<localleader>ld', Logd, { buffer = true, desc = "Insert log date" })
vim.keymap.set('n', '<localleader>lf', Logf, { buffer = true, desc = "Insert log date and time" })

