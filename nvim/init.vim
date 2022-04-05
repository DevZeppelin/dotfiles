set number
set mouse=a	            "interactuar con mouse
syntax enable		        "para el code
set showcmd		          "comandos o atajos de teclado, lo muestra abajo
set encoding=utf-8
set showmatch		        "cada veq hay un parentesis nos muestra donde termina
set relativenumber
set sw=2		            "al identar el codigo lo hace con 2 espacion y no 2 tabulaciones

"Plugins > vim-plug

call plug#begin('~/.vim/plugged')

"TEMAS GRUVBOX
Plug 'sainnhe/gruvbox-material'
Plug 'shinchu/lightline-gruvbox.vim'

"LSP	Es quien detect los lenguajes a usar. Antes instales npm tssetup
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'				"Autocompletado
Plug 'preservim/nerdtree'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" autocomplete
Plug 'kiteco/plugins'

" IDE
Plug 'junegunn/fzf'           "Buscador de cadenas de texto super potente
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'      "Muestra con signos donse de agrego una linea y donde se quito
Plug 'yggdroot/indentline'    "Traza linea donde hay tabulacion

" tmux
Plug 'benmills/vimux'                     "Con vsp abro panel vertical, con sp abro horizontal
Plug 'christoomey/vim-tmux-navigator'     "Con Cntrl + (h,j,k,l) navego entre paneles

" git
"Plug 'tpope/vim-fugitive'

call plug#end()


"GRUVBOX Config
set background=dark
let g:gruvbox_material_background='medium'
colorscheme gruvbox-material

"LSP Config
lua << EOF
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF

"NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" tmux navigator
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

" HTML, JSX - Copiado de HolaMundo
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" Lightlane
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \   
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

" coc
autocmd FileType scss setl iskeyword+=@-@

" kite
"let g:kite_supported_languages = ['javascript']
