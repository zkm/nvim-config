return {
  "neovim/nvim-lspconfig",
  commit = "0ef64599b8aa0187ee5f6d92cb39c951f348f041",
  pin = true,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
    if not ok_lspconfig then
      vim.notify("nvim-lspconfig is not compatible with this Neovim version yet; skipping LSP setup", vim.log.levels.WARN)
      return
    end
    local configs = require("lspconfig.configs")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local vue_language_server_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    local servers = {
      lua_ls = {},
      gopls = {},
      elixirls = {},
      rust_analyzer = {},
      tsserver = {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server_path,
              languages = { "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
        },
      },
      eslint = {},
      volar = {},
      intelephense = {},
    }

    local has_npm = vim.fn.executable("npm") == 1

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    for server, opts in pairs(servers) do
      opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
      if configs[server] then
        lspconfig[server].setup(opts)
      end
    end

    -- Configure Stylelint LSP explicitly, but do not auto-install it via mason-lspconfig
    -- to avoid picking the deprecated stylelint-lsp package mapping.
    if has_npm and configs.stylelint_lsp then
      lspconfig.stylelint_lsp.setup({
        capabilities = vim.tbl_deep_extend("force", {}, capabilities),
      })
    end
  end,
}
