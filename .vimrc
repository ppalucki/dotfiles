""" -------- GUI --------------
set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 9
" set guioptions-=TrRlLb
" set guioptions+=ic
set guioptions=aegmtic


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
let g:molokai_original = 0
colorscheme molokai
hi Pmenu ctermfg=220 ctermbg=238 guibg=#511151
hi PmenuSel ctermfg=lightyellow ctermbg=brown guibg=#333388
hi PmenuSbar ctermbg=6
hi PmenuThumb ctermfg=3

""" ------ cursorline
set cursorline
hi CursorLine cterm=NONE ctermbg=234 guibg=NONE

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
" auto jump off
" let g:pymode_lint_jump = 0 
"let g:pymode_syntax_indent_errors = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_lint_ignore = 'W402,W0611,C0324,W0612,W0511,C0323,W0622,C0302,W806,C0322,R0921,R0914,W0101,W801,W404'
"let g:pymode_lint_select = 'E0611'
map <leader>l :PyLint<CR>
let g:pymode_breakpoint_key = '<leader>ib'
let g:pymode_run = 0
"let g:pymode_run_key = '<leader>r'

"""-----------ipython
let g:ipy_perform_mappings = 0
let g:ipy_completefunc = 'global'
" ipython connect/shell/quit
" nmap <leader>ii :IPython<CR>
" nmap <leader>is :py if update_subchannel_msgs(force=True): echo("vim-ipython shell updated",'Operator')<CR>
" nmap <leader>iq :py run_command('quit')<CR>
" nmap <leader>k :py get_doc_buffer()<CR>
" nmap <S-F5> :python dedent_run_this_line()<CR>
" vmap <S-F5> :python dedent_run_these_lines()<CR>
" imap <C-F5> <C-O>:python dedent_run_this_line()<CR>
"
" ipython embeded
au FileType python nmap <buffer> <leader>ip o<esc>Sfrom IPython import embed;embed()<ESC>:w<cr>
" ipython debug 
au FileType python nmap <buffer> <leader>id o<esc>Simport ipdb;ipdb.set_trace()<ESC>:w<cr>
au FileType python nmap <buffer> <leader>iu o<esc>Simport pudb;pudb.set_trace()<ESC>:w<cr>

" binding pry (only for ruby)
au FileType ruby nmap <buffer> <leader>ip obinding.pry<ESC>:w<cr>
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
autocmd FileType mkd set shiftwidth=2



" wyjscie z trybu insert przez wpisanie dwa razy jj
inoremap jj <ESC>

""" ------- skroty
""" PYTHON
" ab ipy from IPython import embed;embed()
ab eke from IPython import embed_kernel;embed_kernel()
" ab pdb import pdb;pdb.set_trace()
" ab ipdb import ipdb;ipdb.set_trace()
" ab pudb import pudb;pudb.set_trace()
" ab xpm import pdb;pdb.xpm()
" ab sh from pyshell import main; main(dict(globals(),**locals()))
"
""" RUBY
ab ripl Ripl.start :binding => binding
ab bpry binding.pry<ESC>
ab deb debugger

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
let NERDTreeIgnore=['\.pyc$', '\~$']

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
" map <F8> :!find -type f -name "*.py" \| xargs ctags -f tags --totals --python-kinds=-i-v
" map <leader><F8> :!ctags -f tags --verbose=yes --recurse=yes .
map <leader><F8> :!ctags -f .tags --languages=HTML,Java,JavaScript,Python,Ruby --totals --verbose=no --recurse=yes .
au FileType python map <F8> :!ctags -f .tags --languages=Python --verbose=no --totals --recurse=yes .
au FileType ruby map <F8> :!ctags -f .tags --languages=Ruby --langmap=Ruby:.rb.thor --verbose=no --totals --recurse=yes .
set tags=.tags
"set tags+=./.tags
"set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
"set tags+=$HOME/.vim/tags/python.ctags

""" ---- IDE Pyhon 
"" script exectue
au FileType python map <F9> :w<bar>!/usr/bin/env python %<CR>
au FileType python map <leader><F9> :w<bar>!/usr/bin/env python %  
"" repeat last command
map <leader>r @:
"" ---- Java - eclim
au FileType java map <F9> :w<bar>:Java<cr>

""" ---- IDE running riv (rest)
au FileType rst map <F9> :w<bar>!cd ..;make html<cr>
au FileType rst map <leader><F9> :w<bar>!cd ..;make clean html<cr>
""" fix of italic overbold!
au FileType rst :highlight rstEmphasis cterm=NONE ctermfg=3
" let g:riv_link_cursor_hl=0
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
map <leader><F3> :TagbarToggle<CR>
" map <leader><c-o> :FufBufferTag<CR>
map <F4> :FufMruFileInCwd<CR>
map <leader><F4> :FufMruFile<CR>
map <F5> :FufBuffer<CR>
map <leader><F5> :FufQuickfix<CR>
map <F6> :FufFile<CR>
map <leader><F6> :FufCoverageFile<CR>
" map <leader><c-t> :FufCoverageFile<CR>
map <F7> :FufTag!<CR>
map <leader><F7> :FufTag<CR>
map <leader>o :FufJumpList<CR>

"defaults: let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', ]
let g:fuf_modesDisable = [ 'mrucmd', ]
let g:fuf_coveragefile_globPatterns = ['**/*.rb', '**/*.erb', '**/*.haml', '**/*.html', '**/*.xml', '**/*.js', '**/*.sh', '**/*.py', '**/*.yml', 'Gemfile', '**/*.thor', '**/*.rake', '**/*.yaml', '**/signed_curl', '**/*.rst', '**/*.json', '**/*.java', '**/*.xhtml', '**/*.sql']
let g:fuf_maxMenuWidth = 240
let g:fuf_ignoreCase = 1
" let g:fuf_fuzzyRefining = 1

"fuf mrufile
let g:fuf_mrufile_maxItem = 6000
let g:fuf_mrufile_maxItemDir = 1500
let g:fuf_learningLimit = 1000
let g:fuf_autoPreview = 1
""" ----- mouse
"set mouse=a
"set ttymouse=xterm2
set nomousehide

