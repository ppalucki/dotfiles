""" -------------------------------------------
"""         key bindings and shortcuts  
""" -------------------------------------------
" file navigation (function keys)
" F2 - NerdTree 
" <leader>F2 - NertTree locate file
" F3 - go to buffer symbol local  (ctrlpbuftag)
" <leader>F3 - tagbar toggle
" F4 - last files
" <leader> F4 - global last files
" F5 - symbols (from tags)
" F6 - modified files
" F7 - buffers
" F8 - generate tags
" F9/F10 - build/run/test or compile - lang dependent

" PYTHON keybindings
" <leader>id intrupt debugger
" <leader>iv intrupt vipdb debugger
" <leader>ip intrupt ipython embeded
"
"
" ---------------- debugger ----------------
" gn - go next
" gs - go step
" go - continue exit
" gu - go up frame
" gb - go bottom (down) frame
" gl - 'go location' of cursor
" gf - go finish
" ge - 'go end' (gdb finish)
" gj - 'go jump' run until location of cursor
" ga - 'go advanced' continue program up to given location
" until/finish
" <leader>tb - set breakpoint
"
" ------------ go to definition ---------
" gd - goto definition
" <leader>gd - goto definition in horizontal split
" <c-w>d or gD- goto definition in vertical split
"
" gf - goto file (under cursor)
" <c-w>f - goto file (new window)
"
" ------------ tmux -------------------
" <leader>r or tr - terminal rerun  (was rename)
" <leader>te - terminal exit
" <leader>tl - terminal line (also tt)
" <leader>tt - terminal terminal (aka send line)
" <leader>ta - terminal terminal ALL (send to all terminals)
" <leader>-X  - execut current line wo tmux
" <c-x> - terminal line + next line
" <c-s-x>  - (execute!) terminal terminal ALL and go to next line  (all terminals)
" NUMBER<c-x> - seletected by ctrl-a-q terminal - send line
" 8<c-x> or <leader>x - split vertical + terminal terminal 
" 9<c-x> or <ledeer>x - split horizontal + terminal terminal 
" <leader>ts - send selection + enter
" <leader>tS - send selection (wo enter) - was CPASTE (depracted) - TODO
" <leader>tw - send word (+enter)
" <leader>tW - send word (wo enter)
" <leader>tc - send Ctrl-C
" <leader>tu - terminal tests - run tests in termianl
"
" ------- golang ---------:
" <leader>a - autoimports all
" <leader>A - autoimports this keyword
" F9 - quick run (this file) with QuickRun
" <leader>F9 - build this package (current folder)
" F10 - test this file
" <leader>F10 - test all (./...)

" <leader>R - rename (python/go) 
" K - documentation
" <c-w>z - zOom window aka to tmux <c-a>z

set nocompatible              " be iMproved, required
filetype off                  " required

""" -------------------------------------------
"""          VIM-Plug (plugins)
""" -------------------------------------------
" autoinstalltion
" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
   execute '!mkdir -p ~/.vim/autoload'
   execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" (depracted)-------- vundle installation
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" let Vundle manage Vundle, required
" Plug 'gmarik/Vundle.vim'
"
"
""" VIM-plug url format
let g:plug_url_format = 'https://github.com/%s.git'

call plug#begin('~/.vim/plugged')

" porowanienie kataklogow
Plug 'vim-scripts/DirDiff.vim'

""" GITHUBs
" autoformatowanie zewnwtrznym programem - gq - nie dziala na osx
" Plug 'Chiel92/vim-autoformat' 
" automatyczne zakmykanie nawiasow
Plug 'Raimondi/delimitMate'
" obsluge ReST
"Plug 'Rykka/riv.vim' - colids with <c-e>
" jakies lepsze uzupelenianien
" Plug 'Shougo/neocomplcache.vim'
" gdy mam lua to lepsze jest
" Plug 'Shougo/neocomplete.vim'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" lepsze okno dialogowe przy otwieraniu zepsutych plikow
Plug 'chrisbra/Recover.vim'

"""" ctrlp and plugins
Plug 'kien/ctrlp.vim'
"" This plugin allow you to use CtrlP finder to execute setfiletype easily - :CtrlPFiletype
" Plug 'endel/ctrlp-filetype.vim' 
"" This extension adds a new CtrlP command, the :CtrlPCmdPalette, which allows you to find and run vim commands (internal or custom).
" Plug 'fisadev/vim-ctrlp-cmdpalette'
"" Easily open locally modified files in your git-versioned projects. :CtrlPModified and :CtrlPBranch
" mappend to F6
" Plug 'jasoncodes/ctrlp-modified.vim' 
"" GIT related: branch, diff, log
" Plug 'kaneshin/ctrlp-git'
"" It simply navigates and jumps to function definitions from the current file without ctags.  :CtrlPFunky - po co skoro mam CtrlBufTag
" Plug 'tacahiroy/ctrlp-funky'
"" tjump
" Plug 'vim-scripts/ctrlp-tjump'
Plug 'ivalkeen/vim-ctrlp-tjump'

" wszystko pod tabem
Plug 'ervandew/supertab'
" colorschemes 
Plug 'flazz/vim-colorschemes'

" --------------- PYTHON-related
Plug 'klen/python-mode', { 'for':  'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for':  'python' }
Plug 'alfredodeza/coveragepy.vim', { 'for':  'python' }
Plug 'nvie/vim-flake8', { 'for':  'python' }
Plug 'tlvince/vim-compiler-python', { 'for':  'python' }
" PyTest
Plug 'alfredodeza/pytest.vim', { 'for':  'python' }
" jedi-py dla vim
Plug 'davidhalter/jedi-vim', { 'for':  'python' }
Plug 'Rykka/doctest.vim', { 'for': 'python' }

" SQL execute
" Plug 'ivalkeen/vim-simpledb'
" tagbar
Plug 'majutsushi/tagbar'
" nerdtree
Plug 'scrooloose/nerdtree'

""" ----- ack-grep
Plug 'mileszs/ack.vim'

""" ----- syntastic - multilanguage linter
Plug 'scrooloose/syntastic'

""" ----- graphical gundo
" Plug 'sjl/gundo.vim'

""" ----- lepsze title dla taby
" Plug 'mkitt/tabline.vim'

"" In other words, you can search your selection text in |Visual-mode|.
" Plug 'thinca/vim-visualstar'
" !replaced with * or //
"
" dependensceies ???
Plug 'xolox/vim-misc'
" comment with gcc
Plug 'tomtom/tcomment_vim'
" uruchamianie w tle
Plug 'tpope/vim-dispatch'
" GIT
Plug 'tpope/vim-fugitive'
" " ruby/RAILS
" Plug 'tpope/vim-rails'
" better repeats
Plug 'tpope/vim-repeat'
" surround
Plug 'tpope/vim-surround'
" screensend/screenattach - because of osx path_max limit breaks Vim
" runtimepath
" Plug 'ervandew/screen'
" better paste from screen (with leader+p)
" Plug 'vim-scripts/screenpaste.vim'
"
" ------------- golang development
" Plug 'fatih/vim-go'
" with GoImport fix (python based solution not accepted by upstream)
Plug 'fatih/vim-go', { 'for':  'go' }
Plug 'rhysd/vim-go-impl', { 'for':  'go' }
Plug 'garyburd/go-explorer', { 'for':  'go' }

" zamiennik powerline
Plug 'bling/vim-airline'

" not required bundled with vim-go ??
" Plug 'nsf/gocode', {'rtp': 'vim/'}
" the same as gocode (bundled standalone and not required)
" Plug 'dgryski/vim-godef'

" real live completion for vim-go
" Plug 'Valloric/YouCompleteMe'

" QuickRun
Plug 'thinca/vim-quickrun'


" clojure plugin
" Plug 'tpope/vim-fireplace'

" DistractionFreeMode light version
Plug 'bilalq/lite-dfm'

" udawane registry
" Plug 'kana/vim-fakeclip'

" import tag
" nie dziala bo zla sciezka jest
"Plug 'mjbrownie/Python-Tag-Import'

" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
"Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plug 'L9'
" Git plugin not hosted on GitHub
"Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plug 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plug 'user/L9', {'name': 'newL9'}
" // disabled because is often a problem with vim pane zommed!
" Plug 'christoomey/vim-tmux-navigator'
"
"""" SOME ERRORS like tmux cannot find
" Plug 'wellle/tmux-complete.vim', { 'for':  'sh' }

" fork with 'escaping $ fix'
" Plug 'benmills/vimux'

Plug 'ekalinin/Dockerfile.vim'
" Plug 'altercation/vim-colors-solarized'
"
" Plug 'guyzmo/vim-etherpad'
"
" broken because in restored I cannot save file again (and slow!)
" Plug 'vim-scripts/ZoomWin' 



Plug 'elzr/vim-json'

Plug 'guns/xterm-color-table.vim'

" Plug 'justmao945/vim-clang'
"
Plug 'vim-scripts/a.vim'

" GDB 
" Plug 'skibyte/gdb-from-vim'

" All of your Plugins must be added before the following line
" call vundle#end()            " required
"

Plug 'terryma/vim-multiple-cursors'

""" ----- smoth scrolling 
" Plug 'terryma/vim-smooth-scroll'

""" ----- patch review
Plug 'junkblocker/patchreview-vim'

""" ----- set filetype based on shebang
Plug 'vitalk/vim-shebang'

""" better verbose
Plug 'tpope/vim-scriptease'
call plug#end()
" To ignore plugin indent changes, instead use:
"filetype plugin on
""" -------------------------------------------
"""         Core settings
""" -------------------------------------------
filetype plugin indent on
syntax on

""" -------------------------------------------
"""         colorscheme
""" -------------------------------------------
"podglad numerow kolorow ~/download/xtrem-colortest -w -r syntax on musi byc "przed kolorkami
set t_Co=256
let g:molokai_original = 0
colorscheme molokai
" colorscheme desert256
" autocomplete ctrl-n colors
hi Pmenu ctermfg=220 ctermbg=238 guibg=#511151
hi PmenuSel ctermfg=lightyellow ctermbg=brown guibg=#333388
hi PmenuSbar ctermbg=6
hi PmenuThumb ctermfg=3
"
" colorscheme molokai
" let g:molokai_original = 1
"
""" better visual selection
hi Visual ctermbg=238

""" -------------------------------------------
"""         cursorline
""" -------------------------------------------
" set cursorline
" hi CursorLine cterm=NONE ctermbg=234 guibg=NONE
" set nonumber

