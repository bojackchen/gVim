"-----------------------------------------------------------------
" Author: Bojack F. CHEN
" Description: My personal windows gvim configuration file
"
"-----------------------------------------------------------------
"
"-----------------------------------------------------------------
" Start of the _vimrc file.
"
"-----------------------------------------------------------------
"
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin



" ----------------------------------------------------------------
" Features
"
" These options enable many features in Vim, that no user will
" live without.
"
" ----------------------------------------------------------------
"
" Ward off unexpected things that my distro may have, as well
" as sanely reset options when re-source .vimrc.
" Use Vim settings rather than Vi settings.
" This must be put the first, cause it will change other options
set nocompatible

" Allow backspacing over autoindent, line breaks and start of insert
" action in insert mode
set backspace=indent,eol,start

" Determine the file type base on its name and possibly its
" content, allowing for intelligent indent and plugins that
" are filetype specific
filetype plugin indent on

" Enable syntax highlighting.
syntax on

" In many terminal emulators the mouse works just fine, thus
" enable it for convenience.
if has('mouse')
  set mouse=a
endif

" Case insensitive search for vim, except when using capital letters
set ignorecase
set smartcase

" Set color column at specific character count
set colorcolumn=100



"-----------------------------------------------------------------
" Must have options
"
" These options are highly recommended.
"
"-----------------------------------------------------------------
"
" Easier and better switching between buffers with unsaved changed.
set hidden

" When opening a new line and no filetype specific indent is
" enabled, keep the same indent as the line you are currently
" on. Useful for READMEs, for example.
set autoindent

" Better command line completion
set wildmenu

" Display the cursor position on the last line of the screen or
" in the status line of the window.
set ruler

" Display line number on the left.
set number

" Display current mode in command line
set showmode

" Display partial commands in the last line of the screen.
set showcmd

" Highlight search results. Use <C-L> to temporarily turn off highlight
" (See the mapping below).
set incsearch
set hlsearch

" Instead of failing a command because of unsaved changes, raise a
" dialogue asking if you wish to save changed files
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell



"-----------------------------------------------------------------
" Indentation options
"
" These options are set upon personal preferences, to make a
" better indentation of your code.
"
"-----------------------------------------------------------------
"
" Indentation settings for using 2 spaces to replace tabs.
" Do not change 'tabstop' from its default value of 8 to 2.
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab



"-----------------------------------------------------------------
" Usability options
"
" These options enhance the usability of Vim. Set up your
" personal preferences here.
"
"-----------------------------------------------------------------
"
" Stop certain movements from always going to the first
" character of a line.
set nostartofline

" Always display the status line, even if only one window is 
" displayed.
set laststatus=2

" Display file name and line number in the status line.
set statusline=%F\ %y:\ %l/%L,\ %c\ %=\ line:\ %p%%/display:\ %P

" Set the command window height to 2 lines, to avoid many cases
" of having to 'Press <Enter> to continue'.
set cmdheight=2

" Highlight the current line
set cursorline

" No backup file (*~) and undo file (*.un~).
set nobackup
set noundofile

" No swap file.
set noswapfile

" Keep 50 lines of command line history
set history=50

" Paste for insert mode.
set pastetoggle=<F2>

" Add dictionary to Vim to enable the auto
" completion of words.
" Ctrl-X + Ctrl-K to wake up the autocompletion of words
" in the dictionary.
"set dictionary+=/usr/share/dict/words

" Color scheme and GUI font
colorscheme evening
set guifont=Monofur:h12

" Set default window position, length and width
winpos 100 100
set lines=48 columns=120



"-----------------------------------------------------------------
" Mappings
"
" These options are useful mappings for efficient editing.
"
"-----------------------------------------------------------------
"
" Map ,e to edit the vimrc file.
nnoremap ,e :e C:\Program\ Files\ (x86)\Vim\_vimrc<CR>

" Map ,f to close the file without saving.
map ,f :q!<CR>

" Map ,w to write and close the file.
map ,w :wq<CR>

" Map ,a to write and close ALL the files.
map ,a :wqa<CR>

" Map ,z to create fold based on indent.
map ,z :set foldmethod=indent<CR>

" Map ,ss to start spell check.
map ,ss :setlocal spell!<CR>

" Map Shift-Tab to go to previous buffer.
map <s-tab> :bp<CR>
" Map Tab to go to next buffer.
map <tab> :bn<CR>

" Map <space> to open and close fold in file.
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting
" until the next search
nnoremap <C-L> :nohl<CR><C-L>



