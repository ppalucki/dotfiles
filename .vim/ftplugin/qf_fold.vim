" by http://vim.wikia.com/wiki/Fold_quickfix_list_on_directory_or_file_names
"
setlocal foldlevel=0
setlocal foldmethod=expr
setlocal foldexpr=matchstr(getline(v:lnum),'^[^\|]\\+')==#matchstr(getline(v:lnum+1),'^[^\|]\\+')?1:'<1'

" if foldclosedend(1) == line('$') || line("$") < 5
"   " When all matches come from a single file, do not close that single fold;
"   " the user probably is interested in the contents.  Likewise if few results.
"   setlocal foldlevel=1
" else
"   setlocal foldlevel=0
" endif
