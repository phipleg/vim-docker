" **** General section ****

scriptencoding utf-8
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night-Eighties




" Set encoding
set encoding=utf-8
" Deactivate mode line magic (see http://vim.wikia.com/wiki/Modeline_magic)
set modelines=0
" enable system clipboard
set clipboard=unnamedplus
" speed up rendering
set synmaxcol=128
" scroll jump size
set ttyscroll=10
" no line wrap
set nowrap
" show line numbers
set number
" set cursor line
" set cursorline
" change color visual mode in order to distinguish from cursor line
hi Visual term=reverse cterm=reverse guibg=Grey
" activate mouse support
set mouse=a

" TABS AND SPACES
" ===============

" columns per tab
set tabstop=2
" replace tabs with spaces
set expandtab
" reindent operation size (using < or >)
set shiftwidth=2
" indent when moving to the next line while writing code
set autoindent
" Visualize whitespaces
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" Map ctr+v+tab to tab symbol
nnoremap <tab> <c-w><c-w>


" Highlight search results
set hlsearch
" Start searching while typing
set incsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" case insensitive search
set ignorecase
" fallback to case sensitive if the pattern has uppercase letters
set smartcase

" no backup files *~
set nobackup
" no backup files while editing
set nowritebackup
" activate swap file
" set swapfile
" common directory for all swap files
" set dir=~/.vimswp
set noswapfile


" ctrlp
" =====
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" order matching files top to bottom
" let g:ctrlp_match_window = 'bottom,order:ttb'
" always open files in new buffers
let g:ctrlp_switch_buffer = 0
" change the working directory during a Vim session and make CtrlP respect that
let g:ctrlp_working_path_mode = 0
" ignore non-text files
" set wildignore+=*/.git/*,*/tmp/*,*.so,*.class,*.pyc,*.bin,*.swp,*.jar,*.zip,*.gz,*.tar,*.pkl,*/data/*,*/node_modules/*
