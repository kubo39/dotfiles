set fileencodings=utf-8,euc-jp,cp932
set encoding=utf-8
filetype off

let s:neobundle_path = '~/.vim/bundle/neobundle.vim'

if has('vim_starting')
	set nocompatible                " Recommend
	"if !isdirectory(s:neobundle_path)
	"	system('git clone https://github.com/Shougo/neobundle.vim '.s:neobundle_path)
	"endif
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'itchyny/lightline.vim'


call neobundle#end()

filetype plugin indent on       " Required!

NeoBundleCheck

" ...

if !has('vim_starting')
	" Call on_source hook when reloading .vimrc.
	call neobundle#call_hook('on_source')
endif

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
