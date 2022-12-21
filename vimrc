"display command line’s tab complete options as a menu"
set wildmenu

" enable syntax highlighting
syntax enable

" dark background
set background=dark

" Auto-indent new lines
set autoindent

" Use spaces instead of tabs
set expandtab

" Number of auto-indent spaces
set shiftwidth=2

" Enable smart-indent
set smartindent

" Enable smart-tabs set
set smarttab

"Number of spaces per Tab
set softtabstop=2

" Use Mouse
set mouse=a

" improve searching
set ignorecase
set incsearch

" make the vertical split bar nice
highlight VertSplit cterm=none ctermfg=black

" set numbers and make them nice
set number
highlight LineNr ctermfg=darkgrey

" Trailing Whitespace removal
" the function helps keeping the cursor where it was before
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" enable folding
"set foldmethod=indent
"set foldlevel=99
"" Enable folding with the spacebar
"nnoremap <space> za

" --- BEGIN VUNDLE PLUGIN MANAGER ---
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Lightline
Plugin 'itchyny/lightline.vim'
set laststatus=2

" jsonnet
Plugin 'google/vim-jsonnet'
let g:jsonnet_fmt_on_save = 0

" jedi-vim for python
Plugin 'davidhalter/jedi-vim'

" cool shortcuts for jedi-vim
" <leader>n -> (shows all the usages of a name) #leader default -> '\'
" K -> Show Documentation/Pydoc
" <leader>d -> Goto definition / (follow identifier as far as possible, includes imports and statements)
" <leader>g -> Goto assignment (typical goto function)

" ale asynchronous linting
Plugin 'dense-analysis/ale'

let g:ale_enabled = 1
" let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 0

" add prettier markers
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_linters = {
\   'python': ['flake8', 'pydocstyle', 'bandit', 'mypy'],
\   'go': ['go', 'golint', 'errcheck'],
\   'shell': ['shellcheck']
\}

let g:ale_fixers = {
\   'python': ['black'],
\   'sh': ['shfmt']
\}

" Ctrl + e to jump to next error
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Gruvbox color theme
Plugin 'morhetz/gruvbox'
" activate gruvbox color scheme
autocmd vimenter * ++nested colorscheme gruvbox
set termguicolors

" supertab - tabcompletion
Plugin 'ervandew/supertab'

" NERDTREE, ctrl+n to toggle
Plugin 'scrooloose/nerdtree'
map <silent> <C-n> :NERDTreeFocus<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" --- END VUNDLE PLUGIN MANAGER ---
