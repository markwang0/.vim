"""""""""""""""""""""""
" general config
"""""""""""""""""""""""

" windows terminal q for visual block
nnoremap <c-q> <c-v>

syntax on
set hidden
" set nowrap
set wildmenu
set wildoptions=pum,fuzzy
set backspace=indent,eol,start
set timeoutlen=1000
set ttimeoutlen=0
" don't autoinsert comment leaders
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" tabs (4 spaces) and filetypes
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
filetype plugin on
filetype indent on

" :W to write as root
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime


"""""""""""""""""""""""
" appearance
"""""""""""""""""""""""

colo gruvbox
set background=dark
set termwinsize=10x0
set splitbelow
set fillchars+=vert:\  " set vsplit char to space
hi Normal guibg=NONE ctermbg=NONE


"""""""""""""""""""""""
" keymaps
"""""""""""""""""""""""

let mapleader = ","
nmap <leader>a ggVG
nmap <leader>t :term<cr>
nmap <leader>n :NERDTreeToggle<cr>
" toggle search highlight
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" buffers (vim buffer ~ tab; vim tab ~ workspace)
nmap <leader>e :enew<cr>
nmap <leader>j :bprevious<cr>
nmap <leader>k :bnext<cr>
nmap <leader>bq :bprevious <bar> bdelete #<cr>
" nnoremap d "_d
" nnoremap x "_x
nnoremap <leader>d d

" system clipboard
" set clipboard=unnamed "yank goes to system clipboard
nmap <leader>y "*yy
nmap <leader>p "*p
nmap <leader>P "*P

" custom functions
noremap <leader>w :call TrimWhitespace()<cr>

" FZF
nmap <leader>l :Buffers<cr>
nmap <leader>f :Files<cr>
nmap <leader>g :Rg<cr>
nmap <leader>r :History:<cr>
nmap <leader>/ :BLines<cr>
" nmap <leader>/ :History/<cr>
" nmap <leader>h :History<cr>
" nmap <leader>as :Lines<cr>


"""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""

" FZF
let fzfpath = system('which fzf')
set rtp+=fzfpath

" vim-airline
let g:airline_powerline_fonts=1
" let g:airline_theme='hybridline'
let g:airline_theme='base16_gruvbox_dark_hard'
" remove trailing whitepace indicator
" let g:airline#extensions#whitespace#enabled=0
" enable list of buffers
let g:airline#extensions#tabline#enabled=1
" show just the filename
let g:airline#extensions#tabline#fnamemod=':t'

" NERDTree
" let NERDTreeShowHidden=1
" let NERDTreeHijackNetrw=1
let NERDTreeMinimalUI=1
let g:NERDTreeWinPos="right"

" vim-searchlight
nnoremap <silent> * *:1Searchlight<cr>
nnoremap <silent> # #:1Searchlight<cr>

" vim-devicons
" disable devicons in ssh sessions
let ssh_status = system('. ~/.vim/ssh_status.sh')
if trim(ssh_status) != 'local'
    let g:webdevicons_enable = 0
endif


"""""""""""""""""""""""
" custom functions
"""""""""""""""""""""""

" trim whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun