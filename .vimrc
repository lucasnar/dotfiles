set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ack.vim
Plugin 'mileszs/ack.vim'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" vim-fugitive (git integration)
Plugin 'tpope/vim-fugitive'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Command-T
" Plugin 'wincent/command-t'

" CtrlP
Plugin 'kien/ctrlp.vim'

" vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'

" Better Whitespace
Plugin 'ntpeters/vim-better-whitespace'

" ConqueTerm
Plugin 'oplatek/Conque-Shell'

" Vim-elixir
Plugin 'elixir-lang/vim-elixir'

" Vim-javascript
Plugin 'pangloss/vim-javascript'

" Vim-coffee-script
Plugin 'kchmck/vim-coffee-script'

" Monokai-phoenix (theme)
Plugin 'reewr/vim-monokai-phoenix'

" Macvim light (theme)
Plugin 'aunsira/macvim-light'

" Solarized (theme)
Plugin 'altercation/vim-colors-solarized'

" Google
Plugin 'szw/vim-g'

" Vue
Plugin 'posva/vim-vue'

" Vim test
Plugin 'janko-m/vim-test'

" Alchemist (Elixir integration)
Plugin 'slashmili/alchemist.vim'

" Vim Tmux Navigator - Seamless navigation between Vim and Tmux
Plugin 'christoomey/vim-tmux-navigator'

" Vim Surround
Plugin 'tpope/vim-surround'

" Syntastic (Syntax checking for a bunch of languages)
Plugin 'vim-syntastic/syntastic'

" Rubocop (Ruby hints)
Plugin 'ngmy/vim-rubocop'

" Python's PEP8 recommends weird indentation rules
" Plugin 'vim-python-pep8-indent' " Didn't work for some reason

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
" colorscheme monokai-phoenix
" colorscheme macvim-light
colorscheme solarized
set background=light " So I get the solarized light version by default
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set clipboard=unnamed
set number
set hlsearch
set ruler
set title
set laststatus=2
set backspace=2

" Ignore case
set ignorecase
set smartcase

" Show partial command in status line
set showcmd

" Enable mouse interaction
set mouse=a

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" For security reasons, as described here:
" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set modelines=0
set nomodeline

autocmd BufWritePre * StripWhitespace
cnoreabbrev t tabnew
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev Q q
cnoreabbrev ct ConqueTermSplit
cnoreabbrev ctb ConqueTermSplit bash
cnoreabbrev ctbv ConqueTermVSplit bash

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Easy NERDTree opening
noremap <Leader>f :NERDTree<CR>
noremap <Leader>n :NERDTreeFind<CR>
let NERDTreeWinPos = 'left'

" New line adding
map <Leader>o o<Esc>
map <Leader>O O<Esc>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Don't skip rows of wrapped lines
nnoremap j gj
nnoremap k gk

" vim-airline related config
" let g:airline#extensions#tabline#enabled = 1 " prettier tabs
" let g:airline_theme='simple'

" vim-g (Google) plugin config
let g:vim_g_open_command = "open"
let g:vim_g_command = "Go"
let g:vim_g_f_command = "Gf"

" ack.vim config
" use ag if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>

" wildignore to ignore files in listings
" Binary ignore
set wildignore +=*.o,*.obj

" Log ignore
set wildignore +=*/log

" Web projects ignore
set wildignore +=*.min.js

" Node ignore
set wildignore +=*/node_modules

" Elixir/Phoenix ignore
set wildignore +=*/_build

" Sane Ignore For ctrlp (not sure if it sees wildignore)
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|log\|tmp$',
      \ 'file': '\.exe$\|\.so$\|\.dat$\|\.png$\|\.min.js$'
      \ }

" Buffer Navigation
nnoremap < :bp<CR>
nnoremap > :bn<CR>

set path+=**

" Setup Elixir Umbrella test
function! ElixirUmbrellaTransform(cmd) abort
  if match(a:cmd, 'apps/') != -1
    return substitute(a:cmd, 'mix test apps/\([^/]*/\)', 'cd apps/\1 \&\& iex -S mix test --color', '')
  else
    return substitute(a:cmd, 'mix test', 'iex -S mix test --color', '')
  end
endfunction

let g:test#preserve_screen = 1
let g:test#custom_transformations = {'elixir': function('ElixirUmbrellaTransform')}
let g:test#transformation = 'elixir'

" Vim-test key bindings
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore node_modules -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" Parse Json (ruby dependent)
map <leader>jt <Esc>:%!ruby -rjson -e "print JSON.pretty_generate(JSON.parse(ARGF.read))"<ESC>=%<CR>

" Syntastic config
" "active" mode: checks are made on save or open
" Excluding SCSS files (which " need :SyntasticCheck to be called)
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["scss"] }
