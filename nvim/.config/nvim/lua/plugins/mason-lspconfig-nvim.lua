local servers = {
    "cssls",
    "bashls",
    "yamlls",
    "jsonls",
    "html",
    "lua_ls",
    "gopls",
    "vue_ls",
    "intelephense",
    "ts_ls"
}

-- LSP keymaps function (buffer-local)
local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    -- LSP navigation
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    -- LSP actions
    keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    -- Diagnostics
    keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

local function on_attach(_, bufnr)
  -- Set up keymaps
  lsp_keymaps(bufnr)

  -- Configure diagnostics
  vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    }
  })
end

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function()
    require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
    })

    -- Set up LSP keymaps -- this is kind of a hack, but it works, not sure why it's not working in the on_attach function
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        on_attach(client, bufnr)
      end
    })
  end
}

