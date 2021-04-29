--[[
 _  __          _     _           _ _
| |/ /___ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___
| ' // _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
| . \  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
|_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
          |___/                             |___/
]]--

-- Helper function for mapping keys
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Set leader to space
vim.cmd 'let mapleader = " "'

-- Change Y to yank to end instead of the whole line
map('', 'Y', 'y$')

-- Use tab for popup menus
vim.cmd'inoremap <expr> <Tab>     pumvisible() ? "\\<C-n>" : "\\<Tab>"'
vim.cmd'inoremap <expr> <S-Tab>   pumvisible() ? "\\<C-p>" : "\\<S-Tab>"'
