" --------------------------------------------------------------
" Author: Bojack F. CHEN
"
" Description: This is my personal VIM configuration file.
" Note that plugin configurations are included by sourcing
" another file named 'plugin', where plugin configurations
" are placed.
"
" Github repository: https://github.com/bojackchen/vim.git
"
" Personal page: https://bojackchen.github.io
"
"
" Sections:
"   -> General
"   -> VIM user interface
"   -> Color and font
"   -> Backup, undo and swap
"   -> Fold, tab and indent
"   -> Visual mode
"   -> Movement, tab and buffer
"   -> Status line
"   -> Editing mapping
"   -> Spell check
"   -> Misc
"   -> Plugin
"   -> Function
"
" --------------------------------------------------------------


" --------------------------------------------------------------
" -> General
" --------------------------------------------------------------
" Ward off unexpected things that my distro may have, as well
" as safely reset options when re-source .vimrc
" Use Vim settings rather than Vi settings
" This must be put at the first, because it will change other
" options
set nocompatible

" Keep 64 lines of command line history
set history=64

" Determine the file type base on its name and possibly its
" content, allowing for intelligent indent and plugins that
" are filetype specific
filetype plugin indent on

" Auto read the file when a file is changed from the outside
set autoread

" Redefine the map leader from '\' to ','
let mapleader = ","

" :W sudo saves the file (useful for handling the
" permission-denied error)
command! W w !sudo tee % > /dev/null


" --------------------------------------------------------------
" -> VIM user interface
" --------------------------------------------------------------
" In many terminal emulators the mouse works just fine, thus
" enable it for convenience
if has('mouse')
  set mouse=a
endif

" Display current mode at the bottom line
set showmode

" Display partial commands in the last line of the screen.
set showcmd

" Set 8 lines to the cursor when moving vertically using j/k
set scrolloff=8

" Turn on wild menu for better command line completion
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,.DS_Store

" Highlight current line with bold font, darkgray background
" and white foreground
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=DarkGray ctermfg=White

" Display the cursor position on the last line of the screen or
" in the status line of the window.
set ruler

" Display line number on the left
set number

" Set the command window height to 2 lines, to avoid many cases
" of having to 'Press <Enter> to continue'.
set cmdheight=2

" Easier and better switch between buffers with unsaved changed
set hidden

" Allow backspacing over autoindent, line breaks and start of
" insert action in insert mode
set backspace=indent,eol,start

" Allow left, right, h and l to go cross lines automatically
set whichwrap+=<,>,h,l

" Case insensitive search for vim, except when using capital
" letters
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results. Use Ctrl + L to temporarily turn
" off highlight (See the mapping below).
set hlsearch
set incsearch

" Do not redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" Set how many tenths of a second to blink when match is found
set mat=2

" Instead of failing a command because of unsaved changes, raise
" a dialogue asking if you wish to save
set confirm

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500


" --------------------------------------------------------------
" -> Color and font
" --------------------------------------------------------------
" Enable syntax highlighting
syntax on

" Set background color to dark
set background=dark

" Set colorscheme and GUI font
colorscheme evening
set guifont=Monofur:h12

" Set window length and width
set lines=50 columns=128

" Set UTF-8 as standard encoding and en_US as the standard
" language
set encoding=UTF-8

" Use Unix as the standard file type
set fileformats=unix,dos


" --------------------------------------------------------------
" -> Backup, undo and swap
" --------------------------------------------------------------
" Turn off backup, writebackup, undo and swap file
set nobackup
set nowritebackup
set noundofile
set noswapfile


" --------------------------------------------------------------
" -> Fold, tab and indent
" --------------------------------------------------------------
" Map ,z to create fold based on indent.
nnoremap <silent> <leader>z :set foldmethod=indent<CR>

" Map <Space> to open and close fold in file.
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<CR>

" Use spaces instead of tab
set expandtab

" Be smart when using tab
set smarttab

" 1 tab is replaced with 2 spaces
set shiftwidth=2
set tabstop=2

