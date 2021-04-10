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

" NERDTREE, ctrl+n to toggle
map <silent> <C-n> :NERDTreeFocus<CR>
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" --- END VUNDLE PLUGIN MANAGER ---
