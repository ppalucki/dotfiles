""" -------- GUI --------------
set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 9
" set guioptions-=TrRlLb
" set guioptions+=ic
set guioptions=aegmtic

"""-------- pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
:Helptags

"""------- kolorki
"podglad numerow kolorow ~/download/xtrem-colortest -w -r syntax on musi byc "przed kolorkami
set t_Co=256
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
set laststatus=2
set statusline=%<\ %f\ %h%r%=%l/%L\ (%p%%) 

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
set number

"""----------------------------- Python
"""--------- pythonmode
let g:pymode_motion = 1
let g:pymode_doc = 0
let g:pymode_folding = 0
" flakes + write dziala dosc szybko ale nie wykrywa wszystkich bledow let
"let g:pymode_indent = 1 
let g:pymode_lint = 1
let g:pymode_rope = 1
let g:pymode_lint_write = 0
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_signs = 0
" pylint dziala lepiej ale jest zawolny na przy kazdym zapisie
let g:pymode_lint_checker = "pylint"
let g:pymode_utils_whitespaces = 0
" auto jump on/off
let g:pymode_lint_jump = 1
let g:pymode_syntax_space_errors = 0
let g:pymode_syntax_indent_errors = 0
let g:pymode_lint_ignore = 'W402,W0611,C0324,W0612,W0511,C0323,W0622,C0302,W806,C0322,R0921,R0914,W0101,W801,W404'
"let g:pymode_lint_select = 'E0611'
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = '<leader>ib'
let g:pymode_run = 0
let g:pymode_virtualenv = 1
"let g:pymode_run_key = '<leader>r'

function PythonMappinga()
	nmap <buffer> <leader>ip o<esc>Sfrom IPython import embed;embed()<ESC>:w<cr>
	" ipython debug 
	nmap <buffer> <leader>id o<esc>Simport ipdb;ipdb.set_trace()<ESC>:w<cr>
	" pudb debugger
	nmap <buffer> <leader>iu o<esc>Simport pudb;pudb.set_trace()<ESC>:w<cr>
	"" fix na diff doget
	au FileType python ounmap <buffer> o
	"" python run
	map <F9> :w<bar>!/usr/bin/env python %<CR>
	map <leader><F9> :w<bar>!/usr/bin/env python %  
endfunction
au FileType python PythonMappings()

"------------------------ RUBY
function RubyMappings()
	""" binding pry 
	nmap <buffer> <leader>ip obinding.pry<ESC>:w<cr>
	""" ruby run
	nmap <F9> :w\|!ruby %<cr> 
	imap <F9> <Esc><f9>
	nmap <leader><F9> :w\|!ruby % 
endfunction
au FileType ruby RubyMappings()

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
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" S for subsitute inner word from yanked text
nnoremap <leader>s "_diwP

" numberlines toggle
nnoremap <leader>n :set invnumber<cr>

" pasttoggle
nnoremap <leader>p :set paste!<cr>

""" -------- Standard options
set nonumber
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
map <leader>/ :nohlsearch<CR>

" delete without yank
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

""" switch buffers
map <C-h> :bp<CR>
map <C-l> :bn<CR>

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

""" ------- AutoComplete fix
set completeopt=longest,menuone

""" ------- NerdTree
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <leader><F2> :NERDTreeFind<CR>:wincmd p<CR>
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
map <leader><F8> :!ctags -f tags --verbose=yes --recurse=yes . 
map <F8> :!ctags -f .tags --languages=HTML,Java,JavaScript,Python,Ruby --totals --verbose=no --recurse=yes .
au FileType python map <F8> :!ctags -f .tags --languages=Python --verbose=no --totals --recurse=yes . 
au FileType ruby map <F8> :!ctags -f .tags --languages=Ruby --langmap=Ruby:.rb.thor --verbose=no --totals --recurse=yes . 
""" tags file
set tags=.tags
"set tags+=./.tags
"set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
"set tags+=$HOME/.vim/tags/python.ctags


"" repeat last command
map <leader>r @:

""" rest doc riv run 
function RstMappings()
	map <F9> :w<bar>!cd ..;make html<cr>
	map <leader><F9> :w<bar>!cd ..;make clean html<cr>
	""" fix of italic overbold!
	:highlight rstEmphasis cterm=NONE ctermfg=3
endfunction
au FileType rst call RstMappings()
" let g:riv_link_cursor_hl=0


""" ------  Last position
"This autocommand jumps to the last known position in a file just after
"opening it, if the '"' mark is set:
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

""" ------ sudo write
command! W w !sudo tee % > /dev/null

""" ----- fuzzyfinder
map <F3> :FufBufferTag<CR>
map <leader><F3> :TagbarToggle<CR>
map <F4> :FufMruFileInCwd<CR>
map <leader><F4> :FufMruFile<CR>
map <F5> :FufBuffer<CR>
map <leader><F5> :FufQuickfix<CR>
map <F6> :FufFile<CR>
map <leader><F6> :FufCoverageFile<CR>
map <F7> :FufTag!<CR>
map <leader><F7> :FufTag<CR>
map <leader>o :FufJumpList<CR>

let g:fuf_modesDisable = [ 'mrucmd', ]
let g:fuf_coveragefile_globPatterns = ['**/*.rb', '**/*.erb', '**/*.haml', '**/*.html', '**/*.xml', '**/*.js', '**/*.sh', '**/*.py', '**/*.yml', 'Gemfile', '**/*.thor', '**/*.rake', '**/*.yaml', '**/signed_curl', '**/*.rst', '**/*.json', '**/*.java', '**/*.xhtml', '**/*.sql']
let g:fuf_maxMenuWidth = 240
let g:fuf_ignoreCase = 1
let g:fuf_mrufile_maxItem = 6000
let g:fuf_mrufile_maxItemDir = 1500
let g:fuf_learningLimit = 1000
let g:fuf_autoPreview = 1

""" ----- mouse
"set mouse=a set ttymouse=xterm2
set nomousehide

