-- init.lua tailored specifically for VSCode Neovim
-- Removes standalone-only plugins (statusline, telescope, neo-tree, etc.)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[ Basic options ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- [[ Keymaps ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- VSCode-specific remaps (search + LSP)
vim.keymap.set('n', '<leader>sf', function()
  vim.fn.VSCodeNotify('workbench.action.quickOpen')
end, { desc = '[S]earch [F]iles (VSCode)' })

vim.keymap.set('n', '<leader>sg', function()
  vim.fn.VSCodeNotify('workbench.action.findInFiles')
end, { desc = '[S]earch by [G]rep (VSCode)' })

vim.keymap.set('n', '<leader>sb', function()
  vim.fn.VSCodeNotify('workbench.action.showAllEditors')
end, { desc = '[S]earch [B]uffers (VSCode)' })

-- LSP-like keymaps mapped to VSCode commands
vim.keymap.set('n', 'grn', function()
  vim.fn.VSCodeNotify('editor.action.rename')
end, { desc = 'LSP: Rename (VSCode)' })

vim.keymap.set({'n','x'}, 'gra', function()
  vim.fn.VSCodeNotify('editor.action.quickFix')
end, { desc = 'LSP: Code Action (VSCode)' })

vim.keymap.set('n', 'grr', function()
  vim.fn.VSCodeNotify('editor.action.referenceSearch.trigger')
end, { desc = 'LSP: References (VSCode)' })

vim.keymap.set('n', 'grd', function()
  vim.fn.VSCodeNotify('editor.action.revealDefinition')
end, { desc = 'LSP: Definition (VSCode)' })

vim.keymap.set('n', 'gri', function()
  vim.fn.VSCodeNotify('editor.action.goToImplementation')
end, { desc = 'LSP: Implementation (VSCode)' })

vim.keymap.set('n', 'grt', function()
  vim.fn.VSCodeNotify('editor.action.goToTypeDefinition')
end, { desc = 'LSP: Type Definition (VSCode)' })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- -- [[ lazy.nvim bootstrap ]]
-- local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', 'https://github.com/folke/lazy.nvim.git', lazypath }
-- end
-- vim.opt.rtp:prepend(lazypath)

-- -- [[ Plugins for VSCode Neovim only ]]
-- require('lazy').setup({
--   'tpope/vim-sleuth',
--   { 'lewis6991/gitsigns.nvim', opts = {} },
--   { 'folke/which-key.nvim', event = 'VimEnter', opts = { delay = 0 } },

--   -- Formatting
--   -- { 'stevearc/conform.nvim', event = { 'BufWritePre' }, opts = {
--   --     formatters_by_ft = { lua = { 'stylua' }, python = { 'isort', 'ruff', 'black' } },
--   --   }},

--   -- Completion

--   -- { 
--   --   'saghen/blink.cmp',
--   --   event = 'InsertEnter',
--   --   dependencies = { 'L3MON4D3/LuaSnip' },
--   --   opts = {
--   --     keymap = { preset = 'default' },
--   --     snippets = { preset = 'luasnip' },
--   --     appearance = { nerd_font_variant = 'mono' },
--   --     sources = { default = { 'lsp', 'path', 'snippets' } },
--   --   }
--   -- },

--   -- -- Treesitter (syntax & highlighting)
--   -- { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', opts = {
--   --     ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'python', 'vim' },
--   --     auto_install = true,
--   --     highlight = { enable = true },
--   --     indent = { enable = true },
--   --   }},

--   -- Colorscheme
--   -- { 'catppuccin/nvim', name = 'catppuccin', priority = 1000, config = function()
--   --     require("catppuccin").setup({ flavour = "macchiato" })
--   --     vim.cmd.colorscheme 'catppuccin'
--   --   end },

--   -- Todo comments
--   -- { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },

--   -- Minimal useful bits from mini.nvim
--   { 'echasnovski/mini.nvim', config = function()
--       require('mini.ai').setup { n_lines = 500 }
--       require('mini.surround').setup()
--     end },

-- }, {
--   ui = { icons = vim.g.have_nerd_font and {} or { plugin = '🔌' } },
-- })

-- -- vim: ts=2 sts=2 sw=2 et