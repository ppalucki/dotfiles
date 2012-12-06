""" -------- GUI --------------
set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 9
set guioptions-=T

"""-------- pathogen
" install plugins in ~/.vim/bundle folder
" call pathogen#runtime_append_all_bundles()
filetype off
call pathogen#infect() 
filetype plugin indent on
call pathogen#helptags()   "load all helptags

"""------- kolorki
"podglad numerow kolorow ~/download/xtrem-colortest -w -r
" syntax on musi byc przed kolorkami
syntax on 
set t_Co=256
" colorscheme desert256
colorscheme molokai
let g:molokai_original = 1
hi Pmenu ctermfg=220 ctermbg=238 guibg=#511151
hi PmenuSel ctermfg=lightyellow ctermbg=brown guibg=#333388
hi PmenuSbar ctermbg=6
hi PmenuThumb ctermfg=3

""" ------ cursorline
set cursorline
hi CursorLine cterm=NONE ctermbg=234 guibg=#121212

""" ------ statusline
hi StatusLine ctermbg=black
hi StatusLineNC ctermbg=black
""" powerline
" inny colorscheme aby byla czarna lina przy vertical split
let g:Powerline_colorscheme='skwp' 
""" 
" wplywa na multipolcenie taloe jak leader \ev \es \s
set timeoutlen=1000 
set scrolloff=6

""" -------- leader
let mapleader = ","

"""--------- pythonmode
let g:pymode_folding = 0
" flakes + write dziala dosc szybko ale nie wykrywa wszystkich bledow
let g:pymode_lint_write = 1
let g:pymode_lint_checker = "pyflakes"
" pylint dziala lepiej ale jest zawolny na przy kazdym zapisie
" let g:pymode_lint_checker = "pylint"
let g:pymode_utils_whitespaces = 0
let g:pymode_lint_jump = 1
"let g:pymode_syntax_indent_errors = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_lint_ignore = 'W402,W0611,C0324,W0612,W0511,C0323,W0622,C0302,W806,C0322,R0921,R0914,W0101,W801,W404'
"let g:pymode_lint_select = 'E0611'
map <leader>l :PyLint<CR>
let g:pymode_breakpoint_key = ''

"""-----------ipython
let g:ipy_perform_mappings = 0
let g:ipy_completefunc = 'global'
" ipython connect/shell/quit
map <leader>ii :IPython<CR>
map <leader>is :py if update_subchannel_msgs(force=True): echo("vim-ipython shell updated",'Operator')<CR>
map <leader>iq :py run_command('quit')<CR>
map <leader>id :py get_doc_buffer()<CR>
nmap <S-F5> :python dedent_run_this_line()<CR>
vmap <S-F5> :python dedent_run_these_lines()<CR>
imap <C-F5> <C-O>:python dedent_run_this_line()<CR>
"
" ipython embeded
nmap <leader>ip o<esc>Sipy<ESC>:w<cr>
" ipython debug
nmap <leader>id o<esc>Sipdb<ESC>:w<cr>

"""--------- hidden
" allow edited buffers
set hidden

""" save shift (lost repeat of t,f,T,F)
noremap ; :
"nnoremap : ;

""" delaing with .vimrc
" vimrc edit/source
noremap <leader>ve :e $MYVIMRC<CR>
noremap <leader>vs :so $MYVIMRC<CR>

""" ---------- quickfix window navigation
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" S for subsitute inner word from yanked text
nnoremap <leader>s "_diwP

" numberlines toggle
nnoremap <leader>n :set invnumber<cr>
" pasttoggle
nnoremap <leader>p :set paste!<cr>

"""-------------- ruby/thor
au BufRead,BufNewFile *.thor set filetype=ruby


""" -------- Standard options
set nonumber
set nowrap
"set paste
set comments=

""" search
set incsearch
set smartcase
set ignorecase
""" highlight search and reset
set hlsearch             " highlight search
map <leader>/ :nohlsearch<CR>; echo 'Search highlight cleared' <CR>
"
" delete without yank
" nmap <silent> <leader>d "_d 
" vmap <silent> <leader>d "_d

""" ------- switch buffers
map <C-h> :bp<CR> 
map <C-l> :bn<CR>

""" wciecia
set smarttab
set expandtab
set autoindent
set ts=4 sw=4 softtabstop=4
"set smartindent
autocmd FileType ruby set ts=2 sw=2 softtabstop=2
autocmd FileType html set ts=2 sw=2 softtabstop=2 nocindent
autocmd FileType python set ts=4 sw=4 softtabstop=4



" wyjscie z trybu insert przez wpisanie dwa razy jj
inoremap jj <ESC>

""" ------- skroty
ab ipy from IPython import embed;embed()
ab eke from IPython import embed_kernel;embed_kernel()
ab pdb import pdb;pdb.set_trace()
ab ipdb import ipdb;ipdb.set_trace()
ab xpm import pdb;pdb.xpm()
ab ripl Ripl.start :binding => binding
ab bpry binding.pry<ESC>
ab deb debugger
ab sh from pyshell import main; main(dict(globals(),**locals()))

""" ------- Backspace fix
set backspace=indent,eol,start

""" ------- AutoComplete fix
set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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
"imap <C-w> <ESC>

""" ------- rails.vim OpenURL
" command -bar -nargs=1 OpenURL :!"c:\Program Files\Mozilla Firefox\firefox.exe" <args>
" map <leader><c-g> :A<CR>

