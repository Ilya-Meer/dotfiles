return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "bash",
        "json",
        "yaml",
        "javascript",
        "typescript",
        "html",
        "css",
        -- "tree-sitter-gitcommit"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
