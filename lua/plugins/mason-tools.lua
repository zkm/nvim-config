return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  enabled = vim.fn.has("nvim-0.9") == 1,
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    local ensure_installed = {
      "stylua",
      "selene",
      "prettierd",
      "eslint_d",
    }

    if vim.fn.executable("npm") == 1 then
      table.insert(ensure_installed, "stylelint-language-server")
    end

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
      run_on_start = true,
      auto_update = false,
      start_delay = 3000, -- 3 second delay
    })
  end,
}
