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

syntax on
"color dracula

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Swap files
set shortmess+=A " Just open it, don't warn about an existing one

" Make `gf` create new file when it doesn't exist
nnoremap gf :e <cfile><cr>

" FZF integration
set rtp+=/opt/homebrew/fzf

" Functions
" Fuzzy find and edit file
nnoremap <leader>t :FZF<cr>

" UGH

silent! source ~/dotfiles/vim/vimrc.bash
silent! source ~/dotfiles/vim/vimrc.cocoa
silent! source ~/dotfiles/vim/vimrc.markdown
silent! source ~/dotfiles/vim/vimrc.local
silent! source ~/dotfiles/vim/vimrc.plugins
silent! source ~/dotfiles/vim/vimrc.ruby
set nocompatible

let termProgram = $TERM_PROGRAM
if termProgram == 'Apple_Terminal'
    silent! source ~/.vimrc.termapp
else
    silent! source ~/.vimrc.itermapp
endif
