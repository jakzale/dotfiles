"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

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
  call dein#add('simnalamburt/vim-mundo')
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

" Make space the local leader
nnoremap <space> <nop>
let mapleader = "\<space>"

" Map Mundo
nnoremap <leader>ut :MundoToggle<cr>
