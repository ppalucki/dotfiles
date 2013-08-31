"""-------- pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
:Helptags

""" -------- GUI --------------
set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 9
" set guioptions-=TrRlLb
" set guioptions+=ic
set guioptions=aegmtic

"""------- kolorki
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
""autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
""au InsertLeave * match ExtraWhitespace /\s\+$/

"podglad numerow kolorow ~/download/xtrem-colortest -w -r syntax on musi byc "przed kolorkami
set t_Co=256
let g:molokai_original = 0
colorscheme molokai
hi Pmenu ctermfg=220 ctermbg=238 guibg=#511151
hi PmenuSel ctermfg=lightyellow ctermbg=brown guibg=#333388
hi PmenuSbar ctermbg=6
hi PmenuThumb ctermfg=3

""" ------ cursorline
" set cursorline
" hi CursorLine cterm=NONE ctermbg=234 guibg=NONE

""" ------ statusline
hi StatusLine ctermbg=black
hi StatusLineNC ctermbg=black
set laststatus=2
set statusline=%<\ %f\ %h%r%=%l/%L\ (%p%%) 

" set nonumber

""" ------- powerline
" inny colorscheme aby byla czarna lina przy vertical split
let g:Powerline_colorscheme='skwp' 
" wplywa na multipolcenie taloe jak leader \ev \es \s
set timeoutlen=1000
set scrolloff=6

""" -------- leader
let mapleader = ","

"""--------- hidden allow edited buffers
set hidden

set clipboard=unnamedplus
" set clipboard=autoselect

"""----------------------------- Python
"""--------- pythonmode
let g:pymode_motion = 1
let g:pymode_doc = 0
let g:pymode_folding = 0
" flakes + write dziala dosc szybko ale nie wykrywa wszystkich bledow let
let g:pymode_indent = 0 
let g:pymode_lint = 1
let g:pymode_rope = 0
" on save
let g:pymode_lint_write = 0 
let g:pymode_lint_onfly = 0
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_signs = 0
    
let g:pymode_syntax_highlight_equal_operator = 0
let g:pymode_syntax_highlight_stars_operator = 1
let g:pymode_syntax_highlight_self = 0
let g:pymode_syntax_builtin_types = 0

" pylint dziala lepiej ale jest zawolny na przy kazdym zapisie
" let g:pymode_lint_checker = "pylint"
let g:pymode_utils_whitespaces = 0
" auto jump on/off
let g:pymode_lint_jump = 1
let g:pymode_syntax_space_errors = 0
let g:pymode_syntax_indent_errors = 0
let g:pymode_lint_ignore = 'W402,W0611,C0324,W0612,W0511,C0323,W0622,C0302,W806,C0322,R0921,R0914,W0101,W801,W0404'
"let g:pymode_lint_select = 'E0611'
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = '<leader>ib'
let g:pymode_run = 0
let g:pymode_virtualenv = 1
"let g:pymode_run_key = '<leader>r'