""" -------------------------------------------
"""         airline/statusline
""" -------------------------------------------
" turn on status line always
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#syntastic#enabled = 1
" let g:airline#extensions#tagbar#enabled = 1

" let g:airline_theme = 'powerlineish'


""" cos innego
" wplywa na multipolcenie taloe jak leader \ev \es \s
set timeoutlen=1000

""" -------------------------------------------
"""         leader
""" -------------------------------------------
" let mapleader = ","
" let mapleader = " " - zmiast tego musze uzywac tych dwoch lini ponizej, zeby
" macvim nie czekaj na spacje po wcisnieciu
" http://superuser.com/questions/693528/vim-is-there-a-downside-to-using-space-as-your-leader-key
let mapleader = "\\"
map <space> \
" nmap , <space> # second leader key ! lepiej nie zeby sie odzwyaczic

""" -------------------------------------------
"""          hidden allow edited buffers
""" -------------------------------------------
set hidden

""" -------------------------------------------
"""         clibboard (global buffer integration)
""" -------------------------------------------
if has("mac")
    set clipboard=unnamed
elseif has("unix")
    set clipboard=unnamedplus
elseif has("win32")
  " do stuff under windows "
  " ???
endif





""" -------------------------------------------
"""         Python
""" -------------------------------------------

"""--------- pythonmode
let g:pymode_motion = 1
let g:pymode_doc = 0
let g:pymode_folding = 0
" flakes + write dziala dosc szybko ale nie wykrywa wszystkich bledow let
let g:pymode_indent = 0 
let g:pymode_lint = 1
let g:pymode_rope = 0
" Show error message if cursor placed at the error line  *'g:pymode_lint_message'*
let g:pymode_lint_message = 0
" on save
" Check code on every save (if file has been modified)  *'g:pymode_lint_on_write'*
let g:pymode_lint_on_write = 0
" Check code on every save (every)                    *'g:pymode_lint_unmodified'*
let g:pymode_lint_unmodified = 0
" Check code when editting (onfly)                        *'g:pymode_lint_on_fly'*
let g:pymode_lint_on_fly = 0

" Default code checkers (you could set several)         *'g:pymode_lint_checkers'*
" Values may be choosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.
let g:pymode_lint_checkers = ["pyflakes"]
" let g:pymode_lint_checker = "pylint"
let g:pymode_lint_signs = 0
let g:pymode_lint_config = 'pylint.rc2'
    

let g:pymode_options_max_line_length = 0

" PyMode Syntax Highlight
"
let g:pymode_syntax = 1 
let g:pymode_syntax_all = 0 
" 
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_builtin_types = 0
let g:pymode_syntax_doctests = 0 
let g:pymode_syntax_highlight_equal_operator = 0
let g:pymode_syntax_highlight_exceptions = 0
let g:pymode_syntax_highlight_self = 0
let g:pymode_syntax_highlight_stars_operator = 0
let g:pymode_syntax_indent_errors = 0
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_syntax_string_format = 0 
let g:pymode_syntax_string_formatting = 0 
let g:pymode_syntax_string_templates = 0

" For fast machines
" let g:pymode_syntax_slow_sync = 0
" overwrite
" -----------------------------------------------------
"
" pylint dziala lepiej ale jest zawolny na przy kazdym zapisie
let g:pymode_utils_whitespaces = 0
" auto jump on/off
let g:pymode_lint_jump = 1
let g:pymode_lint_ignore = 'W402,W0611,C0324,W0612,W0511,C0323,W0622,C0302,W806,C0322,R0921,R0914,W0101,W801,W0404'
"let g:pymode_lint_select = 'E0611'
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = '<leader>ib'
let g:pymode_run = 0
let g:pymode_virtualenv = 1
"let g:pymode_run_key = '<leader>r'

""" -------------------------------------------
"""         Python (mappings)
""" -------------------------------------------
function! PythonMappings()
	nmap <buffer> <leader>ip ofrom IPython import embed;embed()<ESC>:w<cr>
    " uzytecznosc mala przez !brak screen!
	" nmap <buffer> <leader>iP ofrom vipdb import embed;embed()<ESC>:w<cr> "
	" ipython debug 
	nmap <buffer> <leader>id oimport ipdb;ipdb.set_trace()<ESC>:w<cr>
	nmap <buffer> <leader>iv oimport vipdb;vipdb.set_trace()<ESC>:w<cr>
	nmap <buffer> <leader><c-l> :PymodeLint<cr>
    nmap <buffer> <leader>L :call Flake8()<cr>
	" " pudb debugger
	" nmap <buffer> <leader>iu o<esc>Simport pudb;pudb.set_trace()<ESC>:w<cr>
	"" fix na diff doget - z brancha johntyree python-mode
	" ounmap <silent> <buffer> o
	"" python run
	nmap <buffer> <F9> :silent up\|QuickRun -split 10<cr>
    vmap <buffer> <F9> :QuickRun -split 10<cr>
	" map <F9> :up<bar>!/usr/bin/env python %<CR>
	map <leader><F9> :up<bar>!/usr/bin/env python %  
	map <buffer> <F10> :up<bar>Pytest file<cr>
	map <buffer> <s-F10> :up<bar>Pytest function<cr>
	map <buffer> <m-F10> :up<bar>Pytest method<cr>
	map <buffer> <c-F10> :up<bar>Pytest class<cr>
    "
    " map <leader>g :RopeGotoDefinition<cr>
    " works badly
    " inoremap <silent> <buffer> <tab> <C-R>=RopeCodeAssistInsertMode()<CR>
    "
    compiler python
    " wytlacz elcim i signs

    " terminal test
    " TESTY OFF
    " nmap <silent> <leader>tt :w<bar>call VimuxOpenRunner()<bar>call VimuxSendText("nosetests -v -d -s <c-r>%:<c-r>=tagbar#currenttag('%s','', 'f')<cr>")<bar>call VimuxSendKeys("enter")<cr>

    " termianal python 
    map <leader>tp :up<bar>py sendtmux("python <c-r>%")<cr>
    map <leader>ti :up<bar>py sendtmux("ipython -i <c-r>%")<cr>

    """ -----------------------------
    """ Python python functions
    """ -----------------------------
    " original version 
    " nmap <leader>ty :compiler! python<cr>:set makeprg=./run_tests.py\ <c-r>=tagbar#currenttag('%s','')<cr><cr>:Make<cr>
    if !has('python3')
py <<EOF
last_test_tag = None
from vim import eval as e
from vim import command as c
def _make_test(tag):
    c(':up')
    c(':compiler! python')
    c(r":set makeprg=XTB\=off\ ./run_tests.py\ %s"%tag)
    c(':Make')

def make_current_test():
    'run current tag in Make'
    global last_test_tag
    last_test_tag = e("tagbar#currenttag('%s','')")
    _make_test(last_test_tag)

def make_last_test():
    'rerun last runned test'
    if not last_test_tag:
        return
    _make_test(last_test_tag)

EOF
    endif

    """ Testing
    " terminal yank test
    """" nmap <leader>ty :py make_current_test()<cr>
    " terminal global test
    """" nmap <leader>tg :py make_last_test()<cr>

    " termianl yank all tests
    nmap <leader>tY :compiler! python<cr>:set makeprg=./run_tests.py<cr><cr>:Make<cr>

    """ next method remaping
    nmap ]m ]M
    nmap [m [M


    "" jedi rename (mapping by hand because, we want <leader>r as rerun
    nnoremap <silent> <buffer> <localleader>R :call jedi#rename()<cr>
	nmap <buffer> <leader>r :up<bar>:py sendtmux('c-p')<cr>
endfunction
au FileType python call PythonMappings()

""" -------------------------------------------
"""         Python disassembled
""" -------------------------------------------
au BufRead,BufNewFile *.pyc_dis set filetype=python

""" flake8 vim - F7 or L
let no_flake8_maps=1

""" -------------------------------------------
"""         XML mappings
""" -------------------------------------------
function! XMLMappings()
    vmap <buffer> gq :!xmllint --format -<cr>
endfunction
au FileType xml call XMLMappings()

""" -------------------------------------------
"""         RUBY
""" -------------------------------------------
function! RubyMappings()
	""" binding pry 
	nmap <buffer> <leader>ip obinding.pry<ESC>:w<cr>
	""" ruby run
	nmap <buffer> <F9> :up\|!ruby %<cr> 
	imap <buffer> <F9> <Esc><f9>
	nmap <buffer> <leader><F9> :up\|!ruby % 
    
    """ navgigation goto
    " map <leader>g <C-]>
    nmap gd <C-]>
endfunction
au FileType ruby call RubyMappings()

" ruby/thor
au BufRead,BufNewFile *.thor set filetype=ruby

""" -------------------------------------------
"""         Golang
""" -------------------------------------------
function! GoMappings()
	" nmap <buffer> <leader>r <f9>
	nmap <buffer> <leader>R :GoRename<cr>


    """ running & building
	" nmap <buffer> <F9> :up\|!go run %<cr> 
	nmap <buffer> <F9> :silent up\|QuickRun -split 5<cr>
	imap <buffer> <leader><F9> :GoRun<cr>
    
    """ testing 
	nmap <buffer> <F10> :up<bar>GoBuild<cr>
	nmap <buffer> <leader><F10> :up<bar>GoTest<cr>

    """ running in terminal
	""" selected file
    map <buffer> <leader>tu :up<bar>:py sendtmux("go test -v")<cr>
	""" all tests
    map <buffer> <leader>tU :up<bar>:py sendtmux("go test -v -run '%s$'"%current_test())<cr>
	"" run
    map <buffer> <leader>tp :up<bar>:py sendtmux("go run ./<c-r>%")<cr>
    """ navgigation goto
    " map <leader>g <C-]>
    " nmap gd <C-]> # depracted by vim-godef

    nmap <buffer> K :GoDoc<cr>

    " compiler go

    " autocmd FileType go autocmd BufWritePre <buffer> Fmt
    
    " make supertab works better
    " let g:SuperTabDefaultCompletionType = "context"
	""" just works for go
	" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
	""" context version (works for comments/files etc...)
	let g:SuperTabDefaultCompletionType = "context"
	let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
	" tstsss
  let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
	let g:SuperTabDefaultCompletionType = 'context'
	autocmd FileType *
	  \ if &omnifunc != '' |
	  \   call SuperTabChain(&omnifunc, "<c-p>") |
	  \ endif



    nnoremap <buffer> <Leader>A :exe 'GoImport ' . expand('<cword>')<CR>

    " test current pkg
    " nmap <leader>tt :up<bar>GoTest<cr>

    " nmap <silent> <leader>m :up\|make<cr>

    nmap <buffer> <leader>w :silent up<cr>

    " automatic import
    nmap <leader>a :GoImports<cr>:up<cr>


    " based on:
    " /home/dev/dotfiles/.vim/bundle/vim-go/ftplugin/go/commands.vim:60
    " go def vertical
    nmap <buffer> <c-w>d <Plug>(go-def-vertical)
    nmap <buffer> gD <Plug>(go-def-vertical)
    " go def horizontal
    nmap <buffer> <leader>gd <Plug>(go-def-split)

    " command! -nargs=* -range GoDefVsplit :call go#def#JumpMode("vsplit")
    " nmap <silent> gD :GoDefVsplit<cr>
    nmap <buffer> <leader>K <Plug>(go-doc-browser)

    " calles/usage
    nmap <buffer> <leader>z :GoImplements<cr>
    nmap <buffer> <leader>Z :GoCallees<cr>

    " syntastic active mode - now I can disable Syntastic with ToggleMode
    " takes to much time during drv/test cycle
    " let g:syntastic_mode_map = { 'mode': 'active' }

    nmap <buffer> <leader>f "myiwh/<c-r>m<cr>:GoInfo<cr>
    nmap <buffer> <leader>F "myiwh/<c-r>m<cr>:GoDescribe<cr>



    nmap <buffer> <leader>H :GoReferrers<cr>

    set path=,,$GOPATH/src
    " set path=$GOPATH/src

    " hiper dubugging with go
    map <buffer> <Leader>ti :py startgdb()<cr>
    map <buffer> <Leader>tk :py gdbrun()<cr>

endfunction
au FileType go call GoMappings()

""" -------------------------------------------
"""         Shell
""" -------------------------------------------
function! ShMappings()
  " works best
  let g:SuperTabDefaultCompletionType = "<c-x><c-n>"

  " works with tmux-complete
  " let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

  """"""""""""""" TRASH
  " let g:SuperTabDefaultCompletionType = "context"
  " let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
    " make supertab works better
	""" just works for go
	" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
	""" context version (works for comments/files etc...)
	" let g:SuperTabDefaultCompletionType = "context"
	" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
	" " tstsss

endfunction
au FileType sh call ShMappings()


"----------------------------- OTHER hacks
""" save shift (lost repeat of t,f,T,F)
noremap ; :
"nnoremap : ;

""" delaing with .vimrc
" config edit/run
noremap <leader>ce :e $MYVIMRC<CR>
noremap <leader>cr :so $MYVIMRC<CR>

""" quickfix window navigation
nnoremap ]q :execute "try \n cnext \n catch \n try \n cfirst \n catch \n cc \n endtry \n endtry"<cr>
nnoremap [q :execute "try \n cprevious \n catch \n try \n clast \n catch \n cc \n endtry \n endtry"<cr>

""" location window navigation
nnoremap ]l :execute "try \n lnext \n catch \n  lfirst \n endtry"<cr>
nnoremap [l :execute "try \n lprevious \n catch \n  llast \n endtry"<cr>

" S for subsitute inner word from yanked text
" change inner word and in insert mode yank from " and exit inster mode :)
nnoremap <leader>s "_ciw<c-r>"<esc>
vnoremap <leader>s "_dP

" numberlines toggle
nnoremap <leader>n :set invnumber<cr>
" wrap toggle
nnoremap <leader>N :set invwrap<cr>

""" -------------------------------------------
" put line after Ctrl-Shift-P
" http://stackoverflow.com/questions/1346737/how-to-paste-in-a-new-line-with-vim
""" -------------------------------------------
nnoremap <leader>p :put<cr>
 

""" ---------------------- paster for pasting from other windows !!!!!!!!!!!!!!
nnoremap <leader>P :set paste!<cr>

" quickfixclear
" nmap <leader>qc :QuickFixClear<cr>

""" -------- Standard options
""" wrap lines
" set showbreak=↪

""" --------------------------------------------
" invisiable characters like tabs and etcjj
" http://vim.wikia.com/wiki/See_the_tabs_in_your_file
""" --------------------------------------------
" set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Display incomplete commands below the status line
set showcmd
set nonumber
set wrap
"set paste
set comments=

""" search
set incsearch
set smartcase
set ignorecase
" highlight search
set hlsearch
" highlight search reset
map <leader>/ :nohlsearch<cr>
"<bar>QuickFixClear<cr>:SignClearAll<cr>
set gdefault   " Use global search by default
"
"
" search search raw text plain
" http://vim.wikia.com/wiki/Searching_for_expressions_which_include_slashes
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '/\')|normal! /<C-R>/<CR>

" visual search selected text
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
" vnoremap // y/<C-R>"<CR>"
vnoremap // y:SS <C-R>"<CR>


" delete without yank
" nmap <silent> <leader>d "_d
" vmap <silent> <leader>d "_d

""" move between windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h


""" wciecia
set autoindent
"set smartindent
set smarttab
set expandtab 
set tabstop=4 
set shiftwidth=4 
set softtabstop=4

au FileType sh set ts=2 sw=2 sts=2 smartindent expandtab
au FileType ruby set ts=2 sw=2 sts=2
au FileType html set ts=2 sw=2 sts=2 nocindent
au FileType python set ts=4 sw=4 sts=4
au FileType mkd set shiftwidth=2
au FileType yaml set ts=2 sw=2 sts=2 noautoindent nosmarttab
au FileType cpp set ts=2 sw=2 sts=2 noexpandtab
au FileType c set ts=2 sw=2 sts=2 noexpandtab
au FileType go set ts=4 sw=4 sts=4 noexpandtab

""" wyjscie z trybu insert przez wpisanie dwa razy jj
inoremap jj <ESC>

""" Backspace fix
set backspace=indent,eol,start


""" ------- NerdTree
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <leader><F2> :NERDTreeFind<CR>
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 0
" set Enter/Return to activate a node
let NERDTreeMapActivateNode='<CR>'
" always change CWD
let NERDTreeChDirMode = 2
" more colors 
let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen = 0
let NERDTreeIgnore = ['\.pyc$', '\~$', '\.o$']

let NERDTreeMouseMode = 3

""" -------- Ctags
map <F8> :!ctags -f .tags --verbose=no --totals=yes --recurse=yes --exclude=tmp --exclude=build --exclude='boost*' --exclude='glog*' . <cr>
map <leader><F8> :!mkdir -p .tags;cd .tags;ctags -f tags --languages=HTML,Java,JavaScript,Python,Ruby,Go --totals --verbose=no --recurse=yes --exclude=tmp --exclude=build --exclude=dbmigrate --fields=zK .. <cr>
" au FileType python map <F8> :!ctags -f .tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp . <cr>
au FileType python map <F8> :!mkdir -p .tags;cd .tags;ctags -f ._tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK ..;fgrep -v kind:variable ._tags >tags;rm ._tags<cr>
" au FileType cpp map <F8> :!mkdir -p .tags;cd .tags;ctags -f tags --languages=C++ --verbose=no --totals --recurse=yes --exclude=tmp --exclude=tmp --exclude=build --exclude=boost* --exclude=glog* ..<cr>
au FileType ruby map <F8> :!mkdir -p .tags;cd .tags;ctags -f tags --languages=Ruby --langmap=Ruby:.rb.thor --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK .. <cr>
au FileType haskell map <F8> :!regenerate-haskell-tag.sh<cr>
" au FileType go map <F8> :!ctags -f .tags --languages=Go --totals --verbose=no --recurse=yes --exclude=tmp --exclude=build --exclude=dbmigrate --exclude=Godeps . <cr>
au FileType go map <F8> :!gotags -R -f .tags \.<cr>
" au FileType haskell let g:ctrlp_buftag_ctags_bin = '/home/ppalucki/.cabal/bin/hothasktags'
"
""" tags file
" specjalnie nizej w podkatalogu aby nie psulo mi wyszukiwania w pycharmie
set tags=.tags/tags,.tags
"set tags+=./.tags
"set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
"set tags+=$HOME/.vim/tags/python.ctags

let g:ctrlp_buftag_types = {
\'haskell' : {
  \ 'bin': '/home/ppalucki/.cabal/bin/lushtags',
  \ 'args': 'f --'
  \ },
\ }

" \'go' : {
"   \ 'bin': '/Users/ppalucki/work/go/bin/gotags',
"   \ 'args': ''
"   \ },

""" HaskMappings
function! HaskellMappings()
	map <F9> :!ghc %<cr>

    " termianal python 
    map <leader>tp :up<bar>call ScreenShellSend("runhaskell <c-r>%")<bar><cr>

endfunction
au FileType haskell call HaskellMappings()
" let g:riv_link_cursor_hl=0



"" repeat last command
" map <leader>r @:

""" rest doc riv run 
function! RstMappings()
	map <F9> :up<bar>!cd ..;make html<cr>
	map <leader><F9> :up<bar>!cd ..;make clean html<cr>
	""" fix of italic overbold!
	highlight rstEmphasis cterm=NONE ctermfg=3
endfunction
au FileType rst call RstMappings()
" let g:riv_link_cursor_hl=0

" --------------------------- spell
" fix na spell, ze spellcap mi nie oznacza eelementow, ktore maja nie poprawne
" skladanie (duza litera na poaczatku)
highlight SpellCap ctermbg=None
highlight SpellBad term=reverse cterm=bold ctermfg=16 ctermbg=208 gui=bold guifg=#000000 guibg=#FD971F
" fixnij za pomoca pierwszego dopasowania
nmap z9 1z=

""" ------  Last position
"This autocommand jumps to the last known position in a file just after
"opening it, if the '"' mark is set:
"wg :h last-postion-jump
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"
" improved version from 
" from:
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" function! ResCur()
"   if line("'\"") <= line("$")
"     normal! g`"
"     return 1
"   endif
" endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call setpos(".", getpos("'\""))
augroup END

""" ------ sudo write
command! W w !sudo tee % > /dev/null

""" tagbar
map <leader><F3> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_width = 80

""" ----- fuzzyfinder
" map <F3> :FufBufferTag<CR>
" map <F4> :FufMruFileInCwd<CR>
" map <leader><F4> :FufMruFile<CR>
" map <F5> :FufBuffer<CR>
" map <leader><F5> :FufQuickfix<CR>
" map <F6> :FufFile<CR>
" map <leader><F6> :FufCoverageFile<CR>
" map <F7> :FufTag!<CR>
" map <leader><F7> :FufTag<CR>
" map <leader>o :FufJumpList<CR>
" let g:fuf_modesDisable = [ 'mrucmd', ]
" let g:fuf_coveragefile_globPatterns = ['**/*.rb', '**/*.erb', '**/*.haml', '**/*.html', '**/*.xml', '**/*.js', '**/*.sh', '**/*.py', '**/*.yml', 'Gemfile', '**/*.thor', '**/*.rake', '**/*.yaml', '**/signed_curl', '**/*.rst', '**/*.json', '**/*.java', '**/*.xhtml', '**/*.sql']
" let g:fuf_maxMenuWidth = 240
" let g:fuf_ignoreCase = 1
" let g:fuf_mrufile_maxItem = 6000
" let g:fuf_mrufile_maxItemDir = 1500
" let g:fuf_learningLimit = 5000
" let g:fuf_autoPreview = 0

""" ----- mouse
""" wiecej szkody z myszki niz pozytku
" set mouse=nvih
set mouse=
set ttymouse=xterm2
set nomousehide

""" ----- grep (plugin) 
" let Grep_Default_Filelist = '*.rb *.py *.html *.erb *.js *.sh *.thor *.rake *.yaml'
" let Grep_Default_Options = '-i'
" let Grep_OpenQuickfixWindow = 1
" let Grep_Skip_Dirs = 'tmp'
" let Grep_Shell_Escape_Char = '\'
"NOT USED
"



""" -------------------------------------------
"""         ack-grep
""" -------------------------------------------

let g:ack_use_dispatch = 0
let g:ack_autofold_results = 0
""" siler searcher
" let g:ackprg = 'ag --nogroup --nocolor --column'
"" requires new version
" let g:ackprg = 'ag --vimgrep'
"" new version supports this 0.31 but not .ackrc
" ag wont support things liks --python --cc and my .ackrc
"
"map <leader><F6> :Rfgrep<CR> map <leader>h :Rfgrep<cr> map <leader>h :Ack
"--py Ack bez jumpa
map <leader>h "ayiw:Ack! -- "<C-r>a"
vmap <leader>h "ay:Ack! -- "<C-r>a"
map <leader>H "ayiw:Ack! --known-types -- "<C-r>a"
vmap <leader>H "ay:Ack! --known-types -- "<C-r>a"

au FileType python map <buffer> <leader>h "ayiw:Ack! --python -- "<C-r>a"
au FileType python vmap <buffer> <leader>h "ay:Ack! --python -- "<C-r>a"
au FileType ruby map <buffer> <leader>h "ayiw:Ack! --ruby -- "<C-r>a"
au FileType ruby vmap <buffer> <leader>h "ay:Ack! --ruby -- "<C-r>a"
au FileType rst map <buffer> <leader>h "ayiw:Ack! --rst -- "<C-r>a"
au FileType rst vmap <buffer> <leader>h "ay:Ack! --rst -- "<C-r>a"
au FileType cpp map <buffer> <leader>h "ayiw:Ack! --cpp --cc -- "<C-r>a"
au FileType cpp vmap <buffer> <leader>h "ay:Ack! --cpp --cc -- "<C-r>a"
au FileType c map <buffer> <leader>h "ayiw:Ack! --cpp --cc -- "<C-r>a"
au FileType c vmap <buffer> <leader>h "ay:Ack! --cpp --cc -- "<C-r>a"
""" have to be more intelignejt - looking na all files or just selected on
" ignore search in --no-testgo files - if you want all just do H
au FileType go map <buffer> <leader>h "ayiw:Ack! --no-testgo --go -- "<C-r>a" 
au FileType go vmap <buffer> <leader>h "ay:Ack! --no-testgo --go -- "<C-r>a" 

" Ack z jumpa
" map <leader>H yiw:Ack! "<C-r>""
" vmap <leader>H y:Ack! "<C-r>""
" au FileType python map <leader>H yiw:Ack --python "<C-r>""
" au FileType python vmap <leader>H y:Ack --python  "<C-r>""
" au FileType ruby map <leader>H yiw:Ack --ruby "<C-r>""
" au FileType ruby vmap <leader>H y:Ack --ruby "<C-r>""
"

"grouping and folds - check the vim ~/.vim/ftplugin/qf_fold.vim
"a
"
" zle bo sie samo unfolduje!!!
" let g:ack_autofold_results = 1
highlight Folded ctermfg=green 


"
"
"
"
""" -------------------------------------------
""" Search ^ Replace multiple files
""" -------------------------------------------
" http://stackoverflow.com/questions/4792561/how-to-do-search-replace-with-ack-in-vim/4793316#4793316
" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

" Function that does the work
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as 
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction
"
"
""" Search and replace
" http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim/5686810#5686810
" replace in many buffers after <leader>f (last searched element)
nmap <leader>Y :QFDo %s/<C-r>a//gc<left><left><left>

""" -------------------------------------------
""" Search ^ Replace in single files
""" -------------------------------------------
" replace normal mode with last searched element elmenet
nmap <leader>y :.,$s///gc<left><left><left>
" replace last search element ("/ register) in given selection
vmap <leader>y :s///gc<left><left><left>
" or manual procedure
" ---------- manual --------------
" Put the cursor on foo.
" Press * or f (follow) to search for the next occurrence.
" Type ciw (change inner word) then bar then press Escape.
" Press n (move to next occurrence) then . (repeat change).
" Repeat last step
" OR BETTER new way!
" cgn then . or n



