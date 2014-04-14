set nocompatible	" Use Vim defaults instead of 100% vi compatibility

filetype off                  " required for Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle - required! 
Bundle 'gmarik/vundle'

" Matt's Bundles
Bundle 'yann2192/vim-colorschemes'
Bundle 'chriskempson/base16-vim'
Bundle 'bling/vim-airline'
Bundle 'Syntastic' 
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'elzr/vim-json'
Bundle 'ervandew/supertab' 
Bundle 'AutoComplPop'

if has("gui_running")
    colorscheme murphy
    set background=dark
    set guifont=Inconsolata-dz\ for\ Powerline:h14
    set guioptions-=T   " get rid of toolbar
    set guioptions-=r   " and scrollbar
    set guioptions-=L   " and menubar
else
    colorscheme murphy
    set background=dark
endif

syntax enable
filetype plugin indent on               " required for Vundle
set omnifunc=syntaxcomplete#Complete    " use SyntaxComplete
"set number          " line numbering
"set showcmd		 " Show (partial) command in status line.
"set cf              " enable error-jumping
"set wildmenu
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set noswapfile      " No swap files, use version control instead
set nobackup		" Don't keep a backup file
set noautowrite     " Never write a file unless I request it.
set noautowriteall  " NEVER.
set paste           " Fix bad autoindent of pasted text
set nohlsearch      " don't highlight search results
set showmatch		" Show matching brackets.
set mat=1		    " Show matching for 1 10th of a second
set smartcase       " search for just The is /The, or The and the if /the
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set wmh=0           " min window height (so :sp windows can be crunched down)
set laststatus=2    " always show status bar
set directory=.,$TEMP       " fix 'unable to open swap file for no name'
"set ffs=mac,unix,dos        " Try recognizing dos, unix, and mac line endings.
set backspace=indent,eol,start	" more powerful backspacing
" 4-space standard for coding
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

let g:airline_powerline_fonts = 100             " powerline fonts for airline status bar
"let g:airline#extensions#tabline#enabled = 1    " show open buffers on top line

" better javascript https://github.com/pangloss/vim-javascript.git
let javascript_enable_domhtmlcss = 1

let g:syntastic_python_checkers=['flake8']
let g:syntastic_check_on_open=1

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.>
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Move text, but keep highlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Search and Replace in All Buffers
" use :call SRAB("%s/foo/bar/g") to execute
function SRAB(cmnd) 
  let cmnd = a:cmnd 
  let i = 1 
  while (i <= bufnr("$"))
    if bufexists(i) 
      execute "buffer" i 
      execute cmnd 
    endif 
    let i = i+1 
  endwhile
endfun

" set filetype to text for new files (so you avoid syntax red highlighting)
autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif

" treat AWS .template files just like JSON in VIM
autocmd BufNewFile,BufRead *.template setf json

" Treat .hql files as SQL for syntax highlighting
augroup filetypedetect 
    au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
    au BufNewFile,BufRead *.hql set filetype=sql
augroup END 

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif
