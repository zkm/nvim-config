return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local vue_language_server_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    local servers = {
      lua_ls = {},
      gopls = {},
      elixirls = {},
      rust_analyzer = {},
      vtsls = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_language_server_path,
                  languages = { "vue" },
                  configNamespace = "typescript",
                },
              },
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
      vue_ls = {},
      intelephense = {},
    }

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    local function resolve_server(name)
      if configs[name] then
        return name
      end

      if name == "vue_ls" and configs.volar then
        return "volar"
      end

      return nil
    end

    for server, opts in pairs(servers) do
      opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
      local resolved = resolve_server(server)
      if resolved then
        lspconfig[resolved].setup(opts)
      end
    end
  end,
}
