""" -------- Standard options
syntax on 
set number
set nowrap
"set paste
set comments=

""" search
set incsearch
"set hlsearch             " highlight search
set ignorecase

""" wciecia
set smarttab
set expandtab
set autoindent
set ts=2 sw=2 softtabstop=2
autocmd FileType ruby set ts=2 sw=2 softtabstop=2
autocmd FileType html set ts=2 sw=2 softtabstop=2 nocindent
autocmd FileType python set ts=4 sw=4 softtabstop=4


"""------- kolorki
colorscheme desert256
set t_Co=256
hi Pmenu ctermfg=220 ctermbg=238
hi PmenuSel ctermfg=lightyellow ctermbg=brown
hi PmenuSbar ctermbg=6
hi PmenuThumb ctermfg=3

"podglad numerow kolorow ~/download/xtrem-colortest -w -r


""" ------- skroty
ab ipy from IPython import ipapi;ipapi.launch_new_instance(dict(globals(), ** locals())) 
ab pdb import pdb;pdb.set_trace()
ab xpm import pdb;pdb.xpm()
ab ripl Ripl.start :binding => binding
ab pry binding.pry
ab irb IRB.start
ab deb debugger
""" ------- Backspace fix
set backspace=indent,eol,start

""" ------- AutoComplete fix
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : 
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : 
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

""" ------- NerdTree
"map <silent> <F2> :NERDTreeToggle<CR>:wincmd p<CR>
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <leader><F2> :NERDTreeFind<CR>:wincmd p<CR>
let NERDTreeShowBookmarks=1
let NERDChristmasTree = 1
let NERDTreeMapActivateNode='<CR>'      " set Enter/Return to activate a node
let NERDTreeChDirMode=2                 " always change CWD
let NERDChristmasTree=1                 " more colors
let NERDTreeMinimalUI=1
"let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen=1


""" proba fixa kasowania slow w trybie insert
imap <C-w> ESC<C-w>

"" Turn on NERDTree on startup
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" NERDTreeFind on open - nie dziala
"autocmd BufEnter * NERDTreeFind
"autocmd BufEnter * wincmd p


""" ------- rails.vim OpenURL
command -bar -nargs=1 OpenURL :!"c:\Program Files\Mozilla Firefox\firefox.exe" <args>

""" ------- TagList (outline)
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
nnoremap <leader><silent> <F3> :TlistToggle<CR>
map <F3> :FufBufferTag<CR>


""" mru:
nmap <silent> <F4> :FufMruFile<CR>
nmap <silent> <leader><F4> :MRU<CR>


""" ------- ruby IDE
nmap <A-e> :w\|rubyf ./%
imap <A-e> <Esc>:w\|rubyf ./%
nmap <F10> :w\|!ruby %<CR>
imap <F10> <Esc>:w\|!ruby %<CR>

""" -------- Ctags
map <F7> :!ctags **/*.
map <leader><F7> :!ctags --verbose=yes --recurse=yes .
set tags+=./tags
set tags+=tags
set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
set tags+=$HOME/.vim/tags/python.ctags

""" ---- IDE Pyhon 
"" script exectue
map <silent><F9> :!/usr/bin/env python %<CR>

"" Python complete
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class 
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd FileType python set omnifunc=pythoncomplete#Complete
filetype plugin indent on
noremap <Nul> <C-x><C-o>


"" PyFlakes + PyLint integration
" Author: Nick Anderson <nick at anders0n.net>
" Website: http://www.cmdln.org
" Adapted from sonteks post on Vim as Python IDE
" http://blog.sontek.net/2008/05/11/python-with-a-modular-ide-vim/
command Pyflakes :call Pyflakes()
function! Pyflakes()
    let tmpfile = tempname()
    execute "w" tmpfile
    execute "set makeprg=(pyflakes\\ " . tmpfile . "\\\\\\|sed\\ s@" . tmpfile ."@%@)"
    make
    cw
endfunction

command Pylint :call Pylint()
function! Pylint()
    setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    setlocal efm=%+P[%f],%t:\ %#%l:%m
    silent make
    cwindow
endfunction
" autocmd BufWrite *.{py} :call Pyflakes()

"" ? 
"autocmd FileType python set complete+=k~/.vim/pydiction-0.5/pydiction isk+=.,(

""" ------- GUI gvim
if has('gui_running')
  set guifont=Courier_New:h9:cEASTEUROPE
	set winaltkeys=no
	set t_Co=256
    " scrollbars configuration
    set go=egmLt
    " maxmimiezed 
    au GUIEnter * simalt ~s
    "colorscheme torte
    colorscheme dante
    "colorscheme desert256
endif


""" ------  Last position
"This autocommand jumps to the last known position in a file just after opening it, if the '"' mark is set:
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

""" ------ sudo write
command W w !sudo tee % > /dev/null

""" ----- fuzzyfinder/BufExplorer (buffers) and quickfix window
map <F5> :FufBuffer<CR>
"defaults: let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', ]
let g:fuf_modesDisable = [ 'mrucmd', ]
let g:fuf_coveragefile_globPatterns = ['**/*.rb', '**/*.erb', '**/*.html', '**/*.xml', '**/*.js', '**/*.sh', '**/*.py', '**/*.yml', 'Gemfile'] 
let g:fuf_maxMenuWidth = 140
"noremap <silent> <C-]> :FufTagWithCursorWord!<CR> "nie dziala



""" ----- mouse
"set mouse=a

""" ----- fuzzyfinder: file open
map <silent> <F6> :FufCoverageFile<CR>




""" ----- grep (plugin) 
let Grep_Default_Filelist = '*.rb *.py *.html *.erb'
let Grep_Default_Options = '-i'
let Grep_OpenQuickfixWindow = 1
map <silent> <leader><F6> :Rfgrep<CR>
map <leader><F5> :FufQuickFix<CR>

""" ------ cursorline
set cursorline
hi CursorLine cterm=NONE ctermbg=233

""" ---- statusline
set laststatus=2
set statusline=%f "tail of the filename

""" ---- saveall shortcut
map ZA :wall<CR>
