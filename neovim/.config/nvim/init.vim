" filetype plugin indent on
" syntax enable
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
nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>vs <cmd>source %<cr>
vnoremap <leader>vs y:@"<cr>

nnoremap <leader>/ <cmd>nohlsearch<cr>

nnoremap <leader>ut <cmd>MundoToggle<cr>

" FZF
" source /usr/share/doc/fzf/examples/fzf.vim
nnoremap <leader>pf <cmd>Files<cr>
nnoremap <leader>pb <cmd>Buffers<cr>
nnoremap <leader>ps <cmd>Rg<cr>

" Fugitive
nnoremap <leader>gg <cmd>Gstatus<cr>

" Project sidebar
let g:netrw_list_hide=netrw_gitignore#Hide().'^.git/$'
nnoremap <leader>le <cmd>20Lex<cr>

" LSP
let g:LanguageClient_serverCommands = {
    \ 'rust'    : ['rustup', 'run', 'stable', 'rls'],
    \ 'haskell' : ['haskell-language-server-wrapper', '--lsp'],
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

" Deoplete
let g:deoplete#enable_at_startup = 1

" Markdown
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['vim', 'bash=sh']

