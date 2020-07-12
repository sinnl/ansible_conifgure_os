syntax on

set encoding=UTF-8
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noshowmode

"let g:webdevicons_enable_airline_tabline = 1
"let g:webdevicons_enable_airline_statusline = 1

"
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" status line
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "left"

call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'

call plug#end()

:silent! colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0
" window managemnt (panes)
nnoremap <leader>w :wincmd c<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" undo tree toggle
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" terminal
nnoremap <leader>t :wincmd h<bar> :terminal<CR>
nnoremap <leader>vt :wincmd v<bar> :terminal ++curwin<cr>
" fuzzy searchwith ripgrep
nnoremap <Leader>ps :Rg<SPACE>
" nerdtree
nnoremap <leader>d :NERDTreeToggle<CR>
" panre resising
nnoremap <silent> <Leader><Right> :vertical resize -5<CR>
nnoremap <silent> <Leader><Left> :vertical resize +5<CR>
nnoremap <silent> <Leader><UP> :resize -3<CR>
nnoremap <silent> <Leader><DOWN> :resize +3<CR>
" remaps for plug and sourcing
nnoremap <leader>ss :source % <cr>
nnoremap <leader>pi :PlugInstall <cr>
" remaps for git support
nnoremap <leader>gc :execute '!git add . && git commit -m "'.input('Commit Message: ').'"'<cr>
nnoremap <leader>gp :execute '!git push origin "'.input('Branch: ').'"'<cr>
nnoremap <leader>gi :execute '!git init' <cr>
nnoremap <leader>go :execute '!git remote add origin "'.input('Origin: ').'"' <cr>

" remap of Esc
inoremap jj <Esc>

" remap arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" copy to OS clipboard
set clipboard=unnamed

" Splits
set splitbelow
set splitright

" clipboard synchronization
"function! Osc52Yank()
    "let buffer=system('base64 -w0', @0)
    "let buffer=substitute(buffer, "\n$", "", "")
    "let buffer='\e]52;c;'.buffer.'\x07'
    "silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/ttys001")
"endfunction
"command! Osc52CopyYank call Osc52Yank()
"augroup Example
    "autocmd!
    "autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
"augroup END

" turn relative line numbers on
:set relativenumber
:set rnu

" kite plugin
let g:kite_supported_languages = ['python']
let g:kite_tab_complete=1
:silent! set belloff+=ctrlg
set completeopt+=menuone   " show the popup menu even when there is only 1 match
:silent! set completeopt+=noinsert  " don't insert any text until user chooses a match
set completeopt-=longest   " don't insert the longest common text
set completeopt+=preview
autocmd CompleteDone * if !pumvisible() | pclose | endif
"let g:kite_snippets=0

