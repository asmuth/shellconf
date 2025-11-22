" editor settings
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set nu
set numberwidth=8
set incsearch
set hlsearch
set viminfo='100,f1
set noswapfile
set nobackup
set nowb
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set list
set list listchars=tab:·\ ,trail:·
set colorcolumn=81
set nowrap
set lsp=3

" fuzzy finder
nmap <c-t> :FufFile **/<CR>
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{},
      \                      'MruFile':{}, 'MruCmd':{}, 'Bookmark':{},
      \                      'Tag':{}, 'TaggedFile':{},
      \                      'GivenFile':{}, 'GivenDir':{},
      \                      'CallbackFile':{}, 'CallbackItem':{}, }


" tabs
nmap <silent> <c-n> :tabnew<CR>
nmap <silent> <c-w> :tabclose<CR>
nmap <silent> <c-right> :tabnext<CR>
nmap <silent> <c-left> :tabprev<CR>

" custom keys
nnoremap q <c-v>
vnoremap p "0p
vnoremap P "0P
vnoremap y "0y
vnoremap d "0d

" desktop integration
set mouse=a
vmap <C-c> "+yi
vmap <C-x> "+c
imap <C-v> <ESC>"+pa
set clipboard=unnamed

" colours
syntax on
set background=light
colorscheme PaperColor
hi Normal guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE

