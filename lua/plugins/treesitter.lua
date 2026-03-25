return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
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
