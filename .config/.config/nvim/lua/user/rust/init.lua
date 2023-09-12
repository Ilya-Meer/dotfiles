local rt = require("rust-tools")
local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

local function on_attach(client, buffer)
  local keymap_opts = { buffer = buffer }

  vim.keymap.set("n", "K", rt.hover_actions.hover_actions, keymap_opts)
  vim.keymap.set("n", "<Leader>k", rt.code_action_group.code_action_group, keymap_opts)

  vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
  vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
  vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
  vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, keymap_opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, keymap_opts)
  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, keymap_opts)

  vim.diagnostic.config({ virtual_text = true })

  -- Enable auto-saving
  vim.cmd("let g:rustfmt_autosave = 1")
end

-- https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  tools = {
    hover_actions = {
      auto_focus = true
    },
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
  server = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = on_attach,
    settings = {
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

rt.setup(opts)
