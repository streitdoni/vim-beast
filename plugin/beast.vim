" Title:        Example Plugin
" Description:  A plugin to provide an example for creating Vim plugins.
" Last Change:  8 November 2021
" Maintainer:   Example User <https://github.com/example-user>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_vim_beast")
    finish
endif
let g:loaded_vim_beast = 1

" Exposes the plugin's functions for use as commands in Vim.
" command! -nargs=0 DisplayTime call example-plugin#DisplayTime()
" command! -nargs=0 DefineWord call example-plugin#DefineWord()
" command! -nargs=0 AspellCheck call example-plugin#AspellCheck()
    
nnoremap <leader>ba :!make all -C <c-r>=FindProjectRoot('Makefile')<cr><cr>
nnoremap <leader>bc :!make chapters -C <c-r>=FindProjectRoot('Makefile')<cr><cr>
nnoremap <leader>r :!make clean -C <c-r>=FindProjectRoot('Makefile')<cr><cr>
function! FindProjectRoot(lookFor)
    let pathMaker='%:p'
    while(len(expand(pathMaker))>1)
        let pathMaker=pathMaker.':h'
        let fileToCheck=expand(pathMaker).'/'.a:lookFor
        if filereadable(fileToCheck)||isdirectory(fileToCheck)
            return expand(pathMaker)
        endif
    endwhile
    return 0
endfunction