nmap ]m ]M
nmap [m [M

function! PythonMappings()
	nmap <buffer> <leader>ip ofrom IPython import embed;embed()<ESC>:w<cr>
	" ipython debug 
	nmap <buffer> <leader>id oimport ipdb;ipdb.set_trace()<ESC>:w<cr>
	nmap <buffer> <leader>ic oimport ipdb;ipdb.cond=True<ESC>:w<cr>
	nmap <buffer> <leader>ir oimport ipdb<cr>if hasattr(ipdb,'cond'):ipdb.set_trace()<ESC>:w<cr>
	nmap <buffer> <leader>l :PyLint<cr>
	" " pudb debugger
	" nmap <buffer> <leader>iu o<esc>Simport pudb;pudb.set_trace()<ESC>:w<cr>
	"" fix na diff doget - z brancha johntyree python-mode
	" ounmap <silent> <buffer> o
	"" python run
	map <F9> :up<bar>!/usr/bin/env python %<CR>
	map <leader><F9> :up<bar>!/usr/bin/env python %  
    " map <leader>g :RopeGotoDefinition<cr>
    " works badly
    " inoremap <silent> <buffer> <tab> <C-R>=RopeCodeAssistInsertMode()<CR>
    "
    set nonumber
    compiler python
    " wytlacz elcim i signs
endfunction
au FileType python call PythonMappings()

"------------------------ RUBY
function! RubyMappings()
	""" binding pry 
	nmap <buffer> <leader>ip obinding.pry<ESC>:w<cr>
	""" ruby run
	nmap <buffer> <F9> :up\|!ruby %<cr> 
	imap <buffer> <F9> <Esc><f9>
	nmap <buffer> <leader><F9> :up\|!ruby % 
endfunction
au FileType ruby call RubyMappings()

" ruby/thor
au BufRead,BufNewFile *.thor set filetype=ruby

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

" numberlines toggle
nnoremap <leader>n :set invnumber<cr>

" 
" nnoremap <leader>p :set paste<cr>p:set nopaste<cr>

" quickfixclear
" nmap <leader>qc :QuickFixClear<cr>

""" -------- Standard options
" set nonumber
set nowrap
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

" delete without yank
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

""" move between windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h


""" wciecia
set smarttab
set expandtab
set autoindent
set tabstop=4 sw=4 softtabstop=4

"set smartindent
au FileType ruby set ts=2 sw=2 softtabstop=2
au FileType html set ts=2 sw=2 softtabstop=2 nocindent
au FileType python set ts=4 sw=4 softtabstop=4
au FileType mkd set shiftwidth=2

""" wyjscie z trybu insert przez wpisanie dwa razy jj
inoremap jj <ESC>

""" Backspace fix
set backspace=indent,eol,start


""" ------- NerdTree
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <leader><F2> :NERDTreeFind<CR>
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
" set Enter/Return to activate a node
let NERDTreeMapActivateNode='<CR>'
" always change CWD
let NERDTreeChDirMode = 2
" more colors 
let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$', '\~$']

""" -------- Ctags
map <leader><F8> :!ctags -f tags --verbose=yes --recurse=yes --exclude=tmp --fields=zK . <cr>
map <F8> :!ctags -f .tags --languages=HTML,Java,JavaScript,Python,Ruby --totals --verbose=no --recurse=yes --exclude=tmp --fields=zK . <cr>
" au FileType python map <F8> :!ctags -f .tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp . <cr>
au FileType python map <F8> :!ctags -f ._tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK .;fgrep -v kind:variable ._tags >.tags;rm ._tags<cr>
au FileType ruby map <F8> :!ctags -f .tags --languages=Ruby --langmap=Ruby:.rb.thor --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK . <cr>
""" tags file
set tags=.tags
"set tags+=./.tags
"set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
"set tags+=$HOME/.vim/tags/python.ctags


"" repeat last command
map <leader>r @:

""" rest doc riv run 
function! RstMappings()
	map <F9> :up<bar>!cd ..;make html<cr>
	map <leader><F9> :up<bar>!cd ..;make clean html<cr>
	""" fix of italic overbold!
	highlight rstEmphasis cterm=NONE ctermfg=3
endfunction
au FileType rst call RstMappings()
" let g:riv_link_cursor_hl=0


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
let g:tagbar_autoclose = 1
let g:tagbar_width = 60

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
"map <leader><F6> :Rfgrep<CR> map <leader>h :Rfgrep<cr> map <leader>h :Ack
"--py Ack bez jumpa
map <leader>h "ayiw:Ack! "<C-r>a"
vmap <leader>h "ay:Ack! "<C-r>a"
map <leader>H "ayiw:Ack! --all "<C-r>a"
vmap <leader>H "ay:Ack! --all "<C-r>a"
au FileType python map <buffer> <leader>h "ayiw:Ack! --python "<C-r>a"
au FileType python vmap <buffer> <leader>h "ay:Ack! --python  "<C-r>a"
au FileType ruby map <buffer> <leader>h "ayiw:Ack! --ruby "<C-r>a"
au FileType ruby vmap <buffer> <leader>h "ay:Ack! --ruby "<C-r>a"
au FileType rst map <buffer> <leader>h "ayiw:Ack! --rst "<C-r>a"
au FileType rst vmap <buffer> <leader>h "ay:Ack! --rst "<C-r>a"
" let g:ackprg = 'ag --nogroup --nocolor --column'
"
""" Search and replace
" http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim/5686810#5686810
nmap <leader>y :Qdo %s/<C-r>a//gc<left><left><left>
nmap <leader>Y :.,$s///gc<left><left><left>
vmap <leader>Y :s///gc<left><left><left>

" Ack z jumpa
" map <leader>H yiw:Ack! "<C-r>""
" vmap <leader>H y:Ack! "<C-r>""
" au FileType python map <leader>H yiw:Ack --python "<C-r>""
" au FileType python vmap <leader>H y:Ack --python  "<C-r>""
" au FileType ruby map <leader>H yiw:Ack --ruby "<C-r>""
" au FileType ruby vmap <leader>H y:Ack --ruby "<C-r>""


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
nnoremap <Leader>vc :Gcommit<cr>
nnoremap <Leader>vvc :Gcommit --verbose<cr>
nnoremap <Leader>vac :Gcommit --amend<cr>
" log current file
nnoremap <silent> <Leader>vl :Glog -n 50<cr>
" last 10 commits
nnoremap <Leader>vL :Glog -n 50 --<cr>
" gblame
nnoremap <Leader>vb :Gblame<cr>
vnoremap <Leader>vb :Gblame<cr>

nnoremap <Leader>vpl :Git pull<cr>
nnoremap <leader>vps :Git push<cr>
nnoremap <leader>vw :Gwrite<cr>
nnoremap <leader>vr :Gread<cr>

""" ---- buffers
" buffer write delete
map <leader>bw :w<bar>BD<cr>
" buffer delete
map <leader>bd :BD<cr>
" close all but this one (and not saved!)
map <leader>bo :BufOnly<cr>

""" navgigation goto
" au FileType ruby map <leader>g <C-]>
map <leader>g <C-]>

""" json
autocmd BufNewFile,BufRead *.json set ft=javascript

""" ConqueTerm
let g:ConqueTerm_ReadUnfocused = 1

""" -----------------------------
""" Screen Terminal
""" -----------------------------
" nie zamykaj screena bo czesto zabija mi dodatwkoeo konsole
" domsylnie kiluje wszystkie screene! a bez tego musze dwa razy zamykac vima
" let g:ScreenShellQuitOnVimExit = 0 
let g:ScreenShellHeight = 10
let g:ScreenShellGnuScreenVerticalSupport = 'native'
" terminal bash vertical
map <leader>tb :ScreenShellVertical bash<cr>
" terminal base horizontal
map <leader>tB :ScreenShell bash<cr>
" terminal send
vmap <leader>ts :ScreenSend<cr>
" termianal rerun 
map <leader>tr :up<bar>call ScreenShellSend("!!")<cr>
" terminal exit
map <leader>te :call ScreenShellSend('exit')<cr>
" terminal line - begin then send visual till end and terminal send
nmap <leader>tl _v$,ts
function! ScreenSendPaste1()
  let g:ScreenShellSendPrefix = '%cpaste'
  let g:ScreenShellSendSuffix = '--'
endfunction 
function! ScreenSendPaste2()
  let g:ScreenShellSendPrefix = ''
  let g:ScreenShellSendSuffix = ''
endfunction 
" terminal paste
vmap <leader>tp :<bs><bs><bs><bs><bs>call ScreenSendPaste1()<bar>'<,'>ScreenSend<cr>:call ScreenSendPaste2()<cr>
" terminal word - (send)
nmap <leader>tw viw<leader>ts
" terminal test
nmap <silent> <leader>tt :w<bar>call ScreenShellSend("./run_tests.py <c-r>=tagbar#currenttag('%s','')<cr>")<cr>
""" Dispatch & Make

" ORGinal nmap <leader>ty :compiler! python<cr>:set makeprg=./run_tests.py\ <c-r>=tagbar#currenttag('%s','')<cr><cr>:Make<cr>
py <<EOF
last_test_tag = None
from vim import eval as e
from vim import command as c
def _make_test(tag):
    c(':up')
    c(':compiler! python')
    c(r":set makeprg=./run_tests.py\ %s"%tag)
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

" terminal yank test
nmap <leader>ty :py make_current_test()<cr>
" terminal global test
nmap <leader>tg :py make_last_test()<cr>

" termianl yank all tests
nmap <leader>tY :compiler! python<cr>:set makeprg=./run_tests.py<cr><cr>:Make<cr>


""" pi_paren
" bez oznaczania nawiasow
let loaded_matchparen = 1


""" disable fold
set nofoldenable
au FileType rst set nofoldenable
au FileType python set nofoldenable
au FileType python set foldmethod=manual


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
    nnoremap <buffer> <leader>g :JavaSearchContext<cr>
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
    map <leader>g :ScalaSearch<cr>
endfunction
au FileType scala call ScalaMapping()
let g:EclimScalaSearchSingleResult = 'edit'

""" ECLIM
let g:EclimPythonValidate = 0
let g:EclimShowErrors = 1
" let g:EclimSignLevel = 0

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


""" ------ highlith identifiaction
""" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

""" kolorowanie przykladow w helpie 
hi helpExample ctermfg=Magenta

""" move parameter right
map <leader>m "qdt,dwep"qpb

""" gundo
" map <leader>u :GundoToggle<CR>

" find occurences - search current word but without scroll
nmap <leader>f "myiwh/<c-r>m<cr>

" fix na colory diffa (change bez tla - bylo szare)
" sprawdz kolory: colortest -w -s (w bashu!)
hi DiffChange ctermbg=NONE
hi DiffDelete ctermbg=53
hi DiffAdd ctermbg=53
hi DiffText ctermbg=52 

" set number

""" ----- ultisnip
let g:UltiSnipsListSnippets = '<c-l>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "myultisnips"]
let g:UltiSnipsJumpBackwardTrigger = '<c-u>'

""" ----- ctrlp
map <F3> :CtrlPBufTag<CR>
map <F4> :let g:ctrlp_mruf_relative=1<bar>CtrlPMRUFiles<CR>
map <leader><F4> :let g:ctrlp_mruf_relative=0<bar>CtrlPMRUFiles<CR>
map <F5> :CtrlPTag<CR>
map <F6> :CtrlPModified<CR>
map <leader><F6> :CtrlPBranch<CR>
map <F7> :CtrlPBuffer<CR>
" nmap <leader><F4> :CtrlPLine<cr>
" nmap <F6> :CtrlPChangeAll<cr>
" nmap <leader><F6> :CtrlPChange<cr>
nmap <leader>o :CtrlPChangeAll<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v(\.(git|hg|svn|bzr))|(htmlcov)|(tmp)$',
	\ 'file': '\v(\.(exe|so|dll|pyc|orig|class|tex|png|gif))|(index|MERGE_MSG|COMMIT_EDITMSG)|(\.LOCAL\..*)$',
	\ }

let g:ctrlp_match_window_bottom = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_exclude = '\v(\.git)'

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
nmap ,<C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zt<c-w>r<c-w><c-w>
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
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestEnhanced = 0
let g:SuperTabLongestHighlight = 1
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Settings for jedi-vim
" jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" TAB is reserved for omnifunc
" let g:jedi#autocompletion_command = "<tab>"
let g:jedi#auto_vim_configuration = 1
let g:jedi#goto_definition_command = "<leader>g"
let g:jedi#goto_assignemts_command = "<leader>d"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#usages_command = "<leader>z"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0
autocmd FileType python setlocal completeopt-=preview

" Open last/alternate buffer
noremap <Leader><Leader> <C-^>

" Map Q to repeat the last recorded macro
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

" python import
let g:pythontagimportcurrentword = "<leader>a"
let g:pythontagimport_from = 1
let g:pythontagimport_from_mod = 0
let g:pythontagimport_as = 0
let g:pythontagimport_full  = 0
let g:pythontagimport_prefix = 'getmedia.'

nmap cp :let @* = expand("%:p")<bar>let @+ = expand("%:p")<cr>

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
if has('pythonXXX')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    print 'activated: ', activate_this
EOF
endif

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
au FileType vim :nmap <F9> :%y<bar>@"<cr>

""" example of python
py <<EOF
def xxx():
    import vim
    # print 'oto vim'
    # print vim.current.window
    # print vim.current.buffer
    print vim.eval("tagbar#currenttag('%s','')")
EOF

nmap ,k :py xxx()<cr>

" vimroom
let g:vimroom_sidebar_height=0
" let g:vimroom_min_sidebar_width=100
let g:vimroom_background = "red"
let g:vimroom_width = 120

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
nnoremap <leader>uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>ue :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" yankring
let g:yankring_replace_n_pkey = '<c-n>'
let g:yankring_replace_n_nkey = '<c-q>'


" screenpaste
map  <Leader>p  <Plug>ScreenpastePut		" Normal, Visual mode
map! <Leader>p  <Plug>ScreenpastePut		" Insert, Command-line mode
map  <Leader>gp <Plug>ScreenpasteGPut		" Normal, Visual mode
nmap <Leader>P  <Plug>ScreenpastePutBefore	" Normal mode
nmap <Leader>gP <Plug>ScreenpasteGPutBefore	" Normal mode