""" ----- grep (plugin) 
let Grep_Default_Filelist = '*.rb *.py *.html *.erb *.js *.sh *.thor *.rake *.yaml'
let Grep_Default_Options = '-i'
let Grep_OpenQuickfixWindow = 1
let Grep_Skip_Dirs = 'tmp'
let Grep_Shell_Escape_Char = '\'
"NOT USED

"map <leader><F6> :Rfgrep<CR>
" map <leader>h :Rfgrep<cr>
" map <leader>h :Ack --py
" Ack bez jumpa
map <leader>h yiw:Ack! "<C-r>""
vmap <leader>h y:Ack! "<C-r>""
au FileType python map <leader>h yiw:Ack! --python "<C-r>""
au FileType python vmap <leader>h y:Ack! --python  "<C-r>""
au FileType ruby map <leader>h yiw:Ack! --ruby "<C-r>""
au FileType ruby vmap <leader>h y:Ack! --ruby "<C-r>""

" Ack z jumpa
map <leader>H yiw:Ack "<C-r>""
vmap <leader>H y:Ack "<C-r>""
au FileType python map <leader>H yiw:Ack --python "<C-r>""
au FileType python vmap <leader>H y:Ack --python  "<C-r>""
au FileType ruby map <leader>H yiw:Ack --ruby "<C-r>""
au FileType ruby vmap <leader>H y:Ack --ruby "<C-r>""

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
" close all but this one (and not saved!)
map <leader>bo :BufOnly<cr>

""" -----navgigation
" au FileType ruby map <leader>g <C-]>
map <leader>g <C-]>
au FileType python map <leader>g :RopeGotoDefinition<cr>

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
"" nie dziala, zebym zrestartowal i mi przywrocilo
" map <leader>ta :ScreenShellAttach<cr> 
" let g:ScreenShellQuitOnVimExit = 0 
" map <leader>tp :call screen#IPython()<CR>
vmap <leader>ts :ScreenSend<CR>
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
au FileType rst set nofoldenable 
let g:riv_fold_auto_update = 0
let g:riv_web_browser = "google-chrome"


let docs_tv = { 'path': '~/workspace/getmedia/docs_tv/source', 'build_path': '~/workspace/getmedia/docs_tv/build'}
let g:riv_projects = [docs_tv]


""" swap files

" insert mode bash style
inoremap <C-f> <Right>
inoremap <C-b> <Left>
"" nie dzialaja
" inoremap <M-b> <S-Left>
" inoremap <M-f> <S-Right>

" cmdline-editing bash style
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0

" set noswapfile
"

" slowness fix!!!
au FileType ruby set nocursorline
set foldmethod=manual
au FileType rst set nocursorline

" java + eclim
au FileType java nnoremap <silent> <buffer> <leader>ji :JavaImport<cr>

" java doc
au FileType java nnoremap <silent> <buffer> <leader>jd :JavaDocSearch -x declarations<cr>
au FileType java nnoremap <silent> <buffer> <leader>k :JavaDocSearch -x declarations<cr>

" java go
au FileType java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
au FileType java nnoremap <buffer> <leader>g :JavaSearchContext<cr>
let g:EclimJavaSearchSingleResult = "edit"

"""""""""""""""""""""""""""""""""" colore rerun
" set t_Co=256
" colorscheme desert256
" colorscheme molokai
" let g:molokai_original = 1
" hi Pmenu ctermfg=220 ctermbg=238 guibg=#511151
" hi PmenuSel ctermfg=lightyellow ctermbg=brown guibg=#333388
" hi PmenuSbar ctermbg=6
" hi PmenuThumb ctermfg=3
"
"
""""""""""""" spell
set spellcapcheck=0

"""""""""""" modeline
set modeline

"""""""""""" mkd - markdown
au FileType mkd set nofoldenable
au FileType mkd nmap ,e ysiw*
au FileType mkd vmap ,e S*
au FileType mkd nmap ds* F*xf*xb

au FileType mkd hi htmlItalic term=bold cterm=bold gui=bold ctermfg=231
au FileType mkd hi htmlBold term=bold cterm=bold gui=bold ctermfg=229
"
"""""""""""" highlith identifiaction
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" kolorowanie przykladow w helpie 
hi helpExample ctermfg=Magenta

" swap parameters
map <F12> "qdt,dwep"qpb
