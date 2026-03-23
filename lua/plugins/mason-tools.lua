return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "selene",
        "prettierd",
        "eslint_d",
      },
      run_on_start = true,
      auto_update = false,
      start_delay = 1000,
      debounce_hours = 24,
    })
  end,
}
