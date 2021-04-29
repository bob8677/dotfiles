--[[
 ____  _             _
|  _ \| |_   _  __ _(_)_ __  ___
| |_) | | | | |/ _` | | '_ \/ __|
|  __/| | |_| | (_| | | | | \__ \
|_|   |_|\__,_|\__, |_|_| |_|___/
               |___/
]]--


-- paq settings
vim.cmd 'packadd paq-nvim'              -- Load paq (package manager)
local paq = require'paq-nvim'.paq       -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}          -- Let Paq manage itself

-- Lsp
paq 'neovim/nvim-lspconfig'             -- Configuration for built in lsp
paq 'nvim-lua/completion-nvim'             -- Configuration for built in lsp

-- Git
paq 'tpope/vim-fugitive'                -- Git integration
paq 'airblade/vim-gitgutter'            -- Add diff info to the sign column

-- Fuzzy finder
paq 'nvim-telescope/telescope.nvim'     -- Fuzzy finder made in lua
paq 'nvim-lua/popup.nvim'               -- Needed for telescope
paq 'nvim-lua/plenary.nvim'             -- Needed for telescope

-- Whitespace
paq 'junegunn/vim-easy-align'           -- Alignment plugin

-- Statusline
paq 'itchyny/lightline.vim'             -- Lightline
paq 'mengelbrecht/lightline-bufferline' -- Bufferline for lightline

-- Surrounding '', "", (), [], ()
paq 'tpope/vim-surround'                -- Edit surrounding '', (), {}, [], and even html
paq 'jiangmiao/auto-pairs'              -- Automaticly input pairs of '', (), etc

-- Colors
paq 'joshdick/onedark.vim'              -- Onedark colorschemee

-- Use nvim in firefox
paq {'glacambre/firenvim', run=vim.fn['firenvim#install']}

-- Final touches
paq 'psliwka/vim-smoothie'              -- Smooth scroll
paq 'junegunn/goyo.vim'                 -- Plugin for focus and removing distractions
paq 'mhinz/vim-startify'                -- Start menu
paq 'tpope/vim-eunuch'                  -- Some shell-like commands for vim