""" ---- saveall shortcut
map ZA :wall<CR>
map ZW :qa<CR>
""" write/quit
" aka ZZ
map <leader>w :up<CR>
map <leader>W :w!<CR>
map <leader>q :q<CR>
" aka ZQ
map <leader>Q :q!<CR>


""" VCS (git bzr)
"vimdiff current vs git head (fugitive extension)
nnoremap <Leader>vd :Gdiff<cr>
"switch back to current file and closes fugitive buffer
nnoremap <Leader>vD :diffoff!<cr><c-w>h:bd<cr>
nnoremap <Leader>vs :Gstatus<cr>
nnoremap <Leader>vc :Gcommit --verbose<cr>
nnoremap <Leader>va :Gcommit --amend<cr>
" log current file
nnoremap <silent> <Leader>vl :Gllog -n 50<cr>
" last 10 commits
nnoremap <Leader>vL :Gllog -n 50 --<cr>
" use lopen to list
" gblame
nnoremap <Leader>vb :Gblame<cr>
vnoremap <Leader>vb :Gblame<cr>

" aka vim fetch&merge
nnoremap <Leader>vm :Git pull<cr> 
nnoremap <leader>vp :Git push<cr>
nnoremap <leader>vw :Gwrite<cr>
nnoremap <leader>vr :Gread<cr>

""" ---- buffers
" buffer write delete
map <leader>bw :w<bar>BD<cr>
" buffer delete
map <leader>bd :BD<cr>
" close all but this one (and not saved!)
map <leader>bo :BufOnly<cr>

" buffer next/previous
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>

""" yaml
au BufRead,BufNewFile user_data set filetype=yaml

""" json - vim-json used for json
" autocmd BufNewFile,BufRead *.json set ft=javascript
" autocmd BufNewFile,BufRead *.json set ft=javascript
au FileType json set foldmethod=syntax
au FileType json set foldlevel=100

" aci/appc/rkt manifest and pod are json files
au BufRead,BufNewFile manifest set filetype=json
au BufRead,BufNewFile pod set filetype=json

let g:vim_json_syntax_conceal = 0

""" ConqueTerm
let g:ConqueTerm_ReadUnfocused = 1

""" pi_paren
" bez oznaczania nawiasow
let loaded_matchparen = 1
" NoMatchParen
set noshowmatch

""" disable fold
au FileType rst set nofoldenable
au FileType vim set nofoldenable
" au FileType rst :NoMatchParen

" set nofoldenable
au FileType python set nofoldenable
au FileType python set foldmethod=manual
"
" au FileType python :NoMatchParen
" au FileType go :NoMatchParen

""" RIV
let g:riv_fold_auto_update = 0
let g:riv_web_browser = "google-chrome"
let docs_tv = { 'path': '~/workspace/getmedia/docs_tv/source', 'build_path': '~/workspace/getmedia/docs_tv/build'}
let g:riv_projects = [docs_tv]


""" swap files
" insert mode bash style
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" cmdline-editing bash style
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
" alt-p, alt-n history search
cnoremap p <Up>
cnoremap n <Down>

" hist like ctrl+p/ctrl+n
" cnoremap <C-j> <t_kd>
" cnoremap <C-k> <t_ku>

" history
" Useful settings
set history=700
set undolevels=700

" set noswapfile

" slowness fix!!!
au FileType ruby set nocursorline
set foldmethod=manual 
au FileType rst set nocursorline

set nofoldenable

" ----------------------------------------- JAVA ECLIM
function! JavaMapping()
    " ----------- run
    "- Executes the java using your project's main class.
    nmap <F9> :w<bar>:Java<cr>
    imap <F9> <Esc><F9>
    map <leader><F9> :Java

    " ------------ javadoc
    nnoremap <buffer> <leader>k :JavaDocPreview<cr>
    nnoremap <buffer> <leader>K :JavaDocSearch -x declarations<cr>

    " ----------- search
    " java go
    "- Perform a context sensitive search for the element under the cursor.
    " nnoremap <buffer> <leader>g :JavaSearchContext<cr>
    nnoremap <buffer> gd :JavaSearchContext<cr>
    "[-p <pattern>] [-t <type>] [-x <context>] [-s <scope>] - Search for
    "classes, methods, fields, etc.  (With pattern supplied, searches for the
    "element under the cursor).  nnoremap <leader>js :JavaSearch

    " ------------ create
    " Create a java bean getter method.  nnoremap <leader>jg :JavaGet<cr>
    " Create a java bean setter method.  nnoremap <leader>js :JavaSet<cr>
    " Create both a java bean getter and setter method.
    nnoremap <leader>jg :JavaGetSet<cr>
    " Creates class constructor, either empty or based on selected class "fields.
    noremap <leader>jc :JavaConstructor<cr>

    " ------------ view
    "- View the type hierarchy tree.
    nnoremap <leader>jh :JavaHierarchy<cr>
    "- View implementable / overridable methods from super classes and implemented interfaces.
    nnoremap <leader>jim :JavaImpl<cr>
    "- View list of methods that delegate to the field under the cursor.
    nnoremap <leader>jd :JavaDelegate<cr>

    " --------- junit
    " [testcase] - Allows you to execute junit test cases.
    nnoremap <leader>ju :JUnit
    " Attempts to find the corresponding test for the current source file.
    nnoremap <leader>juf :JUnitFindTest<cr>
    " Similar to :JavaImpl, but creates test methods.
    nnoremap <leader>jui :JUnitImpl<cr>
    "[testcase] - Allows you to view the results of a test case.
    nnoremap <leader>jur :JUnitResult

    " ----------- import
    "- Import the class under the cursor.
    nnoremap <leader>ji :JavaImport<cr>
    "- Import undefined types, remove unused imports, sort and  imports.
    nnoremap <leader>jio :JavaImportOrganize<cr>

    " ------------ correct
    "- Suggest possible corrections for a source error.
    nnoremap <leader>ja :JavaCorrect<cr>



    " ------------refactoring (rename/move)
    "[new_name] - Rename the element under the cursor.
    nnoremap <leader>jr :JavaRename
    "[new_package] - Move the current class/interface to another package.
    nnoremap <leader>jm :JavaMove

    " ----------- java doc update
    "- Adds or updates the comments for the element under the cursor.
    nnoremap <buffer> <leader>jdc :JavaDocComment<cr>

    " ------------- class path
    "[-d <delim>] - Echos the project's classpath delimited by the system path
    "separator or the supplied delimiter.  nnoremap <leader>jc :JavaClasspath
    "-d \n<cr>
    " - List known JDK/JRE installs.
    nnoremap <leader>jli :JavaListInstalls<cr>

    " --------- format
    "- Formats java source code.
    noremap <buffer> <leader>jf :JavaFormat<cr>

    " --------------- javadoc generation
    "[file, file, ...] - Executes the javadoc utility against all or just the supplied source files.
    "jd zajete przez javadelegate
    " nnoremap <leader>jd :Javadoc

    " --------------- config
    " super tab for java uses user completetions
    let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

    " eclim
    let g:EclimJavaSearchSingleResult = "edit"
    let g:EclimJavaCompleteCaseSensitive = 1
endfunction
au FileType java call JavaMapping()

"
""" ------------------ scala ------------
function! ScalaMapping()
    let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
    " map <leader>g :ScalaSearch<cr>
    map gd :ScalaSearch<cr>
