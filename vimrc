filetype plugin indent on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
syntax on
set number
set ruler
set showcmd
set enc=utf-8
set spelllang=en_gb,ru
set listchars=tab:▸\ ,eol:¬
set showbreak=…
set hidden

""Mappings
let mapleader = ","
nmap <leader>l :set list!<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <F3> :NERDTreeFind<CR>
nmap <F4> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <Esc>Oa [e
nmap <Esc>Ob ]e
vmap <Esc>Oa [egv
vmap <Esc>Ob ]egv
nmap <Esc>} gt
nmap <Esc>{ gT
nmap <Esc>1 1gt
nmap <Esc>2 2gt
nmap <Esc>3 3gt
nmap <Esc>4 4gt
nmap <Esc>5 5gt
nmap <Esc>6 6gt
nmap <Esc>7 7gt
nmap <Esc>8 8gt
nmap <Esc>9 9gt
nmap <Esc>0 :tablast<CR>

if exists(":Tabularize")
    nmap <leader>a= :Tabularize /=<CR>
    vmap <leader>a= :Tabularize /=<CR>
    nmap <leader>a: :Tabularize /:\zs<CR>
    vmap <leader>a: :Tabularize /:\zs<CR>
endif

""Functions
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

""Commands
command! -nargs=* Wrap set wrap linebreak nolist

if has("autocmd")
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
    autocmd BufWritePost .vimrc source $MYVIMRC
endif
