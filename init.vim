syntax on


"setup vim-plug {{{

  "Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  "Note: Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    call plug#begin()
  endif

"}}}


set t_Co=256  " Note: Neovim ignores t_Co and other terminal codes.

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

let g:coc_global_extensions = [
\ 'coc-explorer',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-highlight',
\ 'coc-prettier',
\ 'coc-tsserver',
\ 'coc-sql'
\ ]



call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

call plug#end()

" setting typescript
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" Set jsx-tag colors in vimrc yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
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

nmap <space>pe :CocCommand explorer<CR>

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
nnoremap <leader>s :Rg<SPACE>
nnoremap <silent> <Leader>= :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
map <C-p> :ProjectFiles<CR>
" nnoremap <C-p> :Files<Cr>

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
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ga  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
endfun

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType go,typescript.tsx :call GoCoc()

" coc-prettier settings
" using coc integration for prettier format and sql format
 command! -nargs=0 Prettier :CocCommand prettier.formatFile

 " Oganize imports when saving a tsx
nmap <leader>oi :call CocAction('runCommand', 'tsserver.organizeImports')<CR>:Prettier<CR>
nmap <leader>gf :call CocAction('format')<CR>
" end

let g:rehash256=1


" -------------------------------------------------------------------------------------------------
" vim-go settings
" -------------------------------------------------------------------------------------------------
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>rr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gi  <Plug>(go-imports)
autocmd FileType go nmap <leader>gf  :GoFmt<cr>

let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_test_show_name=1

set autowrite

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

