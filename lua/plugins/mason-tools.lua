return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    local has_npm = vim.fn.executable("npm") == 1

    local ensure_installed = {
      "stylua",
      "selene",
    }

    if has_npm then
      table.insert(ensure_installed, "prettierd")
      table.insert(ensure_installed, "eslint_d")
    end

    if has_npm then
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
