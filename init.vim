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
set pumheight=10

"cursor highlighting in active buffer
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType NvimTree call glyph_palette#apply()
    autocmd FileType startify call glyph_palette#apply()
    autocmd FileType lspkind call glyph_palette#apply()
    autocmd FileType lspsaga call glyph_palette#apply()
    autocmd FileType LSP call glyph_palette#apply()
augroup END

"open terminal - Powershell Core
command Pwsh terminal pwsh
nnoremap <C-t> :Pwsh<CR>
"close terminal mode
tnoremap <Esc> <C-\><C-n>

"nmap <leader>rn <Plug>(coc-rename)
"Move to previous buffer
nmap <F2> :bprevious<CR>
"Move to next buffer
nmap <F3> :bnext<CR>

"Window resizing
nnoremap <M-Down> :resize -2<CR>
nnoremap <M-Up> :resize +2<CR>
nnoremap <M-Left> :vertical resize -2<CR>
nnoremap <M-Right> :vertical resize +2<CR>

"Better tabbing
vnoremap < <gv
vnoremap > >gv

"Normal saving
nnoremap <C-s> :w<CR>

"Nvim-tree keybinds
nnoremap <C-e> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

call plug#begin('~/AppData/Local/nvim/autoload/plugged/')
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'cohama/lexima.vim'
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
    "Plug 'HendrikPetertje/vimify'
    Plug 'projekt0n/github-nvim-theme'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kdheepak/tabline.nvim'
    Plug 'rcarriga/nvim-notify'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'lambdalisue/glyph-palette.vim'
call plug#end()

"syntax highlighting on
syntax on

"Emmet and auto-tag-closing
let g:user_emmet_leader_key=','
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,php'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

"LSP keybinds
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

"Leader key
let g:mapleader=","

"telescope keybinds
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.builtin{}<CR>
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <Leader>bfs <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

"Nvim-tree config
let g:nvim_tree_git_hl = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_synlink_arrow = ' >> '
let g:nvim_tree_show_icons = {
    \ 'git' : 1,
    \ 'folders' : 1,
    \ 'files' : 1,
    \ 'folder_arrows' : 1,
    \}
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""
"LUA Config

lua <<EOF

--LSP servers
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.emmet_ls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.jsonls.setup{}

--Nvim-tree setup
require'nvim-tree'.setup{
    diagnostics = {
        enable = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        }
    }
}

--Treesitter setup
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'javascript', 'css', 'html', 'json', 'lua', 'php', 'typescript', 'vim' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    }
}

--Nvim-cmp
local cmp = require'cmp'
--LSPkind - autocompletion symbols
local lspkind = require('lspkind')
--Nvim-cmp setup
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    formatting = {
        format = require('lspkind').cmp_format({with_text = true, menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
            path = "[Path]"
        })})
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
        })
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' }
    }
})

--Lualine and Tabline setup
require('tabline').setup()
require('lualine').setup({
    options = {
        theme = 'github',
    },
    extensions = { 'nvim-tree' }
})

--Editor theme - GitHub
require("github-theme").setup({
    theme_style = 'dark',
    sidebars = {'qf', 'vista_kind', 'terminal', 'packer'},
    dark_sidebar = true,
    comment_style = 'italic',
    keyword_style = 'NONE',
    function_style = 'NONE',
    variable_style = 'NONE'
})

--Git signs - status lines of insertion/modification/deletion
require('gitsigns').setup()

--Colorizer setup
require('colorizer').setup()

vim.opt.list = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.g.indent_blankline_context_patterns = {
    'class',
    'function',
    'method',
    '^if',
    '^while',
    '^typedef',
    '^for',
    '^object',
    '^table',
    'block',
    'arguments',
    'typedef',
    'while',
    '^public',
    'return',
    'if_statement',
    'else_clause',
    'jsx_element',
    'jsx_self_closing_element',
    'try_statement',
    'catch_clause',
    'import_statement',
    'labeled_statement',
    'let',
}
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    --char = "|",
    space_char_blankline = " ",
    show_current_context = true,
    context_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
EOF

augroup IndentBlanklineContextAutogroup
    autocmd!
    autocmd CursorMoved * IndentBlanklineRefresh
augroup END

" LUA Config end
"""""""""""""""""""""""""""""

set termguicolors
hi CursorLineNR term=bold ctermfg=Yellow gui=bold guifg=Yellow