"-----------------------------------------------------------------
" Autocmds
"
" Auto commands. Commands that will be executed automatically or
" triggered by certain conditions.
"
"-----------------------------------------------------------------
"
" When _vimrc is modified, reload it.
autocmd! bufwritepost _vimrc source C:\Program Files (x86)\Vim\_vimrc



"-----------------------------------------------------------------
" Personal plugins
"
" These plugins are configured personally, which greatly enhance
" the efficiency of using Vim.
"
"-----------------------------------------------------------------
"
" Doorkeeper of all my vim plugins.
" Pathogen is a vim plugin manager.
call pathogen#infect()



"-----------------------------------------------------------------
" SuperTab plugin
"
" SuperTab allows you to perform all your insert completion
" using <tab>
"
"-----------------------------------------------------------------
"
" Set <c-p> to go forward (previous), <c-n> to go backward (next).
let g:SuperTabMappingForward  = '<c-p>'
let g:SuperTabMappingBackward = '<c-n>'

" Enable SuperTab longest match support
let g:SuperTabLongestEnhanced = 1



"-----------------------------------------------------------------
" vim-gitgutter plugin
"
" Display the difference in real time.
" vim-gitgutter is disabled in branch 'gvim-light'
"
"-----------------------------------------------------------------
"
" Set the update time for display.
"set updatetime=1000



"-----------------------------------------------------------------
" CtrlP plugin
"
" Full path fuzzy file/buffer/mru/tag finder.
"
"-----------------------------------------------------------------
"
" Map ctrl + p to invoke CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Set CtrlP working directory to be the directory of the current file
let g:ctrlp_working_path_mode = 'ra'

" If a file is already open, open it again in a new pane
let g:ctrlp_switch_buffer = 'et'



"-----------------------------------------------------------------
" auto-pairs plugin
"
" Auto close paired characters.
"
"-----------------------------------------------------------------
"
" Disable fly mode
let g:AutoPairsFlyMode = 0



"-----------------------------------------------------------------
" tagbar plugin
"
" Create tags according to the file. Similar to taglist.
" tagbar is disabled in branch 'gvim-light'
"
"-----------------------------------------------------------------
"
" Map F7 to toggle taglist.
"nnoremap <F7> :TagbarToggle<CR>

" Set the width of tagbar window to 32
"let g:tagbar_width = 32



"-----------------------------------------------------------------
" nerdcommenter plugin
"
" Use <C-m> to comment and uncomment.
"
"-----------------------------------------------------------------
"
" Map ctrl + m to toggle comment.
map <C-m> <leader>c<space>

" Add spaces after comment delimiters by default.
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments.
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing white space when uncommenting
let g:NERDTrimTrailingWhitespace = 1



"-----------------------------------------------------------------
" acp plugin
"
" Auto completion popup (AutoComplPop) for vim
" 
"-----------------------------------------------------------------
"
" Set up acp for snipMate plugin.
let g:acp_behaviorSnipmateLength = 1

" Disable auto-popup by moving cursor in insert mode.
let g:acp_mappingDriven = 1



"-----------------------------------------------------------------
" undotree plugin
"
" List out all the undos.
" 
"-----------------------------------------------------------------
"
" Map F5 to toggle the undotree window.
nnoremap <F5> :UndotreeToggle<CR>

" If undotree is opened, it is likely that interaction is expected.
" Set focus on undotree windows.
let g:undotree_SetFocusWhenToggle = 1



"-----------------------------------------------------------------
" NERDTree plugin
"
" NERDTree file explorer plugin.
" 
"-----------------------------------------------------------------
"
" Map F6 to toggle the NERDTree window.
nnoremap <F6> :NERDTreeToggle<CR>

" Let nerdtree show hidden files
let g:NERDTreeShowHidden = 1

" Close vim when NERDTree windows is the last window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



"-----------------------------------------------------------------
" vim-airline plugin
"
" Powerful vim statusline style.
" 
"-----------------------------------------------------------------
"
" Set vim airline style
let g:airline_theme = 'dark'



"-----------------------------------------------------------------
" vim-latex plugin
"
" latex-suite for vim.
"
"-----------------------------------------------------------------
"
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files
" defaults to 'plaintex' instead of 'tex', which results in
" vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor = 'latex'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats= 'pdf'
let g:Tex_ViewRule_pdf = 'SumatraPDF'



"-----------------------------------------------------------------
" End of the _vimrc file.
"
"-----------------------------------------------------------------
