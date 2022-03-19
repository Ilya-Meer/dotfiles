" Leader
let mapleader = ","

" Remap Escape
inoremap jk <Esc>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
 \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vim/.vimrc \| :PlugInstall<CR>

" Plugins
 call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'crusoexia/vim-dracula'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'keith/swift.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'psliwka/vim-smoothie'
Plug 'mattn/emmet-vim'

" Vim Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

call plug#end()

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" FZF
nnoremap <silent> <C-p> :Files<Cr>

" CoC Extensions
let g:coc_global_extensions = [
	\ 'coc-tsserver',
	\ 'coc-solargraph',
	\ 'coc-snippets',
	\ 'coc-json', 
	\ 'coc-git',
	\ 'coc-css',
	\	]

" Show tooltip with function signature
nnoremap <silent> K :call CocAction('doHover')<CR>

" Snippet settings 
let g:snipMate = { 'snippet_version' : 1  }

" Vim markdown settings
let g:vim_markdown_folding_disabled = 1

" Tags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ 'build',
      \ 'dist',
      \ 'bin',
      \ 'node_modules',
      \ 'cache',
      \ 'compiled',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ ]

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Vim git gutter update time
set updatetime=100

" Enable syntax highlighting
syntax enable 

" Line numbers
set relativenumber number

" Tab width
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Search
set incsearch
set hlsearch
set shortmess-=S
noremap <leader>a  :Ag! <C-r>=expand('<cword>')<CR><CR>

" Set wildmenu
set wildmenu
set wildmode=longest,list,full

" Backspace
set backspace=indent,eol,start

" Split pane navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Color scheme
colorscheme dracula
highlight Normal ctermbg=235
highlight LineNr ctermfg=32

" Retrieve token for highlight modification
function! GetSyntaxID()
  return synID(line('.'), col('.'), 1)
endfunction

function! GetSyntaxParentID()
  return synIDtrans(GetSyntaxID())
endfunction

function! GetSyntax()
  echo synIDattr(GetSyntaxID(), 'name')
  exec "hi ".synIDattr(GetSyntaxParentID(), 'name')
endfunction

" Insert timestamp for log
function! Logd()
  put =strftime('**%a %B %d, %Y - %H:%M:%S**')
  call append(line("."), "")
  call append(line("."), "")
  execute "norm 2j"
  startinsert
endfunction

" Associated command for Logd function
command! Logd call Logd() 

" Set colors for markdown
function! MarkdownColours()
 highlight mkdHeading ctermfg=141
 highlight htmlH1 ctermfg=141
 highlight htmlH2 ctermfg=141
 highlight htmlH3 ctermfg=141
 highlight htmlH4 ctermfg=141
 highlight htmlH5 ctermfg=141
 highlight htmlH6 ctermfg=141
 highlight htmlBold ctermfg=215
 highlight mkdBold ctermfg=215
 highlight mkdLink ctermfg=212
 highlight mkdURL ctermfg=117
 highlight mkdCodeDelimiter ctermfg=84
 highlight mkdCodeStart ctermfg=84
 highlight mkdCodeEnd ctermfg=84
 highlight mkdBlockquote ctermfg=228
endfunction

autocmd BufNewFile,BufRead *.md call MarkdownColours() 

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""Golang Development""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
