set nocompatible

filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'base16-project/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
call vundle#end()           

filetype plugin indent on  

syntax on

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
set cursorline
set nobackup
set noswapfile
set nowrap
set backspace=2 

let mapleader = " "

nnoremap <leader>g <cmd>G<cr>
nnoremap <leader>gp <cmd>Git push<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>t :term<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>fj :Rg<CR>



let g:tmuxline_powerline_separators = 0


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <c-@> coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:go_list_type="quickfix"
let g:go_fmt_command="goimports"
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_fmt_fail_silently=1


hi CocUnderline gui=undercurl term=undercurl
hi CocErrorHighlight ctermfg=red  guifg=#c4384b gui=undercurl term=undercurl
hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl
