vim.g.mapleader        = ' '
vim.g.maplocalleader   = ' '

vim.g.have_nerd_font   = true

-- change default settings of netrw
vim.g.netrw_banner     = 0

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard      = 'unnamedplus'

-- Set the number of spaces that a <Tab> counts for during editing operations
vim.opt.tabstop = 2

-- Set the number of spaces that a <Tab> displays as
vim.opt.softtabstop = 2

vim.opt.shiftwidth = 2       -- Set the number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true     -- Use spaces instead of tabs

vim.opt.relativenumber = true
vim.opt.number         = true

vim.opt.mouse          = 'a'

vim.opt.showmode       = false

-- Enable break indent
vim.opt.breakindent    = true

-- Save undo history
vim.opt.undofile       = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

-- Keep signcolumn on by default
vim.opt.signcolumn     = 'yes'

-- Decrease update time
vim.opt.updatetime     = 250
vim.opt.timeoutlen     = 300

-- Configure how new splits should be opened
vim.opt.splitright     = true
vim.opt.splitbelow     = true

-- Preview substitutions live, as you type!
vim.opt.inccommand     = 'split'

-- Show which line your cursor is on
vim.opt.cursorline     = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch       = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

--[[ -- Enable terminal title
vim.o.title = true

-- Set the title string to show the current directory
vim.o.titlestring = "%{expand('%:p:h:t')}" ]]

-- Function to set the initial window title based on the launch directory
local function set_initial_window_title()
    local initial_cwd = vim.fn.getcwd()
    local initial_dir_name = initial_cwd:match("([^/]+)$")

    vim.opt.titlestring = initial_dir_name
    vim.opt.title = true
end

-- Autocommand to set the initial title on Neovim startup
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = set_initial_window_title
})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- file tree
--[[ vim.api.nvim_set_keymap('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true, silent = true }) ]]
vim.api.nvim_set_keymap('n', '<C-n>', ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-o>', ":Oil --float<CR>", { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Format code using conform
vim.keymap.set({ 'n', 'v' }, '<leader>ff', ':Format<CR>', { desc = '[F]ormat document', silent = true })

-- remap to keep the cursor in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-b>', '<C-b>gg')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- remap to move the selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.diagnostic.config({virtual_text = false})
