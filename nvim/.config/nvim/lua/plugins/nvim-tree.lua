local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open Vertical'))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  event = { "VeryLazy" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      on_attach = my_on_attach,
      actions = {
        open_file = {
          window_picker = {
            enable = false,  -- Disable window picker
          },
        },
      },
      view = {
        width = 30,
        side = "left",
      },
      git = {
        enable = true,
        ignore = false,
      },
    }
  end,
}
