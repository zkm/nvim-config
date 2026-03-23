# nvim-config

My personal Neovim configuration for Linux — full-featured IDE setup using lazy.nvim.

## Requirements
- Neovim >= 0.9
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `ripgrep` for Telescope live grep

## Install
git clone git@github.com:zkm/nvim-config.git ~/.config/nvim

## Structure
~/.config/nvim/
├── init.lua
├── lazy-lock.json
└── lua/
    └── plugins/
        ├── init.lua
        ├── cmp.lua
        ├── copilot.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── neotree.lua
        ├── telescope.lua
        ├── theme.lua
        └── treesitter.lua

## Plugins

### Core
- [lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager

### LSP & Completion
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — LSP configuration
- [mason.nvim](https://github.com/williamboman/mason.nvim) — LSP/tool installer
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) — mason/lspconfig bridge
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — completion engine
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) — LSP completion source
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) — buffer completion source
- [cmp-path](https://github.com/hrsh7th/cmp-path) — path completion source
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) — snippet engine
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) — LuaSnip completion source

### AI
- [copilot.vim](https://github.com/github/copilot.vim) — GitHub Copilot

### Navigation
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — fuzzy finder
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) — file explorer

### Syntax
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — syntax highlighting & indentation

### UI
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) — colorscheme
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — statusline

### LSP Language Servers (via Mason)
- `lua_ls` — Lua
- `gopls` — Go
- `elixirls` — Elixir
- `rust_analyzer` — Rust
