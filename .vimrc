" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
call plug#begin('~/.vim/plugged')
  " auto set pwd to project root (use <leader>n to prove it)
  Plug 'airblade/vim-rooter'

  " ruby & RoR support
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'

  " autocompletion
  Plug 'valloric/youcompleteme'

  " surround word
  Plug 'tpope/vim-surround'

  " auto close [], (), etc...
  Plug 'jiangmiao/auto-pairs'

  " comment with gcc or gc(visual)
  Plug 'tpope/vim-commentary'
  
  " emmet plugin for vim (ctrl y ,)
  Plug 'mattn/emmet-vim'
  
  " sync tmux pane navigation with vim
  Plug 'christoomey/vim-tmux-navigator'

  " nerdtree instead of netrw
  Plug 'preservim/nerdtree'

  " fzf
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Plug 'vimsence/vimsence'
  " see git changes on gutter
  Plug 'airblade/vim-gitgutter'

  " vim wrapper for test
  Plug 'vim-test/vim-test'
  " vimux for vim-test
  Plug 'benmills/vimux'
call plug#end()

" Turn on syntax highlighting
syntax enable

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = ","

" =============== vim-test
let test#strategy='vimux'
let test#ruby#runner='rspec'
let test#ruby#rspec#executable='RUBYOPT="-W0" spring rspec -fd'
" let test#ruby#rails#executable='docker-compose exec -e RAILS_ENV=test rspec'
" mapping for vim-test
nmap <silent> t<leader>n :TestNearest<CR>
nmap <silent> t<leader>f :TestFile<CR>
nmap <silent> t<leader>l :TestLast<CR>
nmap <silent> t<leader>a :TestSuite<CR>
nmap <silent> t<leader>v :TestVisit<CR>
" =============== end

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" More natural split opening
set splitbelow
set splitright

" =============== vim-tmux-navigator 
" Better window navigation
" if you use tmux, please read vim-tmux-navigator docs
set timeout ttimeoutlen=50
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>n :NERDTreeToggle<CR> " open nerdtree

" make alt working in vim
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" Use alt + hjkl to resize split
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
" =============== end

" =============== YOU COMPLETE ME
" stop youcompleteme to open helper on split window
let g:ycm_autoclose_preview_window_after_insertion = 1

" css support for YCM
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^', 're!^\s+', ': ' ],
    \   'scss': [ 're!^', 're!^\s+', ': ' ],
    \ }
" =============== end

" Security
set modelines=0

" Show line numbers
set number
set signcolumn=yes

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Finding Files
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set autochdir
" =============== vim-rooter
" vim-rooter: change to file's directory for non-project files
let g:rooter_change_directory_for_non_project_files = 'current'
" =============== end

" Display all matching files when we tab complete
set wildmenu

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

" Start NERDTree and leave the cursor in it
autocmd VimEnter * NERDTree

" =============== git gutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4
" =============== end


