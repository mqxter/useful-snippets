set nocompatible
set number

" === Performance Optimization ===
" set synmaxcol=300         " Limit syntax highlighting columns
set lazyredraw            " Don't redraw during macros
set regexpengine=1        " Faster regex engine
set maxmempattern=2000    " Limit pattern memory
set ttyfast               " Fast terminal



" from common
set display+=lastline
set wildmenu
set relativenumber
set noerrorbells
set visualbell
set title
set confirm
set history=1000
" set backspace=indent,eol,start

" show filepath
set statusline+=%F
set showtabline=3
set laststatus=2
" set statusline =%4*\ %<%F%*

syntax on

set showmatch

set clipboard=unnamed
" set mouse=a

hi TabLineSel ctermfg=Red ctermbg=Yellow
hi TabLineFill ctermfg=Black ctermbg=Black

set hlsearch  " Highlight all search results
" hi Search ctermbg=LightYellow

set ignorecase  " Always case-insensitive
set smartcase " Your search will be case sensitive if it contains an uppercase letter
set incsearch " Searches for strings incrementally

set autoindent  " Auto-indent new lines
set expandtab " Use spaces instead of tabs
set shiftwidth=2  " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab  " Enable smart-tabs
set softtabstop=2 " Number of spaces per Tab

autocmd BufEnter *.bash set tabstop=8 softtabstop=8 shiftwidth=8
autocmd BufEnter *.py set tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufEnter *.json set tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufEnter *.yml set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.hcl set filetype=hcl

" --- Performance tweaks for YAML ---
autocmd FileType yaml set synmaxcol=400
autocmd FileType yaml set nowrap conceallevel=0
autocmd FileType yaml let g:indentLine_enabled = 0
autocmd FileType yaml IndentLinesDisable
autocmd FileType yaml ALEDisable
autocmd FileType yaml IndentLinesDisable
autocmd FileType yaml let g:ale_lint_on_text_changed = 0

set path+=**
set wildignore+=comma,separated,list,of,file,patterns

" testing
" set autochdir
set directory=$HOME/.vim/swapfiles//
set backupdir=~/.vim/backup

" search
command -nargs=1 MySearch :g/<args>/y A | :let @+ = @a

call plug#begin()
set rtp+=/opt/homebrew/opt/fzf

" nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <F12> :Buffers<CR>
nnoremap <silent> <C-g> :Ag<CR>
noremap <C-Left> :tabprev<CR>
noremap <C-Right> :tabnext<CR>
nnoremap <Esc> :nohlsearch<CR><Esc>
xnoremap > >gv
xnoremap < <gv
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--path-to-ignore ~/.ignore --hidden', <bang>0)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--hidden', <bang>0)

"nnoremap <C-Left> :tabnext<CR>
"nnoremap <C-Right> :tabprevious<CR>

" terraform
Plug 'hashivim/vim-terraform'


Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'preservim/nerdtree'

let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1

Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'towolf/vim-helm'

Plug 'Einenlum/yaml-revealer', { 'on': 'YamlReveal' }
" let g:yaml_revealer_separator = '.'

Plug 'tarekbecker/vim-yaml-formatter', { 'on': 'YamlFormat' }
let g:yaml_formatter_indent_collection=1
" Only format on demand, not automatically
let g:yaml_formatter_auto_format = 0

let g:go_auto_type_info = 1 "Status line types/signatures
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint']
\}
let g:ale_fix_on_save = 1
" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Plug 'tomasiser/vim-code-dark'

Plug 'flazz/vim-colorschemes'
call plug#end()

" set background=dark
" ddcolorscheme codedark
" colorscheme retrobox
" colorscheme koehler sorbet
" colorscheme habamax
colorscheme retrobox
