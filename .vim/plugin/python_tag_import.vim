"==================================================
" File:         python_tag_import.vim
" Brief:        python_tag_import import shortcut based on tags file
" Author:       Michael Brown <michael@ascetinteractive.com>
" Last Change:  2010-2-26
" Version:      0.3.1
"
" Install:      1. Put python_tag_import.vim to plugin
"                  directory.
"
" Usage:
"
"           You need a ctags file with the --fields=+i
"           option set
"
"           on a new line type the function you want to import
"           then hit the complete key
"
"           hotkey:
"               insert mode map.
"               <c-b> is the current default.
"
"           variables:
"
"               let g:pythontagimportkey = "<c-x><c-i>"
"
"               the key used to complete function
"               parameters and key words.
"
"
"               let g:pythontagimportcurrentword = "<leader>i"
"
"               This key map creates an import statement for the <cword>
"               in normal mode
"
"               let g:pythontagimport_from = 0
"
"               turns off
"               from  foo.bar.module import funcname

"               let g:pythontagimport_from_mod = 0
"
"               turns off
"               from foo.bar import module #module.funcname

"               let g:pythontagimport_as = 0
"
"               turns off
"               import foo.bar.module as module #module.funcname

"               let g:pythontagimport_full  = 0
"
"               turns off
"               import foo.bar.module #foo.bar.module.funcname
"
"
"Limitations:
"
"           Completion is created through inspecting the filename
"           in the tags file so functions that are rereferenced will not be
"           picked up.
"
"Options:
"           Setting the path can keep options relevant. At tht moment
"           it defaults to sys.path
"           Eg.
"           let g:python_path = ['/usr/lib/python2.4/site-packages/']
"==================================================

if v:version < 700
    finish
endif

" Variable Definitions: {{{1
" options, define them as you like in vimrc:
if !exists("g:pythontagimportkey")
    let g:pythontagimportkey = "<c-b>"   "hotkey
endif

if !exists("g:pythontagimportcurrentword")
    let g:pythontagimportcurrentword = "<leader>i"   "hotkey
endif

"This  gives the option to turn off methods you dont like
if !exists("g:pythontagimport_from")
    let g:pythontagimport_from = 1
endif

if !exists("g:pythontagimport_from_mod")
    let g:pythontagimport_from_mod = 1
endif

if !exists("g:pythontagimport_as")
    let g:pythontagimport_as = 1
endif

if !exists("g:pythontagimport_full")
    let g:pythontagimport_full  = 1
endif
" ----------------------------

" Autocommands:
autocmd BufReadPost,BufNewFile *.py call PythonTagImportStart()

" Menus:
menu <silent>       &Tools.Python\ Tag\ Complete\ Start          :call PythonTagImportStart()<CR>
menu <silent>       &Tools.Python\ Tag\ Complete\ Stop           :call PythonTagImportStop()<CR>

" Function Definations:

function! PythonTagImportStart()
    exec "silent! iunmap  <buffer> ".g:pythontagimportkey
    exec "inoremap <buffer> ".g:pythontagimportkey."  <c-r>=PythonTagImportComplete()<cr>"
    exec "nnoremap <buffer> ".g:pythontagimportcurrentword."  yiwO<esc>pA<C-R>=PythonTagImportComplete()<CR>"
endfunction

function! PythonTagImportStop()
    exec "silent! iunmap <buffer> ".g:pythontagimportkey
endfunction


if !exists('g:python_path')
    python import sys;import vim;vim.command("let g:python_path = %s" % str(sys.path))
else
    let g:python_path = g:python_path + [getcwd()]
endif

function!PythonTagImportComplete()
    if match(getline('.'),'^\s*\w\+\s*$') == -1
        return ''
    endif

    let curtag = getline('.')
    let tag_list = []
    let tag_list = taglist(curtag)
    let s:pythontagcomplete_selected = ''

    let s:pythontagcomplete_list = []

    for tag in tag_list
        if tag['kind'] != 'm'
            for path in g:python_path
                let filename = tag['filename']
                if match(filename, path) != -1 || match(filename,'^\w') != -1
                    let filename = substitute(filename, path, '','')
                    let filename=substitute(filename, "/", '.', 'g')
                    let filename=substitute(filename, ".__init__.py", "", "")
                    let filename=substitute(filename, "\.py$", "", "")
                    "        let filename=substitute(filename, ".$", "", "")
                    let filename=substitute(filename, "^\\.", "", "")

                    let a_modname = split(filename, '\.')
                    let modname = a_modname[-1]

                    if (g:pythontagimport_from)
                        let from_import = 'from ' . filename . " import " . curtag
                        let s:pythontagcomplete_list += [from_import]
                    endif

                    if (g:pythontagimport_as)
                        let mod_import = "import " . filename . " as " . modname .
                                    \"  #" . modname . '.' . curtag
                        let s:pythontagcomplete_list += [mod_import]
                    endif

                    if (g:pythontagimport_from_mod && len(a_modname) > 1)
                        let mod_import = "from " . join(a_modname[0:-2], '.') .  " import " . modname .
                                    \"  #" . modname . '.' . curtag
                        let s:pythontagcomplete_list += [mod_import]
                    endif

                    if (g:pythontagimport_full)
                        let s:pythontagcomplete_list += ["import " .
                                    \ filename . " #" . filename . "." . curtag]
                    endif
                endif
            endfor

        endif
    endfor

    if s:pythontagcomplete_list==[]
        return ''
    endif

    exec "norm diw"
    call  complete(col('.'),s:pythontagcomplete_list)
    return ''

endfunction
