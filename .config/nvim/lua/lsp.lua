--[[
 _
| |    __ _ _ __   __ _ _   _  __ _  __ _  ___
| |   / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \
| |__| (_| | | | | (_| | |_| | (_| | (_| |  __/
|_____\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___|
                  |___/             |___/
 ____                             ____            _                  _
/ ___|  ___ _ ____   _____ _ __  |  _ \ _ __ ___ | |_ ___   ___ ___ | |
\___ \ / _ \ '__\ \ / / _ \ '__| | |_) | '__/ _ \| __/ _ \ / __/ _ \| |
 ___) |  __/ |   \ V /  __/ |    |  __/| | | (_) | || (_) | (_| (_) | |
|____/ \___|_|    \_/ \___|_|    |_|   |_|  \___/ \__\___/ \___\___/|_|

]]--

lsp = require 'lspconfig'

-- Custom keybindings that only happen with lsp on
function custom_lsp_attach(client)
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  require('completion').on_attach()
end

-- C
lsp.clangd.setup{ on_attach = custom_lsp_attach }

-- Bash
lsp.bashls.setup{ on_attach = custom_lsp_attach }

-- Lua
lsp.sumneko_lua.setup{
  cmd = {'lua-language-server', '-E',  '/usr/share/lua-language-server/main.lua'},
  setting = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua
        version = 'LuaJIT',
        -- Setup lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },

  on_attach = custom_lsp_attach
}
