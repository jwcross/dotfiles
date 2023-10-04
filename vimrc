filetype plugin indent on
inoremap jk <Esc>

set backspace=indent,eol,start
set clipboard=unnamed " copy to system clipboard
set hidden
set ignorecase
set nocompatible
set number
set ruler

" Softtabs with 4 spaces
set expandtab
set shiftwidth=4
set shiftround
set tabstop=4

" Swap files
set shortmess+=A " Just open it, don't warn about an existing one

" Make `gf` create new file when it doesn't exist
nnoremap gf :e <cfile><cr>

" Colors and visual styling
"""""""""""""""""""""""""""
syntax on
"color dracula
" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Leader hotkeys
""""""""""""""""
nnoremap <leader>t :FZF<cr>
nnoremap <leader>v :e ~/.vimrc<cr>
nnoremap <leader>r :!%:p<cr>

" Plugins
"""""""""
set rtp+=/opt/homebrew/fzf
silent! source ~/dotfiles/vim/vimrc.plugins

" Further configuration
"""""""""""""""""""""""
" what does silent! do here?
silent! source ~/dotfiles/vim/vimrc.cocoa
silent! source ~/dotfiles/vim/vimrc.markdown
silent! source ~/dotfiles/vim/vimrc.local
silent! source ~/dotfiles/vim/vimrc.ruby

" does this need to be at end?
set nocompatible
