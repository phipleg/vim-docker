" Disable vi-compatibility
set nocompatible
" Disable for Vundle initialisation
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Fuzzy file, buffer, mru, tag, etc finder
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'FelikZ/ctrlp-py-matcher'

" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'

" Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications,
" including zsh, bash, tmux, IPython, Awesome and Qtile
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
" Bundle 'klen/python-mode'

" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'
" Bundle 'rking/ag.vim'

" git integration (:Git status)
" Bundle 'tpope/vim-fugitive'
" git diff integration
" Bundle 'airblade/vim-gitgutter'

call vundle#end()
" To ignore plugin indent changes, instead use:
"filetype plugin on
"filetype plugin indent on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" **** Source user config ****

if filereadable("/root/.vimrc.user.vim")
       execute "source /root/.vimrc.user.vim"
endif
