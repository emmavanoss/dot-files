call plug#begin()

Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
" For nord colour scheme in terminal.app, https://github.com/arcticicestudio/nord-terminal-app
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

filetype off
filetype plugin indent on
syntax on

set background=dark
colorscheme nord

let &t_SI = "\e[6 q"                                        " bar cursor in insert mode
let &t_EI = "\e[1 q"                                        " blinking block cursor in normal mode
" let &t_EI = "\e[2 q"                                        " steady block cursor in normal mode

set noshowmode
set timeoutlen=420
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set hlsearch
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 4 spaces
set tabstop=4                                                " actual tabs occupy 4 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set mouse=a
set textwidth=79
set formatoptions-=t                                         " please no wrap!
set colorcolumn=+1
highlight ColorColumn ctermbg=8 guibg=darkgrey
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000                                         " maximum number lines to save for undo on a
set completeopt-=preview
vnoremap p "_dP
" Don't copy the contents of an overwritten selection.

let mapleader = ','

" NERDTree
let g:NERDSpaceDelims=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30
nnoremap <leader>d :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

" ALE linter
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
