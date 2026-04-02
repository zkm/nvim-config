vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local uv = vim.uv or vim.loop
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
local opts = {
  number = true, -- Show absolute line numbers
  relativenumber = true, -- Show relative line numbers for motions
  termguicolors = true, -- Enable 24-bit RGB colors
  expandtab = true, -- Convert tabs to spaces
  shiftwidth = 2, -- Indent width for << and >>
  tabstop = 2, -- Visual width of a tab character
  mouse = "a", -- Enable mouse support in all modes
  numberwidth = 4, -- Reserve gutter width for line numbers
  signcolumn = "yes", -- Always show sign column to avoid text shifting
}

for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Auto-open Neo-tree when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      vim.cmd("Neotree")
    end
  end,
})

-- Load plugins
require("lazy").setup("plugins")
