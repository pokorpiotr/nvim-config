set number
set clipboard=unnamed
set encoding=UTF-8
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set updatetime=300
set completeopt=menu,menuone,noselect

nmap <leader>rn <Plug>(coc-rename)
nmap <F1> :CHADopen<CR>
nmap <F2> :bprevious<CR>
nmap <F3> :bnext<CR>

call plug#begin('C:\Users\user\AppData\Local\nvim\autoload\plugged')
    Plug 'mhinz/vim-startify'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'joshdick/onedark.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    "Plug 'fannheyward/telescope-coc.nvim'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'cohama/lexima.vim'
    "Plug 'kassio/neoterm'
    Plug 'mattn/emmet-vim'
    Plug 'alvan/vim-closetag'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-path'
    Plug 'onsails/lspkind-nvim'
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

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs <cmd>Lspsaga signature_help<CR>

"
let g:mapleader=","

"
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.builtin{}<CR>

"
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

"
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>

"
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

"
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>

"
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>

"
nnoremap <Leader>bfs <cmd>lua require'telescope.builtin'.find_files{}<CR>

"
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

"
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

lua <<EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.emmet_ls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.jsonls.setup{}

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'javascript', 'css', 'html', 'json', 'lua', 'php', 'typescript', 'vim' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        },
    }
local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup({
    formatting = {
        format = require('lspkind').cmp_format({with_text = true, menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
            path = "[Path]",
        })})
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' }
    },
})
EOF