""" ----- grep (plugin) 
let Grep_Default_Filelist = '*.rb *.py *.html *.erb *.js *.sh *.thor *.rake *.yaml'
let Grep_Default_Options = '-i'
let Grep_OpenQuickfixWindow = 1
let Grep_Skip_Dirs = 'tmp'
let Grep_Shell_Escape_Char = '\'
"NOT USED
"map <leader><F6> :Rfgrep<CR> map <leader>h :Rfgrep<cr> map <leader>h :Ack
"--py Ack bez jumpa
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


""" ---- saveall shortcut
map ZA :wall<CR>
map ZW :qa<CR>
""" write/quit
map <leader>w :w<CR>
map <leader>q :q<CR>


""" VCS (git bzr)
"vimdiff current vs git head (fugitive extension)
nnoremap <Leader>vd :Gdiff<cr>
"switch back to current file and closes fugitive buffer
nnoremap <Leader>vD :diffoff!<cr><c-w>h:bd<cr>
nnoremap <Leader>vs :Gstatus<cr>
nnoremap <Leader>vc :Gcommit<cr>
" log current file
nnoremap <Leader>vl :Glog<cr>
" last 10 commits
nnoremap <Leader>vL :Glog -n 10 --<cr>
" gblame
nnoremap <Leader>vb :Gblame<cr>
vnoremap <Leader>vb :Gblame<cr>

nnoremap <Leader>vpl :Git pull<cr>
nnoremap <leader>vps :Git push<cr>
nnoremap <leader>vw :Gwrite<cr>
" nnoremap <leader>vr :Gread<cr> # danger!

""" ---- buffers
" buffer write delete
map <leader>bwd :w<bar>BD<cr>
" buffer delete
map <leader>bd :BD<cr>
" close all but this one (and not saved!)
map <leader>bo :BufOnly<cr>

""" navgigation goto
" au FileType ruby map <leader>g <C-]>
map <leader>g <C-]>
au FileType python map <leader>g :RopeGotoDefinition<cr>

""" json
autocmd BufNewFile,BufRead *.json set ft=javascript

""" ConqueTerm
let g:ConqueTerm_ReadUnfocused = 1

""" Screen
let g:ScreenShellHeight = 10
map <leader>tb :ScreenShell bash<cr>
vmap <leader>ts :ScreenSend<CR>
" termianal run 
map <leader>tr :w<bar>call ScreenShellSend("!!")<cr>
map <leader>te :call ScreenShellSend('exit')<cr>
" terminal line - begin then send visual till end and terminal send
nmap <leader>tl _v$,ts
" terminal word - (send)
nmap <leader>tw viw<leader>ts


""" pi_paren
" bez oznaczania nawiasow
let loaded_matchparen = 1

""" disable fold
set nofoldenable
au FileType rst set nofoldenable

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
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0

" set noswapfile

" slowness fix!!!
au FileType ruby set nocursorline set foldmethod=manual 
au FileType rst set nocursorline

" ----------------------------------------- JAVA ECLIM
function JavaMapping()
    " ----------- run
    "- Executes the java using your project's main class.
nmap <F9> :w<bar>:Java<cr>
imap <F9> <Esc><F9>

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
    "- Create both a java bean getter and setter method.
    nnoremap <leader>jg :JavaGetSet<cr>
    "- Creates class constructor, either empty or based on selected class
    "fields.
    nnoremap <leader>jc :JavaConstructor<cr>

    " ------------ view
    "- View the type hierarchy tree.
    nnoremap <leader>jh :JavaHierarchy<cr>
    "- View implementable / overridable methods from super classes and
    "implemented interfaces.
    nnoremap <leader>ji :JavaImpl<cr>
    "- View list of methods that delegate to the field under the cursor.
    nnoremap <leader>jd :JavaDelegate<cr>

    " --------- junit
    " [testcase] - Allows you to execute junit test cases.
    nnoremap <leader>ju :JUnit
    "- Attempts to find the corresponding test for the current source file.
    nnoremap <leader>juf :JUnitFindTest<cr>
    "- Similar to :JavaImpl, but creates test methods.
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
    nnoremap <leader>jf :JavaCorrect<cr>



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
    nnoremap <buffer> <leader>gq :JavaFormat<cr>

    " --------------- javadoc generation
    "[file, file, ...] - Executes the javadoc utility against all or just the supplied source files.
    "jd zajete przez javadelegate
    " nnoremap <leader>jd :Javadoc

    " --------------- config
    " super tab for java uses user completetions
    let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
    let g:EclimJavaSearchSingleResult = "edit"

endfunction
au FileType java call JavaMapping()


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

" move parameter right
map <leader>m "qdt,dwep"qpb

" gundo
map <leader>u :GundoToggle<CR>


" find occurences - search current word but without scroll
nmap <leader>f yiwh/<c-r>"<cr>

" fix na colory diffa (change bez tla - bylo szare)
" sprawdz kolory: colortest -w -s (w bashu!)
hi DiffChange ctermbg=NONE
hi DiffDelete ctermbg=53
hi DiffAdd ctermbg=53
hi DiffText ctermbg=52 

""" dziala tylko przy starcie
if &diff
    set nonumber
else
    set number
end


