--[[
  ___        _   _
 / _ \ _ __ | |_(_) ___  _ __  ___
| | | | '_ \| __| |/ _ \| '_ \/ __|
| |_| | |_) | |_| | (_) | | | \__ \
 \___/| .__/ \__|_|\___/|_| |_|___/
      |_|
]]--

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

opt('o', 'mouse', 'a')                                        -- Use the mouse
opt('o', 'termguicolors', true)                               -- Enable full colors in term
opt('o', 'clipboard', 'unnamedplus')                          -- Use the system clipboard
opt('o', 'completeopt', 'menuone,noinsert,noselect')          -- Use the system clipboard
opt('o', 'shortmess', vim.o.shortmess .. 'c')
opt('o', 'guifont', 'FiraCode Nerd Font:style=Light,Regular') -- Font for gui
opt('w', 'scrolloff', 6)                                      -- Start moving the view with 6 lines from the bottom
opt('w', 'signcolumn', "yes")                                 -- Always show sign column
opt('w', 'number', true)                                      -- Show line numbers
opt('w', 'relativenumber', true)                              -- Relative line numbers
opt('w', 'foldmethod', 'expr')                                -- TS based folding
opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')            -- TS based folding
opt('o', 'foldlevelstart', 999)                               -- Open all folds at start
opt('o', 'tabstop', 4)                               -- Open all folds at start

vim.cmd 'let g:indent_blankline_use_treesitter = v:true'
vim.cmd "let g:indent_blankline_context_patterns = ['class']"
vim.cmd 'let g:indent_blankline_strict_tabs = v:true'

-- highlight on yank
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}'

-- Colors
vim.cmd 'colorscheme onedark'
vim.g.lightline = { colorscheme = 'onedark' }

-- Completion (completion-nvim)
vim.g.completion_auto_change_source = true
vim.g.completion_chain_complete_list = {
  default = {
    default = {
      { complete_items = { 'lsp' } },
    },
   string = {
      { mode = 'file' },  -- use ins-complete "files" (search     ins-compl in completion-nvim help)
    },
  },
}

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    navigation = {
      enable = true,
      keymaps = {
        goto_next_usage = "]r",
        goto_previous_usage = "[r",
      },
    },
  },
  autopairs = { enable = true },
  playground = { enable = true },
}

-- Config to cursor animation when switching buffers and things
require('specs').setup{
  show_jumps  = true,
  min_jump = 10,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 10, -- time increments used for fade/resize effects
    blend = 50, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 30,
    winhl = "PMenu",
    fader = require('specs').exp_fader,
    resizer = require('specs').shrink_resizer
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    nofile = true,
  },
}

-- Gitsign (git diff) setup
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '│', numhl='GitGutterAdd'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitGutterChange', text = '│', numhl='GitGutterChange', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitGutterDelete', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitGutterDelete', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChange', linehl='GitSignsChangeLn'},
  },
  yadm = {
    -- dumb hacky way to see if we are in a git repo
    enable = os.execute('git rev-parse --git-dir > /dev/null 2>&1') == 32768
  },
}

-- Git
require'neogit'.setup {}

-- Autopairs
require'nvim-autopairs'.setup {
  check_ts = true,
}
