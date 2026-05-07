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

    require("nvim-treesitter.configs").setup({
      ensure_installed = languages,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
