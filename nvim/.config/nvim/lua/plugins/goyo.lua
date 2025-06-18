return {
  "junegunn/goyo.vim",
  cmd = "Goyo",
  config = function()
    -- Autocmds for hiding/showing the signcolumn with Goyo
    vim.api.nvim_create_autocmd("User", {
      pattern = "GoyoEnter",
      callback = function()
        vim.wo.signcolumn = "no"
        vim.o.laststatus = 0
        pcall(function()
          require("lualine").hide({ unhide = false }) -- hide, don't auto-restore
        end)
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "GoyoLeave",
      callback = function()
        vim.wo.signcolumn = "yes"
       vim.o.laststatus = 2
        pcall(function()
          require("lualine").hide({ unhide = true }) -- restore lualine
        end)
      end,
    })
  end,
}
