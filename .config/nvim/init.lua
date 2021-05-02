--[[
 _       _ _     _
(_)_ __ (_) |_  | |_   _  __ _
| | '_ \| | __| | | | | |/ _` |
| | | | | | |_ _| | |_| | (_| |
|_|_| |_|_|\__(_)_|\__,_|\__,_|

]]--

-- Import pulgins
require 'plugins'

-- Import options
require 'options'

-- Import keybindings
require 'keybindings'

-- Import lsp configuration
require 'lsp'

-- Import firenvim configuration
if vim.g.started_by_firenvim then
	vim.cmd'source ~/.config/nvim/firenvim.vim'
end
