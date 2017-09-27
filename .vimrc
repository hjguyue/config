" be iMproved, required
set nocompatible
set noswapfile

" number
set nu

" status
set laststatus=2

" scroll
set scrolloff=3

" tab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" indent
set ai
set smartindent

" search
set incsearch
set hlsearch
set smartcase
set ic

" pastetoggle
set pastetoggle=<f5>
" paste to system
if $TMUX == ''
  set clipboard+=unnamed
endif

" visualbeep
"set vb t_vb=

" syntax
syn on

" color 
syntax enable
set background=dark
colorscheme solarized
set cursorline
hi Normal ctermbg=None
hi LineNr ctermfg=245 ctermbg=None
hi NonText ctermfg=234 ctermbg=None
hi Visual ctermbg=246
hi Function ctermfg=154
hi Title ctermfg=None
hi Directory ctermfg=245
hi PreProc ctermfg=161
hi StorageClass ctermfg=161
hi Identifier ctermfg=None
hi String ctermfg=222
hi Conditional ctermfg=81
hi Define ctermfg=154
hi Repeat ctermfg=81
hi Operator ctermfg=81
hi Label ctermfg=81
hi Exception ctermfg=161
" color for Pmenu
hi PmenuSel ctermfg=Black ctermbg=250 cterm=bold
hi Pmenu ctermfg=Black ctermbg=White

" backspace
set backspace=indent,eol,start


" Vundle required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'

"Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'gcmt/taboo.vim'                  " simplify tab name

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'yegappan/grep'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" leader key
let mapleader=","

" NERDTree Plugin:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeWinSize=27   
let NERDTreeIgnore=['\.o$', '\.pyc$']
map <C-n> :NERDTreeToggle<CR>

" NERDTreeTabs Plugin:
map <C-t> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1

" POWERLINE Plugin:
"let g:Powerline_symbols = 'fancy'
" VIM-airline:
let g:airline_powerline_fonts = 1

" YouCompleteMe Plugin:
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_min_num_of_chars_for_completion = 2 "number of characters the user needs to type before trigged
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_filetype_blacklist = 
\{'tagbar' : 1, 'qf' : 1, 'notes' : 1, 'markdown' : 1, 'unite' : 1, 'text' : 1, 'vimwiki' : 1, 'gitcommit' : 1,}
set completeopt-=preview
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_goto_buffer_command = 'same-buffer'  " Default: same-buffer, other: new-tab
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Ultisnips Plugin:
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" Grep:
set switchbuf+=usetab,newtab
nnoremap <silent><C-G><C-R> :copen<CR>
nnoremap <silent><C-G><C-G> :cclose<CR>

" key map
inoremap <c-o> <esc>
vnoremap <c-o> <esc>

"set timeoutlen=100
"inoremap ( ()<esc>i
"inoremap [ []<esc>i
"inoremap { {}<esc>i
"inoremap ' ''<esc>i
"inoremap " ""<esc>i

nnoremap <c-left> ^
nnoremap <c-right> g_
nnoremap <c-h> ^
nnoremap <c-l> g_
vnoremap <c-left> ^
vnoremap <c-right> g_
vnoremap <c-h> ^
vnoremap <c-l> g_
inoremap <c-left> <esc>^i
inoremap <c-right> <esc>g_a
inoremap <c-h> <esc>^i
inoremap <c-l> <esc>g_a

" tab
map gw <esc>:tabclose<CR>
map gn <esc>:tabnew<CR>

" save
inoremap <f8> <esc>:w<CR>
nnoremap <f8> <esc>:w<CR>

" command
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" avoid replacement while pasting
xnoremap p pgvy

noh
