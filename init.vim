set number
set clipboard=unnamed
set encoding=UTF-8
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set updatetime=300

nmap <leader>rn <Plug>(coc-rename)
nmap <F1> :CHADopen<CR>
nmap <F2> :bprevious<CR>
nmap <F3> :bnext<CR>

call plug#begin('C:\Users\user\AppData\Local\nvim\autoload\plugged')
    Plug 'mhinz/vim-startify'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'joshdick/onedark.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'fannheyward/telescope-coc.nvim'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'cohama/lexima.vim'
    Plug 'kassio/neoterm'
    Plug 'mattn/emmet-vim'
    Plug 'alvan/vim-closetag'
call plug#end()

syntax on
colorscheme onedark
set termguicolors

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:user_emmet_leader_key=','
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,php'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
