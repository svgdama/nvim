syntax on

set t_Co=256  " Note: Neovim ignores t_Co and other terminal codes.
set laststatus=2

set mouse=a
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" coc-prettier settings
" using coc integration for prettier format and sql format
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>pf :call CocAction('format')<CR>
" end



" setting up emmet
" https://github.com/mattn/emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall



" -------------------------------------------------------------------------------------------------
" vim settings
" -------------------------------------------------------------------------------------------------

let mapleader = " "

" ESC Key
imap jj <Esc>
imap <C-Space> <Esc>
cmap <C-Space> <C-c>
vmap <C-Space> <Esc>

colorscheme gruvbox
set background=dark
set laststatus=2
if executable('rg')
    let g:rg_derive_root='true'
endif

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 50

" brose_split 0 closes it when open a file
let g:netrw_browse_split = 0

" this way the netrw holds the file dir as root
nnoremap <leader>pe :wincmd v<bar> :Ex<CR>
" nnoremap <leader>pe :Explore<CR>

" end netrw

" quickfix navigation. helpfull to navigate at ctlp results
" open quickfix is handy in case we want to reuse ripgrep results
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
map <C-c> :cclose<CR>
map <C-n> :copen<CR>

" current buffer
nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>e :edit<SPACE>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
nnoremap <leader><leader> <c-^>

" autoclose tags
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" insert mode navigational keys
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" window navigational
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>


" find and replace
nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g<left><left>
vnoremap <leader>r :s/\<<C-r><C-w>\>//g<left><left>

" others
nnoremap <leader>c :noh<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>s :Rg<SPACE>
nnoremap <silent> <Leader>= :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fzf
nnoremap <C-p> :Files<Cr>


fun! GoYCM()
    nnoremap <buffer> <silent> <leader>pd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>pr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>pr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer> <leader>gd <Plug>(coc-defintion)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nnoremap <buffer> <leader>cr :CocRestart
endfun

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType typescript :call GoYCM()
autocmd FileType cpp,cxx,h,hpp,c :call GoCoc()

let g:rehash256=1


" -------------------------------------------------------------------------------------------------
" vim-go settings
" -------------------------------------------------------------------------------------------------
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gi  <Plug>(go-imports)
autocmd FileType go nmap <leader>gf  :GoFmt<cr>

let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_test_show_name=1

set autowrite

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" let g:go_def_mapping_enabled = 0
