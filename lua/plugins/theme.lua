return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        neo_tree = true,
        telescope = { enabled = true },
        which_key = true,
        indent_blankline = { enabled = true },
        lualine = true,
        treesitter = true,
        native_lsp = { enabled = true },
        cmp = true,
        gitsigns = true,
        mason = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
