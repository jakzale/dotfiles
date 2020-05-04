"dein Scripts-----------------------------
" Required:
set runtimepath+=/home/jakub/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/jakub/.cache/dein')
  call dein#begin('/home/jakub/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/jakub/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('junegunn/fzf.vim')
  call dein#add('neovim/nvim-lsp')
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('simnalamburt/vim-mundo')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


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

" Load fzf support
source /usr/share/doc/fzf/examples/fzf.vim

if expand("$TERM") ==# "alacritty" || expand("$TERM") ==# "xterm-256"
    set termguicolors
endif

nnoremap <leader>pf <cmd>Files<cr>
nnoremap <leader>pb <cmd>Buffers<cr>
nnoremap <leader>ps <cmd>Rg<cr>