" Number of spaces that Tab counts for when performing editing
" operations
set softtabstop=2

" Round indent to multiple of shiftwidth
set shiftround

" When opening a new line and no filetype specific indent is
" enabled, keep the same indent as the line you are currently
" on
" Useful for README, for example
set autoindent

" Do smart autoindent when starting a new line
set smartindent

" Wrap the long lines when displaying
set wrap


" --------------------------------------------------------------
" -> Visual mode
" --------------------------------------------------------------
" In visual mode pressing * or # searches for the current
" selection
" This is idea from Michael Naumann
vnoremap <silent> * :<C-U>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-U>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" --------------------------------------------------------------
" -> Movement, tab and buffer
" --------------------------------------------------------------
" Map Ctrl + L (redraw screen) to also turn off search
" highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

" Convenient way to move between windows
map <leader>j <C-W>j
map <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l

" Mappings for managing tabs
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tm :tabmove<CR>

" Map ,tl toggle between this and the most recently accessed tab
let g:lasttab = 1
nnoremap <leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Useful when editing files in the same directory
nnoremap <leader>te :tabedit <C-R>=expand("%:p:h")<CR>/

" Close the current buffer
nnoremap <leader>bd :bd<CR>

" Close all the buffers
nnoremap <leader>ba :bufdo bd<CR>

" Map Tab to go to the next buffer and Shift + Tab to go to the
" previous buffer
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>


" --------------------------------------------------------------
" -> Status line
" --------------------------------------------------------------
" Always show the status line
set laststatus=2

" Format the status line
set statusline=%F\ %y\ %m%r:\ %l/%L,\ %c\ %=\ CWD:\ %{getcwd()}\ line:\ %p%%\ /\ display:\ %P


" --------------------------------------------------------------
" -> Editing mapping
" --------------------------------------------------------------
" Map 0 to first non-blank character
nnoremap 0 ^

" Move a line of text using Ctrl + [JK], normal and visual mode
nnoremap <C-J> mz:m+<CR>`z
nnoremap <C-K> mz:m-2<CR>`z
vnoremap <C-J> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <C-K> :m'<-2<CR>`>my`<mzgv`yo`z

" Map ,e to edit the vimrc file
nnoremap <leader>e :e C:\Program\ Files\ (x86)\Vim\_vimrc<CR>

" Map ,q to exit without saving, and add 'a' for all
nnoremap <leader>q :q!<CR>
nnoremap <leader>aq :qa!<CR>

" Map ,w to save without exiting, and add 'a' for all
nnoremap <leader>w :wq<CR>
nnoremap <leader>aw :wqa<CR>


" --------------------------------------------------------------
" -> Spell check
" --------------------------------------------------------------
" Pressing ,ss will toggle spell check
nnoremap <leader>ss :setlocal spell!<CR>

" Move to next or previous misspelled word
nnoremap <leader>sp [s
nnoremap <leader>sn ]s


" --------------------------------------------------------------
" -> Misc
" --------------------------------------------------------------
" Map F2 to toggle paste mode
set pastetoggle=<F2>

" Remove the Windows ^M when the encodings gets messed up
nnoremap <leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, for some file types
autocmd BufWritePre *.txt,*.js,*.sh,*.py :call CleanTrailingSpace()

" When vimrc is modified, reload it automatically
autocmd BufWritePost _vimrc source C:\Program\ Files\ (x86)\Vim\_vimrc


" --------------------------------------------------------------
" -> Plugin
" --------------------------------------------------------------
" Plugin configurations are sourced externally
source C:\Program\ Files\ (x86)\Vim\plugin.vim


" --------------------------------------------------------------
" -> Function
" --------------------------------------------------------------
" Get visual selection content
function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! gvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Function for cleaning trailing spaces
function! CleanTrailingSpace()
  let backup_cursor = getpos(".")
  let backup_query  = getreg("/")

  " Find one or more spaces followed by eol and replace
  silent! %s/\s\+$//e
  call setpos(".", back_cursor)
  call setreg("/", backup_query)
endfunction
