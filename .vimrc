set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" <plugins>
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle 'ervandew/supertab'
Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'majutsushi/tagbar'

Bundle 'Yggdroot/indentLine'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'

" Bundle 'jlanzarotta/bufexplorer'

Bundle 'klen/python-mode'
Plugin 'mitsuhiko/vim-python-combined'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tomtom/tlib_vim.git'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

Bundle 'kien/ctrlp.vim'

" For session
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

Plugin 'tpope/vim-surround'
Bundle 'othree/xml.vim'

Bundle 'xolox/vim-notes'
Bundle 'itchyny/calendar.vim'


" Take a look in future
" Bundle 'amiorin/vim-project'
" </plugins>


call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on
filetype on
syntax on


" Airline fix https://github.com/vim-airline/vim-airline/issues/20
set laststatus=2

let xml_use_xhtml = 1
let xml_no_html = 1

" Auto change directory
autocmd BufEnter * silent! lcd %:p:h

" Show undone commands
set showcmd

let g:notes_directories = ['/pony/.vim-notes/',]

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


" Для работы при русской раскладке
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>


" set charset translation encoding
set encoding=utf-8
" set terminal encoding
set termencoding=utf-8
" set save encoding
set fileencoding=utf-8

set fileencodings=utf8,koi8r,cp1251,cp866,ucs-2le


" Buffer could be swiched without save
set hidden


" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
nmap <C-v> "+p
imap <C-v> <ESC>"+pa


map <c-j> 7j
map <c-k> 7k
map <c-l> 7l
map <c-h> 7h


set number

" Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround
set autoindent
set wildmode=longest,list,full
set wildmenu

" Everything for search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remove search results highlight
noremap <C-h> :nohl<CR>


" endless undo & redo
set undodir=~/.vim/backup/undo 
" enable endless undo & redo
set undofile
" Count of saved undo & redo steps
set undolevels=1000


" Backup and swap files
set backupdir=~/.vim/backup/backup
set directory=~/.vim/backup/swap

" Close buffer
map <C-x> :bd<CR>


" PYTHON: If string longer than 80 symbols, change it's color
autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
autocmd FileType python match Excess /\%80v.*/

" PYTHON: max textwidth
autocmd FileType python setlocal tw=80
autocmd FileType python setlocal cc=+1

" PYTHON: Color for limit line
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=#333333


" Jedi
let g:jedi#show_call_signatures = "1"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "right"

let g:SuperTabDefaultCompletionType = "<c-n>"


" Do not enable airline for not gui version
if has('gui_running')
    let g:airline_powerline_fonts = 1
    let g:airline_theme='hybrid'
    set guifont=Liberation\ Mono\ for\ Powerline\ 10 
endif


" CtrlP (buffers manager)
nnoremap <silent> <F3> :CtrlPBuffer<CR>
nnoremap <silent> <F5> :CtrlPMixed<CR>


"Python-mode
let g:pymode_trim_whitespaces = 1
let g:pymode_indent = 1
let g:pymode_folding = 0
let g:pymode_virtualenv = 0
let g:pymode_run = 0
let g:pymode_lint = 1
let g:pymode_lint_cwindow = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" let g:pymode_lint_ignore = "E501,W"
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_lint_message = 1
let g:pymode_lint_cwindow = 0

let g:pymode_lint_todo_symbol = 'Wr'
let g:pymode_lint_comment_symbol = 'Cm'
let g:pymode_lint_error_symbol = 'Er'
let g:pymode_lint_info_symbol = 'In'

let g:pymode_rope = 0
let g:pymode_rope_completion = 1
let g:pymode_rope_completion_on_dot = 1
let g:pymode_syntax_print_as_function = 1

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1

let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'

" Space before comment
let g:NERDSpaceDelims = 1

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

" Toggle calendar
nmap <expr> <F10> &ft ==# 'calendar' ? "\<Plug>(calendar_exit)" : ":\<C-u>Calendar -position=right\<CR>"

let g:tagbar_autofocus = 1
let g:tagbar_sort = 0 "tagbar shows tags in order of they created in file
let g:tagbar_compact = 1


" Sessions
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_autosave_periodic = 1

colorscheme rdark
