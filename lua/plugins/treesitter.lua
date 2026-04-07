return {
  "nvim-treesitter/nvim-treesitter",
  commit = "b401b7423d18c78371c5ff1a5f8d3c14292b2047",
  pin = true,
  enabled = vim.fn.has("nvim-0.9") == 1,
  build = ":TSUpdate",
  config = function()
    local languages = {
      "lua",
      "javascript",
      "typescript",
      "elixir",
      "go",
      "rust",
      "html",
      "css",
    }

    local ok_configs, configs = pcall(require, "nvim-treesitter.configs")
    if ok_configs then
      configs.setup({
        ensure_installed = languages,
        highlight = { enable = true },
        indent = { enable = true },
      })
      return
    end

    local ok_treesitter, treesitter = pcall(require, "nvim-treesitter")
    if ok_treesitter then
      treesitter.setup({})
      treesitter.install(languages)
    end
  end,
}
