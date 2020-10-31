" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
 \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
call plug#end()

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Show hidden files when using Ctrl-P
let g:ctrlp_show_hidden = 1

" Enable syntax highlighting
syntax enable 

" Line numbers
set relativenumber number

" Color scheme
colorscheme dracula
highlight Normal ctermbg=234

" Split pane navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Tab width
set tabstop=2
