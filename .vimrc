set fileencodings=utf-8,euc-jp,cp932
set encoding=utf-8
filetype off
set title
syntax on
set tabstop=2
set smartindent

set expandtab
set shiftwidth=2
set softtabstop=2

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('vim-jp/vimdoc-ja')
  call dein#add('thinca/vim-quickrun')
  call dein#add('itchyny/lightline.vim')
  call dein#add('sjl/gundo.vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('JesseKPhillips/d.vim')
  call dein#add('idanarye/vim-dutyl')
  call dein#add('racer-rust/vim-racer')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

set laststatus=2
set t_Co=256

nnoremap k gk
nnoremap j gj
nnoremap <Up> gk
nnoremap <Down> gj

noremap <C-a> <Home>
noremap <C-b> <Left>
noremap <C-d> <Del>
noremap <C-e> <End>
noremap <C-f> <Right>
noremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
noremap <C-n> <Down>
noremap <C-p> <Up>

inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <c-d> <Del>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-k> <Esc>Da
inoremap <C-n> <Down>
inoremap <C-p> <Up>


" 行番号を表示
set number


let g:lightline = {}

let g:lightline.active = {
			\ 'left': [ [ 'mode', 'paste' ],
			\           [ 'readonly', 'filename', 'modified' ] ],
			\ 'right': [ [ 'lineinfo' ],
			\            [ 'percent' ],
			\            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
			\ 'left': [ [ 'filename' ] ],
			\ 'right': [ [ 'lineinfo' ],
			\            [ 'percent' ] ] }
let g:lightline.tabline = {
			\ 'left': [ [ 'tabs' ] ],
			\ 'right': [ [ 'close' ] ] }

" command-line completion
set wildmenu
set wildmode=list:longest

" <LEADER> 　を指定
let g:mapleader = ","

" .vimrcの適用
nnoremap <LEADER>rv :<C-u>source $MYVIMRC<CR>

" racer -- auto compelete for rust の設定
set hidden
let g:racer_cmd = '~/.cargo/bin/racer'

filetype off
filetype plugin indent off
" Golang
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif
filetype plugin indent on
syntax on

" dutly config
let g:dutyl_stdImportPaths=['~/dlang/dmd-2.077.0/']
call dutyl#register#tool('dcd-client','~/DCD/dcd-client')
call dutyl#register#tool('dcd-server','~/DCD/dcd-server')
