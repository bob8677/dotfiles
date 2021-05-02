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
opt('o', 'updatetime', 100)                                   -- Update the swap file quickly - for gitgutter
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
vim.cmd'set list listchars=tab:\\|\\ ,trail:-,nbsp:+'         -- Display line for tab

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

local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local finders = require('telescope.finders')

function my_custom_picker(results)
  pickers.new {
    results_title = 'Resources',
    -- Run an external command and show the results in the finder window
    finder = finders.new_oneshot_job({'find', '.', '-type', 'd', '-not', '-path', '\'*/.*\''}),
    sorter = sorters.get_fuzzy_file(),
    previewer = previewers.new_termopen_previewer {
      -- Execute another command using the highlighted entry
      get_command = function(entry)
        return {'echo', entry.value}
      end
    },
  }:find()
end

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  indent = { enable = true },
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
}
