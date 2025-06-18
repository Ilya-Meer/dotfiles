return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└" },
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-u>"] = "results_scrolling_up",
            ["<C-d>"] = "results_scrolling_down",
            ["<C-p>"] = "preview_scrolling_up",
            ["<C-n>"] = "preview_scrolling_down"
          }
        }
      },
      pickers = {
        find_files = {
          hidden = true,              -- Always search hidden files
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      }
    })

    -- Workarounds for styling Telescope borders given that borders for hover and signature help can't be set in LSP config for SOME reason
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeFindPre",
      callback = function()
        vim.opt.winborder = "none"
      end,
    })

    vim.api.nvim_create_augroup("TelescopeCloseHook", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = "TelescopeCloseHook",
      pattern = "TelescopePrompt",
      callback = function(args)
        vim.api.nvim_create_autocmd("BufLeave", {
          group = "TelescopeCloseHook",
          buffer = args.buf,
          once = true,
          callback = function()
            vim.opt.winborder = "single"
          end,
        })
      end,
    })
  end
}