""" ------- TagList (outline)
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Show_One_File = 1
"map <leader> <F3> :TlistToggle<CR>
"let Tlist_Show_One_File = 1

""" ------- ruby IDE
"nmap <A-e> :w\|rubyf ./%
"imap <A-e> <Esc>:w\|rubyf ./%
"nmap <F10> :w\|!ruby %<CR>
"imap <F10> <Esc>:w\|!ruby %<CR>
"
""" -------- Ctags
"map <F7> :!ctags **/*.       
map <F8> :!find -type f -name "*.py" \| xargs ctags -f tags --totals --python-kinds=-i-v
map <leader><F8> :!ctags -f tags --verbose=yes --recurse=yes .
set tags=tags
"set tags+=./.tags
"set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
"set tags+=$HOME/.vim/tags/python.ctags

""" ---- IDE Pyhon 
"" script exectue
map <F9> :w<cr>:!/usr/bin/env python %<CR>

""" ----- Python complete
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class 
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``   "remove trailing spaces
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"noremap <Nul> <C-x><C-o>
"autocmd FileType python set complete+=k~/.vim/pydiction-0.5/pydiction isk+=.,(

""" ------  Last position
"This autocommand jumps to the last known position in a file just after opening it, if the '"' mark is set:
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

""" ------ sudo write
command! W w !sudo tee % > /dev/null

""" ----- fuzzyfinder
map <F3> :FufBufferTag<CR>
map <leader><c-o> :FufBufferTag<CR>
map <leader><F3> :TagbarToggle<CR>
map <F4> :FufMruFile<CR>
map <F5> :FufTag!<CR>
map <leader><F5> :FufTag<CR>
map <F6> :FufCoverageFile<CR>
map <leader><c-t> :FufCoverageFile<CR>
map <F7> :FufBuffer<CR>
map <leader><F7> :FufQuickfix<CR>

"defaults: let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', ]
let g:fuf_modesDisable = [ 'mrucmd', ]
let g:fuf_coveragefile_globPatterns = ['**/*.rb', '**/*.erb', '**/*.haml', '**/*.html', '**/*.xml', '**/*.js', '**/*.sh', '**/*.py', '**/*.yml', 'Gemfile', '**/*.thor', '**/*.rake', '**/*.yaml', '**/signed_curl'] 
let g:fuf_maxMenuWidth = 240
let g:fuf_ignoreCase = 0
let g:fuf_fuzzyRefining = 0

"fuf mrufile
let g:fuf_mrufile_maxItem = 600
let g:fuf_mrufile_maxItemDir = 150

""" ----- mouse
"set mouse=a
"set ttymouse=xterm2

""" ----- grep (plugin) 
let Grep_Default_Filelist = '*.rb *.py *.html *.erb *.js *.sh *.thor *.rake *.yaml'
let Grep_Default_Options = '-i'
let Grep_OpenQuickfixWindow = 1
let Grep_Skip_Dirs = 'tmp'
let Grep_Shell_Escape_Char = '\'
"map <leader><F6> :Rfgrep<CR>
" map <leader>h :Rfgrep<cr>
map <leader>h :Ack --py --ignore-dir=tmp 
map <leader>a yaw:Ack --ignore-dir=tmp --py <C-r>"
vmap <leader>a y:Ack --ignore-dir=tmp --py <C-r>"

""" ---- statusline
set laststatus=2
set statusline=%<\ %f\ %h%r%=%l/%L\ (%p%%) 

""" ---- saveall shortcut
map ZA :wall<CR>
map ZW :qa<CR>
map ZX :w<CR>
""" write/quit
map <leader>w :w<CR>
map <leader>q :q<CR>
" To the position where the last change was made
noremap <leader>e `.


""" ---- bzr shortcuts (gui)
" bzr commit/log/status
map <leader>bc :!bzr qci<CR>
map <leader>bl :!bzr qlog<CR>
map <leader>bs :!bzr st<CR>
map <leader>bu :!bzr up<CR>
map <leader>bb :!bzr qblame %<CR>
map <leader>bv :w<cr>:!bzr cdiff %<CR>


""" ---- buffers
" buffer write delete
map <leader>bwd :w<bar>BD<cr>
" buffer delete
map <leader>bd :BD<cr>

""" -----navgigation
map <leader>g :RopeGotoDefinition<cr>
"<C-c>g

""" ------------ fugitive
" map <leader>gs :Gstatus<cr>
"
""" --- komentarze map
"map <C-/> <C-C>
" vmap <C-/> :call PythonCommentSelection()<CR>
" vmap <leader><C-/> :call PythonUncommentSelection()<CR>
" nmap <C-/> :call PythonCommentSelection()<CR>
" nmap <leader><C-/> :call PythonUncommentSelection()<CR>
" uzywamy teraz tcomment gc

""" --- json
autocmd BufNewFile,BufRead *.json set ft=javascript

""" ---- uzywamy wspolnego clipa
set clipboard=unnamedplus

""" ---- smarthome
" http://vim.wikia.com/wiki/Smart_home
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')

noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
imap <End> <C-o><End>


set number

""" ConqueTerm
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_ToggleKey = ''


""" Screen
map <leader>tb :ScreenShell bash<cr>
" map <leader>tp :call screen#IPython()<CR>
map <leader>ts :ScreenSend<CR>
" run and send last run
map <leader>tr :w<bar>call ScreenShellSend("!!")<cr>
map <leader>te :call ScreenShellSend('exit')<cr>
" "terminal line" begin then send visual till end and terminal send
nmap <leader>tl _v$,ts
" "terminal word" (send)
nmap <leader>tw viw<leader>ts

""" screen debuger
" konflikt w <leader>d (kasowanie lini bez buffora)
" nmap <leader>dn :call ScreenShellSend("next")<cr>

""" pi_paren
" bez oznaczania nawiasow
let loaded_matchparen = 1
" NoMatchParen
"
"
"
""" disable fold
set nofoldenable

""" swap files



" cmdline-editing bash style
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

