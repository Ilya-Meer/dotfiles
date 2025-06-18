return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon", -- storm, moon, night, day
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      -- Custom colors/highlights
      on_highlights = function(highlights, colors)
        -- Define Dracula purple
        local dracula_purple = "#bd93f9"

        highlights.TabLine = {
          bg = colors.bg_dark,        -- Background for inactive tabs
          fg = colors.fg_gutter,      -- Text color for inactive tabs
        }
        highlights.TabLineSel = {
          bg = dracula_purple,        -- Dracula purple background for active tab
          fg = colors.bg_dark,        -- Dark text on purple background
          bold = true,
        }
        highlights.TabLineFill = {
          bg = colors.bg_dark,        -- Background for empty tabline space
        }
        highlights.CursorLineNr = {
          fg = dracula_purple
        }
      end,
    })

    -- Load the colorscheme
    vim.cmd.colorscheme("tokyonight-moon")
  end
}
