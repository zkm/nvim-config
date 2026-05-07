return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({ delay = 500 })
    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>b", group = "Buffer" },
    })
    vim.keymap.set("n", "<leader>?", ":WhichKey<CR>", { desc = "Show keybinds" })
  end,
}
