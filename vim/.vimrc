set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" autocomplete
Plugin 'Valloric/YouCompleteMe'

" nerd tree
Plugin 'scrooloose/nerdtree'

" nerd tree git status
Plugin 'Xuyuanp/nerdtree-git-plugin'

" fuzzy find
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" " lint
Plugin 'w0rp/ale'

" pretty line
Plugin 'itchyny/lightline.vim'

" comments hotkey
Plugin 'tomtom/tcomment_vim'

" git status in file gutter
Plugin 'airblade/vim-gitgutter'

" search file contents
Plugin 'mileszs/ack.vim'

" markdown things
Plugin 'iamcco/markdown-preview.nvim'

"colors theme
Plugin 'ayu-theme/ayu-vim'
Plugin 'larsbs/vimterial_dark'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'romainl/Apprentice'
Plugin 'jdsimcoe/abstract.vim'
Plugin 'challenger-deep-theme/vim', {'name': 'challenger-deep-theme'}
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'
Plugin 'bluz71/vim-moonfly-colors'
Plugin 'nanotech/jellybeans.vim'
Plugin 'dim13/smyck.vim'

" rust as
Plugin 'rust-lang/rust.vim'

" preview colors in css
Plugin 'ap/vim-css-color'

" fugitive, git plugin
Plugin 'tpope/vim-fugitive'

" python indent
Plugin 'vim-scripts/indentpython.vim'

" pep8
Plugin 'nvie/vim-flake8'

" javascript as
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'prettier/vim-prettier'

" go as
Plugin 'fatih/vim-go'

" hack as
Plugin 'hhvm/vim-hack'

" graphql
Plugin 'jparise/vim-graphql'

Plugin 'neovimhaskell/haskell-vim'

" zoom or unzoom current window
Plugin 'taylor/vim-zoomwin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" user config

" make backspace work like in most other programs
set backspace=indent,eol,start


if has("gui_running")
  syntax on
  set hlsearch
  colorscheme hybrid
  set bs=2
  set ai
  set ruler
endif
" colors
syntax on
" set termguicolors
" let ayucolor="mirage"
set background=dark
" colorscheme hybrid
colorscheme gruvbox
let g:hybrid_custom_term_colors = 1

" all the mouse support
set mouse=a

" line numbers
set number

" NERDTree et all
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeNodeDelimiter = "\u00a0"
map <c-m> :NERDTreeFocus <CR>
map <C-n> :NERDTreeToggle<CR>
map <c-k> :NERDTreeFind <CR>
let g:NERDTreeIgnore = ['^node_modules$']
map <c-b> :NERDTreeFind <CR>
nmap <c-b> :NERDTreeFind<CR>

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts, set filetype=typescript

" tabs/spaces by filetype
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype javascript.jsx setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript.tsx setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype sass setlocal ts=2 sw=2 sts=0 expandtab

" fuzzy file search
map ; :Files<CR>
map <c-p> :Buffers <CR>
:let $FZF_DEFAULT_COMMAND  = 'find . -type f ! -path "*/node_modules/*" -type f ! -path "*/.git/*" -type f ! -path "*/.pg_data/*"'

" Fix files with prettier, and then ESLint.
let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'rust': ['rustfmt'], 'python': ['flake8']}
let g:ale_linters = {'go': ['gofmt'], 'python': ['flake8']}
let g:ale_javascript_prettier_options = '--trailing-comma es5 --single-quote true --print-width 100'
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:rustfmt_autosave = 1

" jump to ale errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2

" toggle highlight search 
map <c-h> :set hlsearch! <CR>

" shut up stupid bell
set belloff=all

" no word wrap pls
set nowrap

" search for visually selected text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>``

" splits
nmap :vs :vsplit
nmap :hs :split
set splitbelow
set splitright

" yank to clipboard
vmap <c-y> “+y

" fuck you swap files
set noswapfile

" allow h and l to wrap previous and next lines
set whichwrap+=<,>,h,l,[,]

" yank to clipboard
vmap <c-y> "+y

nmap <c-i> :Rg <CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" tmux nonsense
" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" tmux nonsense
" pasting indent for days fix
if &term =~ '^tmux'
  let &t_BE="\<Esc>[?2004h"
  let &t_BD="\<Esc>[?2004l"
  let &t_PS="\<Esc>[200~"
  let &t_PE="\<Esc>[201~"
endif

" let g:pymode_python = 'python3'

" fzf rg shortcut
nmap <c-i> :Rg <CR>


" tmux
set ttymouse=xterm2
set mouse=a
if exists('+termguicolors')
	  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	      set termguicolors
      endif
