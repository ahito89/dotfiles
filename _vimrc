set encoding=utf-8

set shell = powershell
set shellcmdflag=-command

syntax on

filetype plugin indent on
set autoindent
set ts=2
set shiftwidth=2
set expandtab
set relativenumber
set showmatch
set ignorecase
set hlsearch
set cursorline
set smartcase
set incsearch
set showcmd
set smarttab
set ruler
set scrolloff=2
set laststatus=2
set list listchars=tab:>>,trail:.
set clipboard=unnamed
set wildmenu
set wildmode=list:longest,full

set statusline=%F%m%r%h%w\ [%l,%c]\ [%L,%p%%]

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! SetNumber()
  set norelativenumber
  set number
endfunction

autocmd InsertEnter * call SetNumber()
autocmd InsertLeave * :set relativenumber

" hint to keep lines short
if exists('+colorcolumn')
set colorcolumn=80
endif

" multi-purpose tab key (auto-complete)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