endfunction
au FileType scala call ScalaMapping()
let g:EclimScalaSearchSingleResult = 'edit'

""" ECLIM
let g:EclimPythonValidate = 0
let g:EclimShowErrors = 1
" let g:EclimSignLevel = 0

"
"
""""""""""""" spell
set spellcapcheck=0

"""""""""""" modeline
set modeline

"""""""""""" mkd - markdown & textile


" extension md as markdown filetype
au BufRead,BufNewFile *.md set filetype=markdown
" surround with asterisk
" bold/em
au FileType markdown set nofoldenable
" au FileType mkd nmap <leader>e ysiw*
" au FileType mkd vmap <leader>e S*
" au FileType mkd nmap <leader>E ,el,e
" au FileType mkd vmap <leader>E ,el,e
"
" au FileType mkd nmap ds* F*xf*xb
"
" au FileType mkd hi htmlItalic term=bold cterm=bold gui=bold ctermfg=231
" au FileType mkd hi htmlBold term=bold cterm=bold gui=bold ctermfg=229
"
" au FileType mkd hi htmlItalic term=bold cterm=bold gui=bold ctermfg=231
" au FileType mkd hi htmlBold term=bold cterm=bold gui=bold ctermfg=229

" zwykly markdowna
au FileType markdown hi htmlItalic term=bold cterm=bold gui=bold ctermfg=231
au FileType markdown hi htmlBold term=bold cterm=bold gui=bold ctermfg=229

au FileType markdown hi htmlItalic term=bold cterm=bold gui=bold ctermfg=231
au FileType markdown hi htmlBold term=bold cterm=bold gui=bold ctermfg=229

" nie chcemy widziec bledow markdown np. xxx_xxx_xxx
au FileType markdown hi link markdownError NONE

" surround with * (normal end visual mode)
au FileType markdown nmap <leader>e ysiw*
au FileType markdown vmap <leader>e S*

au FileType markdown nmap <leader><c-e> ysiw`
au FileType markdown vmap <leader><c-e> S`

au FileType markdown nmap <leader>E <leader>el<leader>e
au FileType markdown vmap <leader>E <leader>el<leader>e
" delete surround'ing 
au FileType markdown nmap ds* F*xf*xb

" testtile
au FileType textile nmap <leader>e ysiw*
au FileType textile vmap <leader>e S*
au FileType textile nmap <leader>E ,el,e
au FileType textile vmap <leader>E ,el,e
au FileType textile nmap ds* F*xf*xb

" zrob tabele |adsaa|asdfasd|asdfasdf| dla redmine na zaznaczonym obszarze!
" redmine TABLE
" au FileType textile vmap <leader>T :s/;/\|/g<cr>gv:norm A\|<cr>gv:norm I\|<cr>
" au FileType textile vmap <leader>C :s/,/\|/g<cr>gv:s/"//g<cr>gv:norm A\|<cr>gv:norm I\|<cr>
au FileType textile vmap <leader>T :!csv_to_redmine.py<cr>

""" ------ highlith identifiaction
""" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

""" kolorowanie przykladow w helpie 
hi helpExample ctermfg=Magenta

""" move parameter right
map <leader>m "qdt,dwep"qpb

""" gundo
map <leader>u :GundoToggle<CR>

" find occurences - search current word but without scroll
" follow
nmap <leader>f "myiwh/<c-r>m<cr>

" fix na colory diffa (change bez tla - bylo szare)
" sprawdz kolory: colortest -w -s (w bashu!)
hi DiffChange ctermbg=NONE
hi DiffDelete ctermbg=53
hi DiffAdd ctermbg=53
hi DiffText ctermbg=52 


""" ----- ultisnip
let g:UltiSnipsListSnippets = '<c-l>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "myultisnips"]
let g:UltiSnipsJumpBackwardTrigger = '<c-u>'
" 0 not working
let g:UltiSnipsEnableSnipMate = ""

""" ----- ctrlp
map <F3> :CtrlPBufTag<CR>
map <F4> :let g:ctrlp_mruf_relative=1<bar>CtrlPMRUFiles<CR>
map <leader><F4> :let g:ctrlp_mruf_relative=0<bar>CtrlPMRUFiles<CR>
map <F5> :CtrlPTag<CR>
map <F6> :CtrlPLine<CR>
map <leader><F6> :CtrlPBranch<CR>
map <F7> :CtrlPBuffer<CR>
" nmap <leader><F4> :CtrlPLine<cr>
" nmap <F6> :CtrlPChangeAll<cr>
" nmap <leader><F6> :CtrlPChange<cr>
" nmap <leader>o :CtrlPChangeAll<cr>
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v(\.(git|hg|svn|bzr))|(htmlcov)|(tmp)$',
	\ 'file': '\v(\.(exe|so|dll|pyc|orig|class|tex|png|gif|o))|(index|MERGE_MSG|COMMIT_EDITMSG)|(\.LOCAL\..*)$',
	\ }

" let g:ctrlp_switch_buffer = 'eT'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_exclude = '\v(\.git)'
let g:ctrlp_use_caching = 0

" ctrl tjump
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_only_silent = 1

" repeat last movement
noremap \ ;

" replast move command
let repmo_key = "\\"
let repmo_revkey = "<bar>"
" let g:repmo_mapmotions = "j|k h|l <C-E>|<C-Y> zh|zl ]c|[c ]]|[[ ]m|[m ]q|[q"
let g:repmo_mapmotions = "j|k h|l <C-E>|<C-Y> zh|zl"

" diff jump with ()
nn <expr> ( &diff ? "[c" : "("
nn <expr> ) &diff ? "]c" : ")"

" vsplit tag
nmap <leader><C-]> :vsplit <CR>:exec("tag ".expand("<cword>"))<CR>zt<c-w>r<c-w><c-w>
nmap <C-\> :split<CR>:exec("tag ".expand("<cword>"))<CR>

" swap ' with `
nnoremap ' `
nnoremap ` '

" set nonumber

" sorting - usefull for imports sorting
"" vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
" BETTER to user .
" vnoremap < <gv0 " better indentation
" vnoremap > >gv0  " better indentation

" autosource write of .vimrc
" autocmd! bufwritepost .vimrc source %

" easier formatting of paragraphs
"SLABO formatuje kod pyythona
" vmap Q gq
" nmap Q gqap
"
""" ------- AutoComplete fix
" set completeopt=longest,menu 
"" auto be jedi plugin
"
""""""""""" supertab
" let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabLongestEnhanced = 0
let g:SuperTabLongestHighlight = 1

" context with default - to most generic one (previos keyword)
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-p>"

" ----- previe/scratch when omnicomplete is used
" automaticly hide
let g:SuperTabClosePreviewOnPopupClose = 1
" disable complettly
set completeopt-=preview
set completeopt+=menu

" Settings for jedi-vim
" jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" TAB is reserved for omnifunc
" let g:jedi#autocompletion_command = "<tab>"
let g:jedi#auto_vim_configuration = 1
let g:jedi#goto_assignments_command = "<leader>d"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#usages_command = "<leader>z"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0

" Open last/alternate buffer
noremap <Leader><Leader> <C-^>
noremap <Leader><space> <C-^>

" Map Q to repeat the last recorded macro
" exmode sie czasem jednak przydaje - a jednak nie dziala jak chce (lepiej
" uzyc gQ
map Q @@

" undo-persistent
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" python import python_tag_import
let g:pythontagimportcurrentword = "<leader>a"
let g:pythontagimport_from = 1
let g:pythontagimport_from_mod = 0
let g:pythontagimport_as = 0
let g:pythontagimport_full  = 0
" let g:pythontagimport_prefix = 'getmedia.'

" yank current buffer filename to register
" http://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
" nmap cp :let @* = expand("%:p")<bar>let @+ = expand("%:p")<cr>
nmap cp :let @+ = expand("%:p")<cr>
" nmap cp :let @" = expand("%:p")<cr>

" xml syntax fix
hi link xmlTagName Identifier
hi link xmlTag Identifier
hi link xmlEntity String
hi link xmlEntityPunct String

" and xml folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Add the virtualenv's site-packages to vim path
let g:pymode_virtualenv = 1
" UWAGA: zeby dzialalo jedi ze zmiana interpretera
" trzeba zrobic linka
" (flask)~/.virtualenvs/flask/lib$ ln -s python3.3 python2.7
" poniewaz activate_this.py szukanie domylsnie katalogi site-packages w
" lib/python%VERSION/site-packages i wtedy go nie ma !
" OBA SA CHYBA POPSUTE!
" if !has('python3')
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
"     print 'activated: ', activate_this
" EOF
" 
" elseif has('python3')
" 
" py3 << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     # execfile(activate_this, dict(__file__=activate_this))
"     exec(open(activate_this).read(), dict(__file__=activate_this))
"     print('activated: ', activate_this)
" EOF
" 
" endif
"vimchat
" let g:vimchat_buddylistwidth = 30 "width of buddy list, default is 30
" let g:vimchat_logpath = path to store log files, default is ~/.vimchat/logs
" let g:vimchat_logchats = (0 or 1) default is 1 -- 0 will not log,
let g:vimchat_otr = 0 "(0 or 1) default is 0 -- enable otr or not
" let g:vimchat_logotr = (0 or 1) default is 1 -- log otr convos or not
let g:vimchat_statusicon = 0 "(0 or 1) default is 1 -- use a gtk status icon?
" let g:vimchat_blinktimeout = timeout in seconds, default is -1
" let g:vimchat_buddylistmaxwidth = max width of buddy list window, default ''
" let g:vimchat_timestampformat = format of the message timestamp, default "[%H:%M]"
" let g:vimchat_showPresenceNotification = notification if buddy changed status, comma-separated list of states, default ""
let g:vimchat_libnotify = 0

""" source vim file type 
au FileType vim :nmap <F9> :up<cr>:%y<bar>@"<cr>
au FileType vim :setlocal keywordprg=:help

""" example of python
if !has('python3')
py <<EOF
def testvima():
    import vim
    # print 'oto vim'
    # print vim.current.window
    # print vim.current.buffer
    print(vim.eval("tagbar#currenttag('%s','')"))
EOF
endif

nmap <leader>k :py testvima()<cr>

" vimroom
let g:vimroom_sidebar_height=0
" let g:vimroom_min_sidebar_width=100
let g:vimroom_background = "red"
let g:vimroom_width = 120

" """ -------------- Unite
" let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" " nnoremap ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap Ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
" " nnoremap Uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap Ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap Uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap Uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap Ue :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
" nnoremap Uc :<C-u>Unite -no-split -buffer-name=command  -start-insert command<cr>
" nnoremap Uf :<C-u>Unite -no-split -buffer-name=function  -start-insert function<cr>
" 
" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   " Play nice with supertab
"   let b:SuperTabDisabled=1
"   " Enable navigation with control-j and control-k in insert mode
"   " normal 
"   nmap <buffer> <ESC>      <Plug>(unite_exit)
"   nmap <buffer> <C-c>      <Plug>(unite_exit)
"   " insert
"   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"   imap <buffer> jj      <Plug>(unite_insert_leave)
"   imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
" endfunction

""" ------------- yankring
let g:yankring_replace_n_pkey = '<c-n>'
let g:yankring_replace_n_nkey = '<c-q>'



""" ------------------------------------------------------------
""" -------------------- debugging ------------------------------
""" ------------------------------------------------------------
if !has('python3')
py <<EOF

# def send_line(line):
#     'send line to screen'
#     c("call ScreenShellSend(%s)"%line)
# 
# def send_escape(s):
#     'escape line '
#     return "'"+s.replace("'", "''")+"'"
# 
# def send_text(txt):
#     'send lines to screen'
#     for l in filter(None, txt.split('\n')):
#         # print repr(l)
#         el = send_escape(l)
#         send_line(el)
import time, vim
import subprocess

def current_test():
    return vim.eval("tagbar#currenttag('%s','')")[:-2] # without ()

def current_file():
    return vim.eval("expand('%:t')")

def current_line():
    return vim.eval("line('.')")

def golang_gdbrun_test():
    sendtmux('run -test.run=%s'%current_test())

def golang_startgdb_test():
    sendtmux('export $( go test -work -c -gcflags "-N -l" -o test.test 2>&1 )')
    sendtmux('cgdb ./test.test -- -d $WORK')

def set_breakpoint():
    """ DEBUG - set breakpoint """
    # map <leader>tb :py sendtmux("b '%s'" % vim.eval('expand("%:p") . ":" . line(".")'))<cr>
    sendtmux('break %s:%s'%(current_file(), current_line()))

def gdb_adanvce():
    """ continue up to given location """
    sendtmux('advance %s:%s'%(current_file(), current_line()))

def open_or_edit(filename, line):

    def find_buffer(filename):
        for b in vim.buffers:
            if b.name == filename:
                return b

    # print repr(filename), repr(line)
    # and not filename.endswith('.pyc') and filename.endswith('.py')
    if filename is not None:
        line = int(line)
        buf = find_buffer(filename)
        if buf is not None:
            # print 'buf found', buf.number, 'going', line
            if vim.current.buffer.number != buf.number:
                # print 'switching', buf.number
                vim.command('buffer %s'%buf.number)
            vim.command(str(line))
            # vim.command('normal z.')
        else:
            # print 'tryin to open', filename, line
            vim.command('edit +%i %s'%(line, filename))

def loc():
    """ try to locate source file """
    # go to location
    try:
        #### IPDB STYLE
        ### requires vipdb to work
        import vipdb
        filename, line = vipdb.get_location()
        open_or_edit(filename, line)
    except ImportError:
        #### GDB STYLE
        # vim.command("silent! tmux set-buffer ':'")
        # moved as hook to ~/.gdbinit
        # sendtmux('''py gdb.execute("shell tmux set-buffer "+"'%i:%s'"%(gdb.newest_frame().find_sal().line, gdb.newest_frame().find_sal().symtab.filename))''')
        time.sleep(0.1)
        def exists(fn):
            return os.path.isfile(os.path.expanduser(fn))

        if not exists('~/.gdbinit') or not exists('~/.gdb.py'):
           raise Exception('ERROR: missing gdbinit & gdb.py installed fro gdb')
           return

        # if you are getting 'failed to connect to server' check if you are not running your exec with sudo!
        loc = subprocess.check_output(['tmux','show-buffer'])
        try:
            line, filename = loc.split(':')
        except ValueError:
            raise Exception('cannot split loc with : %r'%loc)

        
        if line and filename:
            open_or_edit(filename, line)
        else:
            print 'nothing found'

def debug_loc(cmd=None, lookup=True):
    """ send a command to terminal and then try to locate source file """
    
    if cmd is not None:
        if cmd=='jump':
            cmd = 'jump %s'%vim.eval("line('.')")

        # send command to tmux
        sendtmux(cmd, lookup=lookup)

    loc()


EOF

endif
" go cOntinue
nmap go :py debug_loc('continue')<cr>
" go next
nmap gn :py debug_loc('next')<cr>
" go step
nmap gs :py debug_loc('step')<cr>
" go end
nmap ge :py debug_loc('finish')<cr>
" go run
nmap gr :py debug_loc('run')<cr>
" go location
nmap gl :py loc()<cr>
" go up stack up 
nmap gu :py debug_loc('up', lookup=False)<cr> 
" go bottom aka down stack - down 
nmap gb :py debug_loc('down', lookup=False)<cr>
" go "end function" (until) (gi was reserverd for go last insert position)
nmap gj :py debug_loc('jump')<cr>
" nmap gc :call ScreenShellSend('continue')<cr>
nmap gp yiw:py sendtmux("print <c-r>"")<cr>
vmap gp y:py sendtmux("print <c-r>"")<cr>

nmap <leader>tb :py set_breakpoint()<cr>
" advance
nmap ga :py gdb_adanvce()<cr>

let g:COMMAND_MAP = {
    \ "hit" : "echo 'HIT'",
    \ "ls current dir" : "ls",
    \ }


""" Autoformat autopep8 options
" aggressive added
" -a means --aggressive 
" -a, --aggressive      enable non-whitespace changes; multiple -a result in more aggressive changes
let g:formatprg_args_expr_python='"/dev/stdin ".(&textwidth ? "--max-line-length=".&textwidth : "")." -a -a"'


""" diff
set diffopt=filler,vertical


""" -------------------------------------------
"""         syntastic
""" -------------------------------------------
" bindingi sa wczesniej
" L dla flake8
" c-l dla [pymode]
" l dla SyntasticCheck
nmap <leader>l :up<cr>:let b:syntastic_skip_checks=0<cr>:SyntasticCheck<Cr>
let g:syntastic_check_on_wq=0
let g:syntastic_quiet_messages = {'level': 'warrnings'}

" Syntastic wlaczony wylaczony
" let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_mode_map = { "mode": "passive",
                            \}
" zabardzo trwa na golonagu - jak checsz miec tylko aktive to przestaw sobie w
" GoMappings - i nie daje sie tego wylaczyc za pomoca SyntasticToggleMode
                           " \ "active_filetypes": ["go"]
                           
" tylko flake8 bo jest duzo duzo szybszy (dzieki pyflakes niz pylint)
" do tego mozna wlaczyc sobie mode:active ale nie pokazuje undefined etc...
let g:syntastic_python_checkers = ['python', 'flake8']
" let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_flake8_args="--config=tox.ini --ignore=E"
" python h ???
let g:syntastic_c_compiler_options = '-std=gnu99 `python-config --cflags --ldflags`'


""" -------------------------------------------
"""         trim white spaces
""" -------------------------------------------
"" Removes trailing spaces
function! TrimWhiteSpace() "{{{
    let cursor_pos = getpos('.')
    silent! %s/\s\+$//
    call setpos('.', cursor_pos)
endfunction "}}}
" nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>
" nnoremap <Leader>Xw :call TrimWhiteSpace()<CR><bar>:up<cr>

""" -------------------------------------------
"""         screen focus change
""" -------------------------------------------
" nmap f<cr> :silent !screen -X focus<cr>

""" -------------------------------------------
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
""" -------------------------------------------


function! Mouseon()
    set mouse=a
    " for better scrolling when using the mouse
    set scrolloff=2
    " Toolbar
    " set guioptions+=T 
    " for better golang navigation
    " TO PSUJE scrollowanie
    map <C-LeftMouse> gd 
    nmap <RightMouse> <c-o>

    nmap <2-LeftMouse> gd
    " nmap <expr> <2-LeftMouse> (&buftype is# "quickfix" ? "" : "gd")
endfunction


""" -------------------------------------------
""" gui
""" -------------------------------------------
set guioptions-=r
set guioptions-=L
set guifont=Inconsolata\ for\ Powerline\ Mod:h14

" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

""" -------------------------------------------
""" i like mouse too much :p ????
""" -------------------------------------------
" set scrolloff=2
"
call Mouseon()

" from h wheel
" map <M-Esc>[62~ <ScrollWheelUp>
" map! <M-Esc>[62~ <ScrollWheelUp>
" map <M-Esc>[63~ <ScrollWheelDown>
" map! <M-Esc>[63~ <ScrollWheelDown>
" map <M-Esc>[64~ <S-ScrollWheelUp>
" map! <M-Esc>[64~ <S-ScrollWheelUp>
" map <M-Esc>[65~ <S-ScrollWheelDown>
" map! <M-Esc>[65~ <S-ScrollWheelDown>


""" -------------------------------------------
"""     lite dfm - distraction free mode
""" -------------------------------------------
" distraction mode litedfm
nmap <leader>o :LiteDFMToggle<CR>
let g:lite_dfm_left_offset = 22
let g:lite_dfm_normal_bg_cterm = 232
let g:lite_dfm_normal_bg_gui = '#abcabc'

""" -------------------------------------------
"""         calculator, calc
""" -------------------------------------------
" Then, just type 8*8<C-A> you will get 8*8 = 64
inoremap <C-A> <C-O>yiW<End> = <C-R>=<C-R>0<CR>
" or CTRL-R followed by = then, for example, 2+2 and press Enter.


""" -------------------------------------------
"""         paredit
""" -------------------------------------------
let g:paredit_leader = ','
let g:paredit_disable_clojure = 1

""" -------------------------------------------
"""         Clojure
""" -------------------------------------------
function! ClojureMappings()
    nmap <buffer> gd [<C-D>
    vmap <buffer> gq :!/Users/ppalucki/bin/clformat <cr>
    " tt terminal-terminal
    " nmap <buffer> <leader>tt :update<bar>RunTests<cr> 
    nmap <buffer> <leader>ty :update<bar>RunAllTests<cr>
endfunction
au FileType clojure call ClojureMappings()

""" -------------------------------------------
"""            tagbar golang
""" -------------------------------------------
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" let g:ctrlp_buftag_ctags_bin='/home/ppalucki/workspace/goprojects/bin/gotags'
"
"
""" -------------------------------------------
"""           ctrlp buftags for Golang
""" -------------------------------------------
let g:ctrlp_buftag_types = {
\ 'go' : {
  \ 'bin': 'ctags',
  \ 'args': '-f - --sort=no --excmd=pattern --fields=nKs --language-force=go',
  \ },
\ }


""" -------------------------------------------
"""            godef
""" -------------------------------------------
" let g:godef_split=1
" let g:godef_same_file_in_same_window=1
"
""" -------------------------------------------
"""           vim-go
""" -------------------------------------------
" let g:go_auto_type_info = 1

" vim-go syntax highlihgting
let g:go_highlight_functions = 0
let g:go_highlight_structs = 0
let g:go_highlight_build_constraints = 0
let g:go_highlight_methods = 0
let g:go_highlight_operators = 0

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

" Disable opening browser after posting to your snippet to 
let g:go_play_open_browser = 0
" I have syntastic for that
let g:go_fmt_fail_silently = 1
" disaable because of duplicates
let g:go_autodetect_gopath = 0

""" -------------------------------------------
"""    sqlutils i sqluformatter
""" -------------------------------------------
""" wymaga align
let g:sqlutil_align_comma = 1 " tnij po przecinku
let g:sqlutil_align_first_word = 1  
let g:sqlutil_align_keyword_right = 0 " wyrownaj keywords do prawej
let g:sqlutil_keyword_case = '\L' " zmieni wilkosc selectow
let g:sqlutil_align_where = 0 " w where = wartosc wyrownaj
let g:sqlutil_stmt_keywords = 'select,insert,update,delete,with,merge,join,limit,group,union,on'
" ignore all mappings from align plugn
let g:loaded_AlignMapsPlugin = "v42"



""" -------------------------------------------
""" convert timestamp ct
""" -------------------------------------------
nmap <leader>ct yw:py import datetime;print datetime.datetime.fromtimestamp(<c-r>")<cr>


""" -------------------------------------------
"""         c / C language
""" -------------------------------------------
function! CMappings()
    nmap <buffer> <F9> :up<cr>:QuickRun<cr>
		nmap <buffer> <F10> :up<bar>Make<cr>
		imap <buffer> <F10> <ESC><F10>
    " let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
    " got to definition remapping
    " nmap gd <c-]>
   
    " allow "go to file" to find headr files for projects that have include
    " files in some specific folders
    " mesos specific inclues
    " dzieki vim-dispatch w tle
    " kompiujemy przez Make -C ../build/src/ -j8 mesos-master
    set path+=include
    set path+=src
    " set path+=3rdparty/libprocess/include
    " set path+=3rdparty/libprocess/include
    " set path+=3rdparty/libprocess/3rdparty/stout/include
    " set path+=3rdparty/libprocess/3rdparty/boost-1.53.0
		" regernate tags with (cd /usr/include/; sudo ctags -R .)
		""" affects ctrl_ptags - can go to all kernel tags .... (slowWWWWWWWWWW!)
		" set tags+=/usr/include/tags
		" set tags+=/usr/src/tags
endfunction
au FileType c call CMappings()
au FileType cpp call CMappings()
let g:clang_close_preview = 1

""" -------------------------------------------
"""         Clang (quickrun)
""" -------------------------------------------
let g:quickrun_config = {}

let g:quickrun_config.c = {
      \ 'type': 'clang',
      \ 'cmdopt': '`python-config --cflags --ldflags`',
      \ 'exec': ['%c %s %o -o %s:p:r', '%s:p:r %a'],
      \ }

let g:quickrun_no_default_key_mappings = 1

""" -------------------------------------------
"""         SQL
""" -------------------------------------------
function! SQLMappings()
    map gq :SQLUFormatter<cr>
    """ vim-simpledb remapping
    " tutaj nie dziala wiec trzeba wyedytowac sciezke
    "/Users/ppalucki/dotfiles/.vim/bundle/vim-simpledb/ftplugin/sql.vim
    vnoremap <buffer> <enter> :SimpleDBExecuteSql<cr>
    nnoremap <buffer> <leader><enter> m':SimpleDBExecuteSql <cr>g`'
    nnoremap <buffer> <enter> m':'{,'}SimpleDBExecuteSql<cr>g`'
endfunction
au FileType sql call SQLMappings()

""" -------------------------------------------
"""         FAKE CLIP (???)
""" -------------------------------------------
""" yank
nmap <leader>ty <Plug>(fakeclip-screen-Y):silent !tmux paste-buffer -t !<cr>
vmap <leader>ty <Plug>(fakeclip-screen-y)

""" paste from
nmap <leader>tp <Plug>(fakeclip-screen-p)

"let g:fakeclip_no_default_key_mappings = 'tmux'

""" -------------------------------------------
"""         DirDiff
""" -------------------------------------------
let g:DirDiffExcludes = ".tags,CVS,*.class,*.exe,.*.swp,.git" 

" \dg \dp \dj \dk 
" cannot reload config because of this - not useful as much
" let g:DirDiffEnableMappings = 1


""" -------------------------------------------
""" configuration file types
""" -------------------------------------------
au BufRead,BufNewFile *.conf set filetype=cfg
au BufRead,BufNewFile *.ini set filetype=cfg
au BufRead,BufNewFile .tmux.conf set filetype=conf


" systemd  unit types
au BufRead,BufNewFile *.target set filetype=cfg
au BufRead,BufNewFile *.service set filetype=cfg
au BufRead,BufNewFile *.mount set filetype=cfg
au BufRead,BufNewFile *.socket set filetype=cfg

" know bash scripts (rkt)
au BufRead,BufNewFile install set filetype=sh






""" -------------------------------------------
"""             vimux
""" -------------------------------------------
" better vertical
" let g:VimuxOrientation = "h"
" let g:VimuxHeight = "40"


""" -------------------------------------------
"""          tmux - copying
""" -------------------------------------------
" function! VimuxSlime()
"    """ uwaga nie potrafi wyslac np. $ do basha
"    " call VimuxRunCommand(@v)
"    call VimuxOpenRunner()
"    call VimuxSendText(@v)
"    call VimuxSendKeys("Enter")
" endfunction
"
" function! VimuxSlimeCpaste()
"     """ wersja dla ipytohn wykorzystujacego cpaste i konczoce sie dwa znakami
"    call VimuxOpenRunner()
"    call VimuxSendText('%cpaste')
"    call VimuxSendKeys('Enter')
"    call VimuxSendText(@v)
"    call VimuxSendKeys('- -')
"    call VimuxSendKeys('Enter')
" endfunction

""" -------------------------------------------
"""   tmux - send to all terminals
""" -------------------------------------------
if has("python")
py << EOP
import vim,os,subprocess,string,time

def get_target():
    return int(vim.eval("v:count"))

def handle_splits(target):
    """ with specific target 8 or 9, first create an split """
    ### on 8 repeat do -h split
    if target == 8:
        # do split !
        subprocess.call(('tmux', 'split', '-h', '-d'))
        return None

    ### on 9 repeat do split
    if target == 9:
        # do split !
        subprocess.call(('tmux', 'split', '-d'))
        return None
    
    return target

def sendlinetmux():
    """ send current line to selected by count tmux pane
    8 - tmux split -h 
    9 - tmux split
    """
    target = handle_splits(get_target())
    sendtmux(vim.current.line, target)

def sendselectiontmux():
    """ get selection visual mode and send it line by line to tmux """
    target = handle_splits(get_target())
    for line in vim.current.range:
        sendtmux(line, target)

def sendtmux(text, target_pane=None, enter=True, lookup=True):
    """
    if text contains c-(something) or enter it will be split by space and each word send seperatly
    lookup - if true up,ctrl,enter are recognized and sent as key.
    """

    # where to send - when None or 0 just take next pane
    if not target_pane: 
        # just next to me
        target_pane = int(_current_pane_idx())+1


    # for line in text.split('\n'):
    #     if not line:
    #         continue
    cmd = ("tmux send-keys %s -t %s "%('' if lookup else '-l', target_pane)).split()
    # handle c-keys correctly
    if ' c-' in text or text.startswith('c-') or "enter" in text:
        text = text.split() 
        for subtext in text:
            # throw out enters
            subtext = subtext.strip('\n\r')
            cmd.append(subtext)
            # cmd.append(subtext+" ") # this is sometimes required !
    else:
        cmd.append(text)

    if enter and not 'enter' in cmd:
        if lookup: # only when lookup is enabled
            # fix some problems if last commands ends with ;
            # check this out tmux send-keys 'ls;' enter 
            # >>> unknown command 'enter'
            if cmd[-1].endswith(';'):
                cmd[-1] = cmd[-1]+' ' # append space to last but one command before enter

            cmd.append('enter')

    # call actual command 
    subprocess.call(cmd)

    if enter and not lookup:
        # send addtional tmux command to emulate enter
        subprocess.call(("tmux send-keys -t %s enter"%target_pane).split())



def _current_pane_idx():
    currentout = subprocess.check_output("tmux display-message -p #P".split(' '))
    return currentout.strip().strip("'")

def _all_panes_idxs():
    allpanesout = subprocess.check_output("tmux list-panes -F '#{pane_index}'".split(' '))
    allpanes = map(lambda x: string.strip(x, "'"), filter(None, allpanesout.split("\n")))
    return allpanes

def sendalltmux(text):
    current_id = _current_pane_idx()
    allpanes = _all_panes_idxs()
    
    for pane_id in allpanes:
        if pane_id == current_id:
            continue
        sendtmux(text, pane_id, enter=False)

def offset():
    print vim.eval('line2byte(line("."))+col(".")')

EOP
endif

command! Offset py offset()

""" terminal bash vertical
" map <leader>tb :call VimuxOpenRunner()<cr>

""" cpaste
" vmap <leader>tS "vy:call VimuxSlimeCpaste()<cr>

""" terminal send (with enter by default) tS without enter
" If text is selected, save it in the v buffer and send that buffer it to tmux
" vmap <leader>ts "vy:call VimuxSlime()<cr>
vmap <leader>tS "vy:py sendtmux(vim.eval("@v"), enter=False)<cr>
vmap <leader>ts "vy:py sendtmux(vim.eval("@v"))<cr>

""" terminal rerun  (tr or just r)
map <leader>tr :up<bar>:py sendtmux('c-p')<cr>
map <leader>r :up<bar>:py sendtmux('c-p')<cr>

""" terminal quit and rerun
map <Leader>tq :py sendtmux('c-c c-p')<cr>

""" terminal "exit"
map <leader>te :py sendtmux('exit')<cr>

""" terminal ctrl-c
map <Leader>tc :py sendtmux('c-c')<cr>

""" terminal ctrl-z
map <Leader>tz :py sendtmux('c-z')<cr>

""" terminal line - begin then send visual till end and terminal send
nmap <leader>tl _v$<leader>ts
""" terminal-terminal (just better shortcut)
nmap <leader>tt <leader>tl

""" terminal-line alias na terminal-terminal
vmap <leader>tt <leader>ts

""" terminal-terminal and down
nmap <c-x> :py sendlinetmux()<cr>j
" warning conflicts with vim multicursors - skip
vmap <c-x> :py sendselectiontmux()<cr>
nmap <leader>x :py sendlinetmux()<cr>
vmap <leader>x :py sendselectiontmux()<cr>

" execute current line (wo tmux)
nmap <Leader>X :.w !bash<cr>
vmap <Leader>X :w !bash<cr>

""" terminal-all (selection)
vmap <leader>ta "vy:py sendalltmux(vim.eval("@v"))<cr>

""" terminal-all (just this line)
nmap <leader>ta _v$<leader>ta

""" terminal word (send) + enter
nmap <leader>tw viw<leader>ts

""" terminal word (send) wo enter
nmap <leader>tW viw<leader>tS

""" terminal directory (change current directory to path of current file)
map <Leader>td :py sendtmux('cd ' + vim.eval('expand("%:p:h")'))<cr>
""" terminal Director of cwd
map <Leader>tD :py sendtmux('cd ' + vim.eval('getcwd()'))<cr>



""" -------------------------------------------
""" git gerrit review - setspell and textwidth
""" -------------------------------------------
" Enable spell checking, which is not on by default for commit messages.
au FileType gitcommit setlocal spell
" Reset textwidth if you've previously overridden it.
au FileType gitcommit setlocal textwidth=72

""" -------------------------------------------
""" Tcomment new shortcut (compatibile z ideavim)
""" -------------------------------------------
" other shortucts to c-/
nmap <C-g> gccj
vmap <C-g> gc

""" -------------------------------------------
"""    airline-tabline
""" -------------------------------------------
" * enable/disable enhanced tabline. >
let g:airline#extensions#tabline#enabled = 0
" * enable/disable displaying buffers with a single tab. >
let g:airline#extensions#tabline#show_buffers = 0

""" -------------------------------------------
""" buffers navigation
""" -------------------------------------------
nmap ]b :bn<cr>
nmap [b :bp<cr>
"" breaks ctrl-p 
" nmap <C-]> :bn<cr>
" nmap <C-[> :bp<cr>

""" -------------------------------------------
" aka shift-alt
""" -------------------------------------------
nmap } :bn<cr>
nmap { :bp<cr>



""" -------------------------------------------
""" Etherpad !!!
""" -------------------------------------------
"
" " To connect to the pad at URI http://localhost:9001/p/test per default:
" let g:epad_host = "etherpad.amr.corp.intel.com" " Hostname to connect to
" let g:epad_port = "80"      " Port to connect to
" let g:epad_path = "/"        " URL Path to the pad
" let g:epad_pad = "sdiref"       " Name of the pad to connect to
" " http://etherpad.amr.corp.intel.com/sdiref
" "
" " " GUI feel
" let g:epad_updatetime = 5000  " lower this for more realtime, higher this
" "
" " " GUI look
" let g:epad_attributes = 1     " set to 1 to display attributes (works only
" let g:epad_authors = 1        " set to 1 to display authors (works only in
" "
" " " Enable verbosity
" let g:epad_verbose = 2        " set to 1 for INFO level, 2 for DEBUG level))
"
"

""" -------------------------------------------
" Gomfile as ruby
""" -------------------------------------------
au BufRead,BufNewFile Gomfile setlocal ft=ruby

""" -------------------------------------------
""" simple better zoomwindow
""" -------------------------------------------
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>z :ZoomToggle<CR>


""" -------------------------------------------
""" Merge conflicts
""" -------------------------------------------
" Highlight merge conflict markers
match Todo '\v^(\<|\=|\>){7}([^=].+)?$'

" Jump to next/previous merge conflict marker
nnoremap <silent> ]c /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
nnoremap <silent> [c ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

""" -------------------------------------------
""" Encryption (ccrypt)
""" -------------------------------------------
" encryption
set cryptmethod=blowfish
" based on http://vim.wikia.com/wiki/Encryption
" to encrypt file for the first time
" ccrypt -e filename.txt
" then vim filename.txt.cpt
" ccrypt
augroup CPT
  au!
  au BufReadPre *.cpt set bin
  au BufReadPre *.cpt set viminfo=
  au BufReadPre *.cpt set noswapfile
  au BufReadPost *.cpt let $vimpass = inputsecret("Password: ")
  au BufReadPost *.cpt silent '[,']!ccrypt -cb -E vimpass
  au BufReadPost *.cpt set nobin
  au BufWritePre *.cpt set bin
  au BufWritePre *.cpt '[,']!ccrypt -e -E vimpass
  au BufWritePost *.cpt u
  au BufWritePost *.cpt set nobin
augroup END

""" -------------------------------------------
""" GoLang oracle by hand
""" -------------------------------------------
" find offset be on function
" py print vim.eval('line2byte(line("."))+col(".")')
" execute oracle
" oracle  -pos=learn.go:#632 callers github.com/intelsdilabs/nerp
"
"
" In the quickfix window, <CR> is used to jump to the error under the
" " cursor, so undefine the mapping there.
" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
"
"
""" -------------------------------------------
""" Diff highlight
""" -------------------------------------------



" dodane
hi DiffAdd        term=NONE ctermbg=234
" skasowane
hi DiffDelete     term=NONE ctermfg=0 ctermbg=234 
"hi DiffDelete     term=NONE ctermfg=162 ctermbg=53 

" zmiany -  teksty
hi DiffChange     term=NONE ctermfg=6

" konflikt tekstu
hi DiffText       term=NONE cterm=NONE ctermfg=3 ctermbg=234



" very bright and visible
" SeeTab: toggles between showing tabs and using standard listchars
fu! SeeTab()
  if !exists("g:SeeTabEnabled")
    let g:SeeTabEnabled = 1
    let g:SeeTab_list = &list
    let g:SeeTab_listchars = &listchars
    let regA = @a
    redir @a
    " hi SpecialKey
    redir END
    let g:SeeTabSpecialKey = @a
    let @a = regA
    silent! hi SpecialKey guifg=black guibg=magenta ctermfg=black ctermbg=red
    set list
    set listchars=tab:▸\  
  else
    let &list = g:SeeTab_list
    let &listchars = &listchars
    silent! exe "hi ".substitute(g:SeeTabSpecialKey,'xxx','','e')
    unlet g:SeeTabEnabled g:SeeTab_list g:SeeTab_listchars
  endif
endfunc
com! -nargs=0 SeeTab :call SeeTab()



" CLANG
let g:clang_exec = 'clang-3.5'

" vim-smooth-scroll
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" shor message at startup
set shortmess=afilnxtToOI


""" BACKUPS
" Don't make a backup before overwriting a file
" set nobackup
" set nowritebackup

" Disable swap files
" set updatecount=0

"" =============================================================================
" Performance
" =============================================================================

" See :help slow-terminal

" Optimize for fast terminal connections
set ttyfast

" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256

" Don't syntax highlight long lines
set synmaxcol=256

" Don't redraw screen while executing macros, registers
set lazyredraw

" Maximum number of lines to scroll the screen
set ttyscroll=3

" Jump by more lines when scrolling
set scrolljump=2

" default
set cmdheight=1

" 
" http://vim.wikia.com/wiki/VimTip167
" Using vim as a man-page viewer under Unix
" let $PAGER=''


"" =============================================================
" highlight column textwidht
"" =============================================================
" for comments 
" https://github.com/golang/go/wiki/CodeReviewComments#line-length
" set textwidth=80
" set colorcolumn=+1
hi ColorColumn ctermbg=232 cterm=bold
" hi ColorColumn guibg=#2d2d2d ctermbg=246
" hi ColorColumn ctermbg=235 guibg=#2c2d27
" hi ColorColumn guibg=#000000 ctermbg=0
" let &colorcolumn=join(range(1,80),",")
"
"
"" =============================================================
" multicursor
"" =============================================================
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0


"" -------------------------- quickfix window size
" http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(3, 30)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction


"" =============================================================
" tmux-complete
"" =============================================================
" Use the #trigger option to tune the way you interact with tmux-complete by putting one of these lines into your .vimrc:
" By default, tmux-complete sets Vim's completefunc, that can be invoked with <C-X><C-U>.
" let g:tmuxcomplete#trigger = 'completefunc'

" Alternatively, you can use Vim's omnifunc, that can be invoked with <C-X><C-O>. This setting also integrates with YouCompleteMe so you can see Tmux completions when hitting <C-Space>.
let g:tmuxcomplete#trigger = 'omnifunc'
" " If you're using the neocomplete integration, you probably don't need the additional trigger.
" let g:tmuxcomplete#trigger = ''
" " The trigger function itself is named tmuxcomplete#complete (in case you want to call it manually).
