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

local function install(packages)
  for i, package in ipairs(packages) do
    paq(package)
  end
end

install {
  -- Lsp
  'neovim/nvim-lspconfig',             -- Configuration for built in lsp
  'nvim-lua/completion-nvim',          -- Completion for built in lsp

  -- Treesitter
  {'nvim-treesitter/nvim-treesitter',  -- Treesitter for syntax highlighting
    run=vim.fn['TSUpdate']},
  'romgrk/nvim-treesitter-context',    -- Add context to the top of the buffer using TS
  'nvim-treesitter/nvim-treesitter-refactor',
  -- 'nvim-treesitter/playground',        -- View treesitter info in nvim

  -- Git
  'TimUntersberger/neogit',            -- Git integration
  'lewis6991/gitsigns.nvim',           -- Add diff info to the sign column

  -- Fuzzy finder
  'nvim-telescope/telescope.nvim',     -- Fuzzy finder made in lua
  'nvim-lua/popup.nvim',               -- Needed for telescope
  'nvim-lua/plenary.nvim',             -- Needed for telescope

  -- Whitespace
  'junegunn/vim-easy-align',           -- Alignment plugin
  {                                    -- Indentation lines
    'lukas-reineke/indent-blankline.nvim',
    branch='lua',
  },
  'editorconfig/editorconfig-vim',     -- Configuration per project

  -- Statusline
  'itchyny/lightline.vim',             -- Lightline
  'mengelbrecht/lightline-bufferline', -- Bufferline for lightline

  -- Surrounding '', "", (), [], ()
  'tpope/vim-surround',                -- Edit surrounding '', (), {}, [], and even html
  'windwp/nvim-autopairs',             -- Automatically input pairs of '', (), etc

  -- Comments
  'b3nj5m1n/kommentary',               -- Plugin for toggling comments

  -- Colors
  'joshdick/onedark.vim',              -- Onedark colorscheme

  -- Use nvim in firefox
  {'glacambre/firenvim', run=vim.fn['firenvim#install']},

  -- Visual effects
  'psliwka/vim-smoothie',              -- Smooth scroll
  'edluffy/specs.nvim',                -- Small animation when cursor jumps

  -- Final touches
  'junegunn/goyo.vim',                 -- Plugin for focus and removing distractions
  'mhinz/vim-startify',                -- Start menu
  'tpope/vim-eunuch',                  -- Some shell-like commands for vim
}
