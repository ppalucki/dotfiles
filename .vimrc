"""-------- pathogen
" install plugins in ~/.vim/bundle folder
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
":call pathogen#helptags()   "load all helptags

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
set scrolloff=2

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
ab bpry binding.pry<ESC>
ab deb debugger

""" -------- jumps
" map <m-left> :jumps  "nie dziala!

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
imap <C-w> <ESC>

"" Turn on NERDTree on startup
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" NERDTreeFind on open - nie dziala
"autocmd BufEnter * NERDTreeFind
"autocmd BufEnter * wincmd p


""" ------- rails.vim OpenURL
command -bar -nargs=1 OpenURL :!"c:\Program Files\Mozilla Firefox\firefox.exe" <args>
map <leader><c-g> :A<CR>

""" ------- TagList (outline)
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Show_One_File = 1
"map <leader> <F3> :TlistToggle<CR>

""" ------- ruby IDE
nmap <A-e> :w\|rubyf ./%
imap <A-e> <Esc>:w\|rubyf ./%
nmap <F10> :w\|!ruby %<CR>
imap <F10> <Esc>:w\|!ruby %<CR>

""" -------- Ctags
"map <F7> :!ctags **/*.       
map <F7> :!find -type f -name "*.rb" \| xargs ctags --totals
map <leader><F7> :!ctags --verbose=yes --recurse=yes .
set tags+=./tags
set tags+=tags
set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
"set tags+=$HOME/.vim/tags/python.ctags

""" ---- IDE Pyhon 
"" script exectue
map <silent><F9> :!/usr/bin/env python %<CR>

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
command W w !sudo tee % > /dev/null

""" ----- fuzzyfinder
map <F3> :FufBufferTag<CR>
map <leader><c-o> :FufBufferTag<CR>
map <F4> :FufMruFile<CR>
map <c-3> :FufMruFile<CR>
map <F5> :FufBuffer<CR>
map <leader><F5> :FufQuickfix<CR>
map <F6> :FufCoverageFile<CR>
map <leader><c-t> :FufCoverageFile<CR>
"defaults: let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', ]
let g:fuf_modesDisable = [ 'mrucmd', ]
let g:fuf_coveragefile_globPatterns = ['**/*.rb', '**/*.erb', '**/*.haml', '**/*.html', '**/*.xml', '**/*.js', '**/*.sh', '**/*.py', '**/*.yml', 'Gemfile', '**/*.thor', '**/*.rake', '**/*.yaml', '**/signed_curl'] 
let g:fuf_maxMenuWidth = 140

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

""" ---- TagList
let Tlist_Show_One_File = 1


""" --- komentarze map
map <C-/> <C-C>

""" --- json
autocmd BufNewFile,BufRead *.json set ft=javascript
