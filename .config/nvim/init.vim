" vim: set filetype=vim:
"""
""" Plugins
"""
" Plug Installer
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup PLUG
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'  " Base16 colorschemes
Plug 'vim-airline/vim-airline'  " Status line
Plug 'vim-airline/vim-airline-themes'  " Status line themes
Plug 'francoiscabrol/ranger.vim'  " Ranger file manager
Plug 'sheerun/vim-polyglot'  " Defaults for languages
Plug 'w0rp/ale'  " Linter
Plug 'tpope/vim-vinegar'  " Better netrw defaults; <hyphen>
Plug 'tpope/vim-surround'  " Surround text; [visual]S <p>
Plug 'tpope/vim-commentary'  " Commenting; [visual]gc
Plug 'tpope/vim-fugitive'  " Git; :Gstatus, :Gcommit, ...
Plug 'tpope/vim-repeat'  " Repeat for supported plugins
Plug 'mattn/emmet-vim'  " Emmet; tab after tag text, html:5<tab>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " Fuzzy finder; :Files, :Buffers, :Tags
Plug 'junegunn/vim-peekaboo'  " Register viewer; <quote>
Plug 'junegunn/vim-easy-align'  " Text alignment; [visual]ga
Plug 'justinmk/vim-sneak'  " Easy cursor jumping; s/S
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'  " Snippets for FZF
Plug 'moll/vim-bbye'  " Close buffer; :Bdelete
Plug 'Yggdroot/indentLine'  " Space indentation
Plug 'ryanoasis/vim-devicons'  " File icons

" Neovim-only Plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Vim-only Plugins
else
  Plug 'tpope/vim-sensible'  " Sensible defaults
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()


"""
""" Built-in Settings
"""
syntax on
colorscheme base16-monokai
set encoding=UTF-8
set t_Co=256
set background=dark
if (has('termguicolors'))
 set termguicolors
endif

" List
set list
set listchars=tab:·,trail:·,precedes:^,extends:$

" Commands
set showcmd

" Speed
set regexpengine=1

" Timeouts
set timeoutlen=1000
set ttimeoutlen=0

" Rulers
set colorcolumn=80

" Wrapping
set wrap!

" Indentation
set shiftwidth=2
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

" Relative line numbers
set number
set relativenumber

" Splits
set splitbelow
set splitright

" Leader
let g:mapleader = ' '

" Sessions
let g:sessions_dir = '~/vim-sessions'


"""
""" Built-in Mappings
"""
" Commands
nmap ; :

" New lines
nnoremap <Enter> o<Esc>
nnoremap <S-Enter> O<Esc>

" Terminal
tnoremap <leader><Esc> <C-\><C-n>

" Cut and Paste
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P

" Save
noremap <Space><Esc> :w<CR>
noremap <C-s> :w<CR>

" Line navigation
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Split navigation
map <Space> <Nop>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Buffer navigation
noremap <Leader>j :bprev<CR>
noremap <Leader>k :bnext<CR>
noremap <Leader>q :Bdelete<CR>

" Tab navigation
noremap <Leader>h :tabp<CR>
noremap <Leader>l :tabn<CR>


"""
""" Plugin Settings
"""
" Airline
let g:airline_powerline_fonts = 1

" Netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Sneak
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" FZF
noremap <Leader>b :Buffers<CR>
noremap <Leader>s :Snippets<CR>
noremap <C-p> :FZF<CR>
noremap <Leader>t :Windows<CR>
noremap <Leader>m :Marks<CR>

" Easy Align
xmap ga <Plug>(EasyAlign)

" Indents
let g:indentLine_char = ''
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" File Types
augroup FILETYPES
  autocmd FileType c setlocal shiftwidth=4
  autocmd FileType cpp setlocal shiftwidth=4
  autocmd FileType py setlocal shiftwidth=4
  autocmd FileType go setlocal shiftwidth=4
augroup END