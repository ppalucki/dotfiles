filetype indent on
set nocompatible

if empty(glob("~/.vim/autoload/plug.vim"))
   execute '!mkdir -p ~/.vim/autoload'
   execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'for':  'go' }
call plug#end()

set number

au FileType go setlocal ts=4 sw=4 sts=4 noexpandtab
