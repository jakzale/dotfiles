" vim: set fdm=marker :
let g:python3_host_prog='/usr/bin/python3'

set undofile
set hidden
set guifont=Cascadia\ Code\ PL:h16
set tabstop=4
set shiftwidth=4
set expandtab
set title
set termguicolors
set noshowmode
set number relativenumber
" prefer british spelling
set spelllang=en_gb
" Disable spelling by default
set nospell

" colorscheme
packadd! onedark
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" whitespace colors
let s:colors = onedark#GetColors()
let g:better_whitespace_ctermcolor = s:colors.red.cterm
let g:better_whitespace_guicolor   = s:colors.red.gui

" Remap jk to esc
inoremap jk <esc>

" Remap jk to esc in term mode
tnoremap jk <c-\><c-n>

nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>vs <cmd>source %<cr>
vnoremap <leader>vs y:@"<cr>


nnoremap <leader>/ <cmd>nohlsearch<cr>

nnoremap <leader>ut <cmd>MundoToggle<cr>

" FZF {{{
set rtp+=~/.fzf

" A simple attempt to implement quick file switcher
nnoremap <leader><leader> :call fzf#vim#grep(
    \ 'rg --files',
    \ fzf#vim#with_preview())<cr>

nnoremap <leader>pf <cmd>Files<cr>
nnoremap <leader>pb <cmd>Buffers<cr>
nnoremap <leader>ps <cmd>Rg<cr>
" }}}

" Fugitive {{{
nnoremap <leader>gg <cmd>Gstatus<cr>
" }}}

" Project Sidebar {{{
let g:netrw_list_hide=netrw_gitignore#Hide().'^.git/$'
nnoremap <leader>le <cmd>20Lex<cr>
" }}}

" LSP {{{
let g:LanguageClient_serverCommands = {
    \ 'rust'    : ['rust-analyzer'],
    \ 'haskell' : ['haskell-language-server-wrapper', '--lsp'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'haskell' : ['stack.yaml', '*.cabal'],
    \ }

" Force fzf ui
let g:LanguageClient_selectionUI = "fzf"

function! s:LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K          <cmd>call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd         <cmd>call LanguageClient#textDocument_definition()<cr>
        nnoremap <buffer> <silent> <leader>lr <cmd>call LanguageClient#textDocument_rename()<cr>

        " nnoremap <F5> :call LanguageClient_contextMenu()<CR>
        nnoremap <buffer> <silent> <leader>lm :call LanguageClient_contextMenu()<cr>
        nnoremap <buffer> <silent> <leader>lk :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> <leader>lg :call LanguageClient#textDocument_definition()<cr>
        nnoremap <buffer> <silent> <leader>lr :call LanguageClient#textDocument_rename()<cr>
        nnoremap <buffer> <silent> <leader>lf :call LanguageClient#textDocument_formatting()<cr>
        nnoremap <buffer> <silent> <leader>lb :call LanguageClient#textDocument_references()<cr>
        nnoremap <buffer> <silent> <leader>la :call LanguageClient#textDocument_codeAction()<cr>
        nnoremap <buffer> <silent> <leader>ls :call LanguageClient#textDocument_documentSymbol()<cr>
        nnoremap <buffer> <silent> <leader>lc :call LanguageClient#handleCodeLensAction()<cr>
    endif
endfunction

augroup LSP
    autocmd!
    autocmd FileType * call s:LC_maps()
augroup END

" }}}

" Deoplete
let g:deoplete#enable_at_startup = 1

" Markdown
" TODO:  Not sure if g:markdown_folding makes sense here
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['vim', 'bash=sh']

