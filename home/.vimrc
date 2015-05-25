" Loosely based on ivim
" https://github.com/kepbod/ivim/blob/762ff3556c2251d1c997d683c0363e6680d4a9dc/vimrc

"
" General
"
set nocompatible
filetype plugin indent on
set timeoutlen=500
set autoread
set hidden
set history=1000
set modeline
set encoding=utf-8
set completeopt+=longest
set completeopt-=preview

"" Source the vimrc file after saving it
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufWritePost $MYVIMRC NeoBundleClean
"" Fast edit the .vimrc file using \x
nnoremap <Leader>x :tabedit $MYVIMRC<CR>

"
" NeoBundle
"
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME . '/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

""
"" Start Bundles

"" Interface Bundles
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'junegunn/goyo.vim' " Distraction-free editing
NeoBundle 'junegunn/limelight.vim' " Hyperfocus-writing

"" End Bundles
""

call neobundle#end()
NeoBundleCheck

"
" Interface
"
set title
set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%)
set wildmenu
set wildmode=full
set backspace=indent,eol,start
set whichwrap+=h,l,<,>,[,]
set scrolljump=5 " Lines to jump when scrolling off-screen
set scrolloff=3 " Minimum number of lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor
set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink
set number " Show line numbers
nnoremap <Leader>n :set relativenumber!<CR> " Toggle relative line numbers
set formatoptions+=rnlmM
"set wrap
"set textwidth=80

"
" Colors and Fonts
"
syntax on
colorscheme hybrid
set background=dark
set list " Visible whitespace
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set linebreak
set showbreak=↪
set fillchars=diff:⣿,vert:│

"
" Indentation
"
set autoindent
set cindent
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround

"
" Search
"
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault " Default g flag
nnoremap / /\v
vnoremap / /\v
nnoremap <Leader><Space> :set hlsearch!<CR> " Use \<Space> to toggle search highlighting

"
" Filetype Settings
"

" quickfix
augroup ft_quickfix
  autocmd!
  autocmd filetype qf setlocal nolist nocursorline nowrap textwidth=0
augroup end

" markdown
augroup ft_markdown
  autocmd!
  " use <Leader>1/2/3/4/5/6 to add headings
  autocmd filetype markdown nnoremap <buffer> <Leader>1 i# <esc>
  autocmd filetype markdown nnoremap <buffer> <Leader>2 i## <esc>
  autocmd filetype markdown nnoremap <buffer> <Leader>3 i### <esc>
  autocmd filetype markdown nnoremap <buffer> <Leader>4 i#### <esc>
  autocmd filetype markdown nnoremap <buffer> <Leader>5 i##### <esc>
  autocmd filetype markdown nnoremap <buffer> <Leader>6 i###### <esc>
  " use <Leader>b to add blockquotes in normal and visual mode
  autocmd filetype markdown nnoremap <buffer> <Leader>b i> <esc>
  autocmd filetype markdown vnoremap <buffer> <Leader>b :s/^/> /<cr>
  " use <Leader>ul and <Leader>ol to add list symbols in visual mode
  autocmd filetype markdown vnoremap <buffer> <Leader>ul :s/^/* /<cr>
  autocmd filetype markdown vnoremap <buffer> <Leader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<cr>
  " use <Leader>e1/2/3 to add emphasis symbols
  autocmd filetype markdown nnoremap <buffer> <Leader>e1 i*<esc>a*<esc>
  autocmd filetype markdown nnoremap <buffer> <Leader>e2 i**<esc>a**<esc>
  autocmd filetype markdown nnoremap <buffer> <Leader>e3 i***<esc>a***<esc>
  autocmd filetype markdown vnoremap <buffer> <Leader>e1 :s/\%v\(.*\)\%v/\*\1\*/<cr>
  autocmd filetype markdown vnoremap <buffer> <Leader>e2 :s/\%v\(.*\)\%v/\*\*\1\*\*/<cr>
  autocmd filetype markdown vnoremap <buffer> <Leader>e3 :s/\%V\(.*\)\%V/\*\*\*\1\*\*\*/<CR>
  " Turn on spell
  autocmd filetype markdown setlocal spell
augroup END

" HTML
augroup ft_html
  autocmd!
  autocmd filetype html setlocal spell " Turn on spell
augroup END

