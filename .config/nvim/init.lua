-- ================================
-- Basic Settings
-- ================================
-- regex strings related
vim.o.synmaxcol = 3000

-- Skip polyglot's JSON bundle; we disable JSON syntax highlighting below
vim.g.polyglot_disabled = { 'json' }

-- Clipboard integration
vim.opt.clipboard = 'unnamedplus'

-- Completion menu behavior
vim.opt.completeopt = { 'noinsert', 'menuone', 'noselect' }

-- Visual enhancements
vim.opt.cursorline = true          -- Highlight current line
vim.opt.cursorcolumn = true        -- Highlight current column
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Show relative line numbers
-- vim.opt.colorcolumn = '80'         -- Column guide at 80 characters
vim.opt.title = true               -- Show file title in terminal

-- Editing behavior
vim.opt.hidden = true              -- Allow switching buffers without saving
vim.opt.autoindent = true          -- Auto-indent new lines
vim.opt.mouse = 'a'                -- Enable mouse support
vim.opt.inccommand = 'split'       -- Show live preview of substitutions

-- Search behavior
vim.opt.ignorecase = true          -- Case insensitive search
vim.opt.smartcase = true           -- Case sensitive if uppercase letters present

-- Window behavior
vim.opt.splitbelow = true          -- More natural split directions
vim.opt.splitright = true

-- Performance
vim.opt.ttyfast = true             -- Faster scrolling
vim.opt.updatetime = 500           -- CursorHold/swap idle delay in ms (default 4000)

-- File type detection
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- Interface enhancements
vim.opt.wildmenu = true            -- Enhanced command completion
vim.opt.wildmode = 'longest:full,full'  -- Complete longest common string, then full matches

-- ================================
-- Plugin Management
-- ================================

local vim_plug_path = vim.fn.stdpath('data') .. '/plugged'

vim.call('plug#begin', vim_plug_path)

-- Color scheme
vim.cmd([[Plug 'morhetz/gruvbox']])

-- Status line and interface
vim.cmd([[Plug 'vim-airline/vim-airline']])
vim.cmd([[Plug 'vim-airline/vim-airline-themes']])
vim.cmd([[Plug 'ryanoasis/vim-devicons']])

-- File management
vim.cmd([[Plug 'scrooloose/nerdtree']])

-- Code editing
vim.cmd([[Plug 'scrooloose/nerdcommenter']])
vim.cmd([[Plug 'jiangmiao/auto-pairs']])
vim.cmd([[Plug 'sheerun/vim-polyglot']])

-- Code intelligence
vim.cmd([[Plug 'neoclide/coc.nvim', {'branch': 'release'}]])

-- Git integration
vim.cmd([[Plug 'tpope/vim-fugitive']])

-- Fuzzy finder
vim.cmd([[Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }]])
vim.cmd([[Plug 'junegunn/fzf.vim']])

vim.call('plug#end')

-- ================================
-- Plugin Configuration
-- ================================

-- Color scheme
vim.cmd('colorscheme gruvbox')
vim.opt.background = 'dark'

-- Airline configuration
vim.g.airline_solarized_bg = 'dark'
vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'

-- Show full file path in status line
vim.g['airline_section_c'] = '%F'

-- NERDTree configuration
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeShowHidden = 1

-- ================================
-- Auto-commands
-- ================================

-- Auto-create parent directories when saving
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    local dir = vim.fn.expand('%:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end
})

-- FileType patterns match &filetype, not "*.k"; we key *.k off the filename suffix.
-- json/jsonc: no regex syntax.
-- *.k: keep KCL syntax but scan whole line (avoids "half highlighted" strings when global
-- synmaxcol is 3000). True "plain text inside long strings only" needs Tree-sitter + custom code.
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype
    if ft == 'json' or ft == 'jsonc' then
      vim.cmd('setlocal syntax=OFF')
    elseif vim.fn.expand('%:e') == 'k' then
      vim.cmd('setlocal synmaxcol=0')
    else
      vim.cmd('setlocal synmaxcol<')
    end
  end,
})

-- ================================
-- Key Mappings
-- ================================

-- Set leader key
vim.g.mapleader = ','

-- Quick file explorer
vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Find current file in NERDTree
vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- Quick save
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- Quick quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- Half-page scroll with Shift+Up/Down
vim.keymap.set('n', '<S-Up>', '10k', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', '10j', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Up>', '10k', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Down>', '10j', { noremap = true, silent = true })

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })

-- Buffer navigation
vim.keymap.set('n', '<C-Right>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', ':bprevious<CR>', { noremap = true, silent = true })
-- Previous tab navigation (kept for rollback):
-- vim.keymap.set('n', '<C-Right>', ':tabnext<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-Left>', ':tabprevious<CR>', { noremap = true, silent = true })

-- Command-line completion navigation
vim.keymap.set('c', '<Up>', '<C-p>', { noremap = true })
vim.keymap.set('c', '<Down>', '<C-n>', { noremap = true })
vim.keymap.set('c', '<Left>', '<Left>', { noremap = true })
vim.keymap.set('c', '<Right>', '<Right>', { noremap = true })

-- FZF mappings
vim.keymap.set('n', '<leader>f', ':Files!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>g', ':Rg!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', ':Lines<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':History<CR>', { noremap = true, silent = true })

-- Override :Rg to include hidden files/dirs (e.g. .github), but skip .git/
vim.cmd([[
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --glob "!.git/" -- '.shellescape(<q-args>),
    \   1, fzf#vim#with_preview(), <bang>0)
]])

-- Clear search highlighting with double Esc
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- ================================
-- Coc.nvim Configuration
-- ================================

-- Auto-install missing coc extensions on startup
-- coc-pyright: Python LSP (completion, go-to-definition, diagnostics, hover)
vim.g.coc_global_extensions = { 'coc-go', 'coc-pyright' }

-- Make Enter accept selected completion item or insert newline with proper formatting
-- vim.keymap.set('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { expr = true, noremap = true, silent = true })

-- Navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gD', '<Plug>(coc-declaration)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Hover: show type / signature / docs popup
vim.keymap.set('n', 'K', function()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd('normal! K')
  end
end, { silent = true })

-- Diagnostics
vim.keymap.set('n', '<leader>d', function() vim.fn.CocActionAsync('diagnosticInfo') end, { silent = true })
vim.keymap.set('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.keymap.set('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })
vim.keymap.set('n', '<leader>D', ':CocDiagnostics<CR>', { noremap = true, silent = true })
