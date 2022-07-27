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

 " Jump to next placeholder
inoremap ,, <Esc>/<++><Enter>df>a
inoremap [] []<++><esc>T[i
inoremap {} {}<++><esc>T{i
inoremap () ()<++><esc>T(i

" special keybindings
inoremap ,ref \ref{}<++><Esc>T{i
inoremap ,label \label{}<++><Esc>T{i
inoremap ,cite \cite{}<++><Esc>T{i
inoremap ,fullcite \fullcite{}<++><Esc>T{i
inoremap ,bf \textbf{}<++><Esc>T{i
inoremap ,it \textit{}<++><Esc>T{i
inoremap ,tt \texttt{}<++><Esc>T{i
inoremap ,sc \textsc{}<++><Esc>T{i
inoremap ,abd \ac{}<++><Esc>T{i
inoremap ,abs \acs{}<++><Esc>T{i
inoremap ,abl \acl{}<++><Esc>T{i
inoremap ,abp \acp{}<++><Esc>T{i
inoremap ,gls \gls{}<++><Esc>T{i
inoremap ,glsp \glspl{}<++><Esc>T{i

inoremap ,begin \begin{}<++><ESC>o<++><ESC>kT{i
inoremap ,end \end{}<++><ESC>0t{la
inoremap ,item \item
inoremap ,, <Esc>/<++><Enter>df>a
nnoremap ,, /<++><ENTER>df>a
inoremap [] []<++><esc>T[i
inoremap {} {}<++><esc>T{i

inoremap SEC \section{}<++><esc>T{i
inoremap SUSEC \subsection{}<++><esc>T{i
inoremap SUSUSEC \subsubsection{}<++><esc>T{i
autocmd VimLeave *.tex !texclear %
" Exposes the plugin's functions for use as commands in Vim.
" command! -nargs=0 DisplayTime call example-plugin#DisplayTime()
" command! -nargs=0 DefineWord call example-plugin#DefineWord()
" command! -nargs=0 AspellCheck call example-plugin#AspellCheck()
    
nnoremap <leader>ba :!make all -C <c-r>=FindProjectRoot('Makefile')<cr><cr>
nnoremap <leader>bc :!make chapters -C <c-r>=FindProjectRoot('Makefile')<cr><cr>
nnoremap <leader>bi :!make intro -C <c-r>=FindProjectRoot('Makefile')<cr><cr>

" Open zathura
nnoremap <leader>v :!vim_opener %:p <CR><CR>

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
nnoremap <leader>bn :!latexmk -g -pdf %<cr>
