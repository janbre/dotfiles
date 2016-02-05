" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" To start Vim with line numbering
set nu

" Set Vim to display 256 colors
set t_Co=256

" Set colorscheme
colorscheme xoria256


set wrap
set linebreak
set nolist

" Maps l to ] so it's possible to follow internal links with Norwegian keyboard
map <C-l> <C-]>

" To get Vim-latex to work
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" https://dev.launchpad.net/UltimateVimPythonSetup
" Wrapping and tabs
autocmd FileType python set tw=78 ts=4 sw=4 sta et sts=4 ai

" More syntax highlighting
let python_highlight_all = 1

" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,switch,case

" Auto completion via ctrl-space
set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>

" Wrapt at 72 chars for comments
autocmd FileType python set formatoptions+=tcq textwidth=72 foldignore=wildignore+=*.py[co]

" Highlight EOL whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/


" Pathogen-related
execute pathogen#infect()

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
nmap <F9> :NERDTreeToggle<CR>

" To climb directories in order to locate a tags-file
set tags+=tags;/

" remap ctrl-c to esc so switching modes is easier and faster
imap <C-c> <Esc>

" Set colorscheme according to filetype
autocmd FileType python colorscheme xoria256
autocmd FileType c colorscheme wombat256mod
autocmd FileType cpp colorscheme wombat256mod

" always display status bar with full path
set laststatus=2
set statusline+=%F\ \ \l:\%l\ c:\%c\ \ %p:100
set ts=4 sw=4

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
