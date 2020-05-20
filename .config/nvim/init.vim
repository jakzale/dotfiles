filetype plugin indent on
syntax enable

" First of all, make jk exit
" TODO:  Consider using vim arpeggio
inoremap jk <esc>

" Enable persistent undo
set undofile

" Allow switching unchanged buffers
set hidden

" Make space the local leader
nnoremap <space> <nop>
let mapleader = "\<space>"

" Map Mundo
nnoremap <leader>ut <cmd>MundoToggle<cr>

" Use Cascadia Code
set guifont=Cascadia\ Code\ PL:h16

" show existing tabs with 4 spaces
set tabstop=4
" indent by 4 when pressing >
set shiftwidth=4
" use spaces instead of tabs
set expandtab

" use window titles
set title


if expand("$TERM") ==# "alacritty" || expand("$TERM") ==# "xterm-256"
    set termguicolors
endif

" Load fzf support
source /usr/share/doc/fzf/examples/fzf.vim

nnoremap <leader>pf <cmd>Files<cr>
nnoremap <leader>pb <cmd>Buffers<cr>
nnoremap <leader>ps <cmd>Rg<cr>

packadd! onedark
colorscheme onedark
let g:airline_theme='onedark'

" Do not display the -- INSERT -- in echo area
set noshowmode

" Window Tree (netrw)
let g:netrw_list_hide=netrw_gitignore#Hide().'^.git/$'
nnoremap <leader>le <cmd>20Lex<cr>

" Sourcing init vim faster
" source file
nnoremap <leader>vs <cmd>source %<cr>
" source visual range
vnoremap <leader>vs y:@"<cr>


nnoremap <leader>gs <cmd>Gstatus<cr>

" Hybrid numbering
set number relativenumber

" Language server config
let g:LanguageClient_serverCommands = {
    \ 'rust'    : ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'haskell' : ['~/.local/bin/hie-wrapper', '--lsp'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'haskell' : ['stack.yaml', '*.cabal'],
    \ }


function s:LC_maps()
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

" whitespace config
" let s:colors = onedark#GetColors()
"
" let g:better_whitespace_ctermcolor = s:colors.red.cterm
" let g:better_whitespace_guicolor   = s:colors.red.gui

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Markdown
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['vim', 'bash=sh']

" Spelling
set spelllang=en_gb,pl
set spell
