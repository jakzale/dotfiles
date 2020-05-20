filetype plugin indent on
syntax enable
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
" Enabling spellchecking takes 30ms
" TODO:  Consider making this lazily enabled on first file
set spell

packadd! onedark
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Remap jk to esc
inoremap jk <esc>
nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>vs <cmd>source %<cr>
vnoremap <leader>vs y:@"<cr>

nnoremap <leader>ut <cmd>MundoToggle<cr>

nnoremap <leader>pf <cmd>Files<cr>
nnoremap <leader>pb <cmd>Buffers<cr>
nnoremap <leader>ps <cmd>Rg<cr>

let g:netrw_list_hide=netrw_gitignore#Hide().'^.git/$'
nnoremap <leader>le <cmd>20Lex<cr>

let g:LanguageClient_serverCommands = {
    \ 'rust'    : ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'haskell' : ['~/.local/bin/hie-wrapper', '--lsp'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'haskell' : ['stack.yaml', '*.cabal'],
    \ }

function! s:LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K  <cmd>call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd <cmd>call LanguageClient#textDocument_definition()<cr>
        nnoremap <buffer> <silent> <leader>lr <cmd>call LanguageClient#textDocument_rename()<cr>
    endif
endfunction

augroup LSP
    autocmd!
    autocmd FileType * call s:LC_maps()
augroup END

let g:deoplete#enable_at_startup = 1

let g:markdown_folding = 1
let g:markdown_fenced_languages = ['vim', 'bash=sh']

