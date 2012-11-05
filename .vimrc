"""-------- pathogen
" install plugins in ~/.vim/bundle folder
" call pathogen#runtime_append_all_bundles()
filetype off
call pathogen#infect() 
filetype plugin indent on
call pathogen#helptags()   "load all helptags

""" 
" wplywa na multipolcenie taloe jak leader \ev \es \s
set timeoutlen=1000 
set scrolloff=10

"""--------- pythonmode
let g:pymode_folding = 0
let g:pymode_lint_write = 0
let g:pymode_utils_whitespaces = 0
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_jump = 1
"let g:pymode_syntax_indent_errors = 0
let g:pymode_syntax_space_errors = 0

"""-----------ipython
let g:ipy_perform_mappings = 0
let g:ipy_completefunc = 'global'
map <leader>i :IPython<CR>
map <leader>d :py get_doc_buffer()<CR>
map <leader>s :py if update_subchannel_msgs(force=True): echo("vim-ipython shell updated",'Operator')<CR>
nmap <S-F5> :python dedent_run_this_line()<CR>
vmap <S-F5> :python dedent_run_these_lines()<CR>
imap <C-F5> <C-O>:python dedent_run_this_line()<CR>
"

"""--------- hidden
" allow edited buffers
set hidden

""" save shift (lost repeat of t,f,T,F)
noremap ; :
"nnoremap : ;

""" delaing with .vimrc
noremap <leader>ev :e $MYVIMRC<CR>
noremap <leader>sv :so $MYVIMRC<CR>

""" ---------- quickfix window navigation
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" S for subsitute inner word from yanked text
nnoremap S "_diwP

"""-------------- ruby/thor
au BufRead,BufNewFile *.thor set filetype=ruby

""" -------- Standard options
syntax on 
set nonumber
set nowrap
"set paste
set comments=

""" search
set incsearch
set smartcase
set ignorecase
"set hlsearch             " highlight search

""" wciecia
set smarttab
set expandtab
set autoindent
set ts=4 sw=4 softtabstop=4
"set smartindent
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
ab ipy from IPython import embed;embed()<ESC>
ab eke from IPython import embed_kernel;embed_kernel()
ab pdb import pdb;pdb.set_trace()
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
map <F8> :!find -type f -name "*.py" \| xargs ctags --totals --python-kinds=-i-v
map <leader><F8> :!ctags --verbose=yes --recurse=yes .
set tags+=.tags
"set tags+=./.tags
"set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
"set tags+=$HOME/.vim/tags/python.ctags

""" ---- IDE Pyhon 
"" script exectue
"map <silent><F9> :!/usr/bin/env python %<CR>

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
map <leader><F3> :FufQuickfix<CR>
map <F4> :FufMruFile<CR>
map <F5> :FufTag!<CR>
map <leader><F5> :FufTag<CR>
map <F6> :FufCoverageFile<CR>
map <leader><c-t> :FufCoverageFile<CR>
map <F7> :FufBuffer<CR>

"defaults: let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', ]
let g:fuf_modesDisable = [ 'mrucmd', ]
let g:fuf_coveragefile_globPatterns = ['**/*.rb', '**/*.erb', '**/*.haml', '**/*.html', '**/*.xml', '**/*.js', '**/*.sh', '**/*.py', '**/*.yml', 'Gemfile', '**/*.thor', '**/*.rake', '**/*.yaml', '**/signed_curl'] 
let g:fuf_maxMenuWidth = 240
let g:fuf_ignoreCase = 0
let g:fuf_fuzzyRefining = 0

""" ----- mouse
"set mouse=a
"set ttymouse=xterm2

""" ----- grep (plugin) 
let Grep_Default_Filelist = '*.rb *.py *.html *.erb *.js *.sh *.thor *.rake *.yaml'
let Grep_Default_Options = '-i'
let Grep_OpenQuickfixWindow = 1
"map <leader><F6> :Rfgrep<CR>
map <leader><c-h> :Rfgrep<CR>

""" ------ cursorline
set cursorline
hi CursorLine cterm=NONE ctermbg=233

""" ---- statusline
set laststatus=2
set statusline=%<\ %f\ %h%r%=%l/%L\ (%p%%) 

""" ---- saveall shortcut
map ZA :wall<CR>
map ZW :qa<CR>
map ZX :w<CR>


""" --- komentarze map
"map <C-/> <C-C>

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
