" vim-bootstrap

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

if has ('win32')
" windows
  let $MY_VIMFILES_PATH = $VIM . '/vimfiles'
else
  let $MY_VIMFILES_PATH = $HOME. '/.vim'
endif

let vimplug_exists= expand('$MY_VIMFILES_PATH/plug.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,go,lisp,python,rust"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  let s:save_cwd = getcwd()
  silent exec '!mkdir '. expand($MY_VIMFILES_PATH)
  lcd $MY_VIMFILES_PATH
  silent !curl -fLo ./plug.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  lcd `=s:save_cwd` " or exec 'lcd ' . s:save_cwd
  unlet s:save_cwd

  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

if has('nvim')
let $MYVIMRC=$VIM. '/sysinit.vim'
endif

set rtp+=$MY_VIMFILES_PATH/plug.vim
function! PlugCond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"  Required: {{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('$MY_VIMFILES_PATH/plugged')

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Make sure you use single quotes

" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

" Speeddating
Plug 'tpope/vim-speeddating', { 'for': 'org' }

" org-mode
Plug 'jceb/vim-orgmode', { 'for': 'org' }

" Multiple Plug commands can be written in a single line using | separators
Plug 'tpope/vim-surround' |  Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/echodoc.vim'

" confict with slimv, slimv can't prompt
Plug 'jiangmiao/auto-pairs'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" color scheme
Plug 'lifepillar/vim-solarized8'
if has('win32')
  Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' } | Plug 'Yggdroot/indentLine'
else
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } | Plug 'Yggdroot/indentLine'
endif

Plug 'ziglang/zig.vim'
" buffer manage
Plug 'jlanzarotta/bufexplorer'

" Plug 'ervandew/supertab'

"
Plug 'Valloric/YouCompleteMe'

" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'puremourning/vimspector'

Plug 'elzr/vim-json'

Plug 'chrisbra/vim-xml-runtime'

" Enable completion where available.
" This setting must be set before ALE is loaded
" let g:ale_completion_enabled = 1
" Plug 'dense-analysis/ale'

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" for python
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" for perl
" Plug 'vim-perl/vim-perl', { 'for': 'perl'}

Plug 'skywind3000/asyncrun.vim' |  Plug 'skywind3000/asynctasks.vim'

" for Markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode' |", { 'for' : 'markdown' }

Plug 'neomake/neomake'

" for lisp
Plug 'kovisoft/slimv', { 'for' : ['lisp', 'scheme'] }

" Plug 'bhurlow/vim-parinfer', { 'for': 'lisp' }

" for sql
Plug 'mbra/prettysql', { 'for' : 'sql' }

" for go
" Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'fatih/vim-go' |", { 'for': 'go' }

Plug 'luochen1990/rainbow'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'rust-lang/rust.vim' |", { 'for': 'rust' }

Plug 'mattn/emmet-vim'

Plug 'cespare/vim-toml'

Plug 'ryanoasis/vim-devicons'

"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
" if filereadable(expand("~/.vimrc.local.bundles"))
  " source ~/.vimrc.local.bundles
" endif

" Initialize plugin system
" else
  " Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
" endif
call plug#end()
" }}}

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
if has('win32')
  set termencoding=gbk
else
  set termencoding=utf-8
endif
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1
" set binary "
set ttyfast
set nobomb

" quickfix-window output encoding
"  neovim not surport
if !has('nvim')
  set makeencoding=char
endif

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overritern by autocmd rules
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

if has("win32")
  set fileformats=dos,unix,mac
elseif has("gui_mac") || has("gui_macvim")
  set fileformats=mac,unix,dos
else
  set fileformats=unix,dos,mac
endif

" disable automatic comment insertion
"  http://http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
" https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines
" r       Automatically insert the current comment leader after hitting
"        <Enter> in Insert mode.
" c       Auto-wrap comments using textwidth, inserting the current comment
"        leader automatically.
" o       Automatically insert the current comment leader after hitting 'o' or
 "       'O' in Normal mode.
au FileType * setlocal formatoptions-=c formatoptions-=o

if exists('$SHELL')
  set shell=$SHELL
else
  if has('win32')
    set shell=cmd.exe
  else
    set shell=/bin/sh
  endif
endif

if  has('win32')
  set mzschemedll=libracket3m_a4da80.dll
  set mzschemegcdll=libracket3m_a4da80.dll
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber

set mousemodel=popup
" set t_Co=256 "vim color display incorrect
set guioptions=
" set guioptions-=m
" set guioptions-=T
" set guioptions-=r
" set guioptions-=l
" set guioptions-=L

if has('gui') && has('win32')
  " set guifont=Hack\ NF:h12:qPROOF:cDEFAULT
  set guifont=Hack\ NF:h12
" Rendering Bug with the statusline and DirectX Renderer on Windows #1520
" https://github.com/vim/vim/issues/1520
  set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
endif

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    elseif has('termguicolors')
      set termguicolors
    endif
  endif
endif


if &term =~ '256color'
  set t_ut=
endif

"" fix menu display not correct
if has("win32") && has('gui')
  set helplang=en
  source $VIMRUNTIME/delmenu.vim
  set langmenu=en_US
  set ambiwidth=double
  source $VIMRUNTIME/menu.vim
  " language messages Zh_CN.utf-8
  language messages en_Us
  " source $VIMRUNTIME/mswin.vim
  " behave mswin
endif

" disable preview window
set completeopt-=preview
" augroup completion_preview_close
  " autocmd!
  " if v:version > 703 || v:version == 703 && has('patch598')
    " autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  " endif
" augroup END


" set lines=999
" set columns=999

" set splitbelow
" set splitright

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" cnoreabbrev <expr> cargo ((getcmdtype() == ':' && getcmdpos() <=6)? 'bot term Cargo' : 'Cargo')

" cnoreabbrev <expr> Cargo ((getcmdtype() == ':' && getcmdpos() <=6)? 'bot term Cargo' : 'Cargo')
"*****************************************************************************
"" Mappings
"*****************************************************************************
"" use system clipboard

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR> :pwd<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

inoremap jk <esc>
" inoremap kj <esc>

noremap j gj
noremap k gk
if has('nvim')
  inoremap <silent> <S-Insert> <C-R>+
  " inoremap <silent> <S-Insert> <esc>"*gPi
  noremap <silent> <S-Insert> "*gP<CR>
  vmap <silent> <S-Insert> d"*gP
endif
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Close buffer
noremap <F4> :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Switching windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

inoremap <A-h> <left>
inoremap <A-l> <right>
inoremap <A-j> <down>
inoremap <A-k> <up>
inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w

cnoremap <A-h> <left>
cnoremap <A-l> <right>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" search next selected context
vnoremap // y/<c-r>"<cr>

" set textwidth=78

" ruby sourcecode style
" set tabstop=8
" set softtabstop=4
" set noexpandtab

" xml
au FileType xml setlocal mps+=<:>
au FileType xml let b:AutoPairs={'<':'>', '(': ')', '[':']', '{':'}', '"':'"', "'":"'"}

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR>

" map <M-F5> :%s/\(;\s\?\\|&\)/\r/g<CR>

" python keymap
au FileType python imap <C-F5> <esc>:w<CR> :vert :term python %<CR>
au FileType python nmap <C-F5> :w<CR> :vert :term python %<CR>

au FileType python inoremap <C-F5> <esc>:w<CR>:botright term python %<CR>
au FileType python nmap <C-F5> :w<CR>:botright term python %<CR>

" perl keymap
" au FileType perl imap <C-F5> <esc>:w<CR>:!perl %<CR>
" au FileType perl nmap <C-F5> <esc>:w<CR>:!perl %<CR>

" lua keymap
" au FileType lua imap <C-F5> <esc>:w<CR>:!lua %<CR>
" au FileType lua nmap <C-F5> :w<CR>:!lua %<CR>

" json
" au FileType json nmap <C-F5> :w<CR>:%!python -m json.tool<CR>

" au FileType qf call AdjustWindowHeight(3, 10)
" function! AdjustWindowHeight(minheight, maxheight)
   " let l = 1
   " let n_lines = 0
   " let w_width = winwidth(0)
   " while l <= line('$')
       " " number to float for division
       " let l_len = strlen(getline(l)) + 0.0
       " let line_width = l_len/w_width
       " let n_lines += float2nr(ceil(line_width))
       " let l += 1
   " endw
   " exe max([min([n_lines, a:maxheight]), a:minheight]) . 'wincmd _'
" endfunction
" https://gist.github.com/juanpabloaj/5845848

" open quickfix window at onece
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"""""""""""""""""""""" "Quickly Run """"""""""""""""""""""
"map :call  QuicklyRun()
func! QuicklyRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<" exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        " exec "!go build %<"
        exec 'botright term go run ./'
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    elseif &filetype == 'rust'
        " exec 'bot term Cargo run'
        exec 'bot term Cargo run %'
    endif
endfunc

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"" sh/bash
augroup vimrc-sh-bash
  autocmd!
  autocmd FileType sh,shell,bash setlocal noexpandtab ai sw=4 ts=4 sts=4
augroup END

augroup tab_set
  autocmd!
  autocmd FileType php,python,c,java,perl,shell,bash,ruby,cpp,javascript set ai
  autocmd FileType php,python,c,java,perl,shell,bash,ruby,cpp,javascript set sw=4
  autocmd FileType php,python,c,java,perl,shell,bash,ruby,cpp,javascript set ts=4
  autocmd FileType php,python,c,java,perl,shell,bash,ruby,cpp,javascript set sts=4
  autocmd FileType coffee,html,css,xml set ai
  autocmd FileType coffee,html,css,xml set sw=2
  autocmd FileType coffee,html,css,xml set ts=2
  autocmd FileType coffee,html,css,xml set sts=2
  autocmd FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup END

set autoread

"*****************************************************************************
"" Plugin config
"*****************************************************************************
" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" rainbo {{
let g:rainbow_active=1
" }}

" gitgutter {{
let g:gitgutter_max_signs=2048
" }}

" vim-solarized8 {{{
if filereadable(expand('$MY_VIMFILES_PATH/plugged/vim-solarized8/Readme.md'))
  if has('gui') || has('nvim') || $COLORTERM == 'truecolor' || $TERM== 'xterm-256color'
    set background=dark
    colorscheme solarized8_high
  else
    colorscheme desert
  endif
else
  colorscheme desert
  syntax on
endif

" vim-airline-themes {{{
let g:airline_theme='solarized'
" let g:airline_theme='dark'
" }}}

" tagbar {{{
nmap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_autofocus=1
" }}}

" NERDTree {{{
let g:nerdtree_tabs_open_on_new_tab=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeToggle<CR>
" }}}

" grep.vim {{{
" nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'
" }}}

" nerdcommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims     = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
let g:NERDMenuMode        = 0
" }}}

" ale {{{
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_fix_on_save = 0
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
    \ 'rust': ['analyzer',],
    \ 'c':['clangd',],
    \ }
    " \ 'python': ['yapf', 'pylint', 'pycodestyle'],
    " \ 'go': ['gofmt', 'golint', 'govet', 'golangserver'],
    " \ }

let g:ale_fixers = {
    \ 'python': ['yapf', 'autopep8'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'sql': ['sqlfmt'],
    \ }
" let g:ale_sql_sqlfmt_options = '-u'

nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
nmap <Leader>s :ALEToggle<CR>
" nnoremap <Leader>d :ALEDetail<CR>
nnoremap <Leader>f :ALEFix<CR>

" nnoremap <leader>jd :ALEGoToDefinition<CR>
let g:ale_rust_cargo_check_all_targets = 1

let g:ale_rust_rls_toolchain= 'stable'
" }}}

"" supertab {{{
" let g:SuperTabDefaultCompletionTypeDiscovery = [
" \ "&completefunc:<c-x><c-u>",
" \ "&omnifunc:<c-x><c-o>",
" \ ]
" let g:SuperTabLongestHighlight = 1
" }}}

" fix https://github.com/davidhalter/jedi-vim/issues/870
py3 import os; sys.executable=os.path.join(sys.prefix, 'python.exe')
" jedi {{{
let g:jedi#popup_on_dot=0
let g:jedi#auto_initialization=1
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0
let g:jedi#smart_auto_mappings=0
let g:jedi#completions_command=""
let g:jedi#show_call_signatures="1"
let g:jedi#show_call_signatures_delay=0
" }}}

" rust config

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" YouComplecteMe {{{
let g:ycm_language_server =
  \ [
    \{
    \     'name': 'zls',
    \     'filetypes': [ 'zig' ],
    \     'cmdline': [ 'zls.exe' ]
    \}
  \ ]
let g:ycm_filetype_blacklist = {
      \ 'lisp': 1,
      \ }
let g:ycm_global_ycm_extra_conf=$MY_VIMFILES_PATH. '/vim.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

" <c-;> <c-,> etc not work, so set <m-space>
let g:ycm_key_invoke_completion = '<M-Space>'

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
noremap <c-z> <NOP>

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=0
let g:ycm_use_ultisnips_completer=0
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_auto_hover = 0
nmap <leader>k <plug>(YCMHover)
" https://zhuanlan.zhihu.com/p/33046090
let g:ycm_semantic_triggers =  {
     \ 'c,cpp,python,go,java,erlang,perl': ['re!\w{2}'],
     \ 'cs,lua,javascript,rust': ['re!\w{2}'],
     \ }

" let g:ycm_rust_src_path=$HOME. '/.rustup/toolchains/stable-x86_64-pc-windows-msvc/lib/rustlib/src/rust/src'

if has('win32')
  let g:ycm_rust_toolchain_root = $HOME. '/.rustup/toolchains/stable-x86_64-pc-windows-msvc'
else
  let g:ycm_rust_toolchain_root = $HOME. '/.rustup/toolchains/stable-x86_64-unknown-linux-gnu'
endif

let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" YcmCompleter Subcommands
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" }}}

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <leader>,  <C-x><C-o>
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>


" slimv {{{
" let g:slimv_leader = ',,'
" skip auto pairs initialization for lisp to deactivat it.
au FileType lisp let b:autopairs_loaded = 1
au FileType lisp let b:loaded_youcompleteme = 1
let g:slimv_menu=1
let g:lisp_rainbow=0
" let g:paredit_mode=0
" let g:paredit_electric_return=0
let g:swank_log=0
" let g:slimv_swank_cmd = '!start "D:/Program Files/Steel Bank Common Lisp/1.4.14/sbcl.exe" --load "D:/Program Files/Vim/vimfiles/plugged/slimv/slime/start-swank.lisp" '
" let g:slimv_swank_cmd = '!start /MIN "D:/ccl-1.11.5-windowsx86/ccl/wx86cl64.exe" -l "D:/Program Files/Vim/vimfiles/plugged/slimv/slime/start-swank.lisp" '
let g:slimv_swank_scheme = '!start "C:/Program Files (x86)/MIT-GNU Scheme/bin/mit-scheme.exe" --band "C:\Program Files (x86)\MIT-GNU Scheme\lib\all.com" --library "C:\Program Files (x86)\MIT-GNU Scheme\lib" --load "D:\Program Files\Vim\vimfiles\plugged\slimv\slime\contrib\swank-mit-scheme.scm"'
let g:slimv_clhs_root='file:///d:/Program\%20Files/Vim/vimfiles/HyperSpec-7-0/HyperSpec/Body/'
" or let g:slimv_clhs_root='file:///d:/Progra~1/Vim/vimfiles/HyperSpec-7-0/HyperSpec/Body/'
" autocmd BufNewFile,BufRead *.lisp setlocal noexpandtab tabstop=2 shiftwidth=2
" }}}j

"  Markdown {{{
let g:vim_markdown_folding_disabled=1
" don't conceal when edit link at insert mode
let g:indentLine_concealcursor = 'nc'
" close conceal
let g:vim_markdown_conceal = 0
"  }}}

"  markdown-preview {{{
" let g:mkdp_path_to_chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
let g:mkdp_path_to_chrome = 'D:\Program Files\Mozilla Firefox\firefox.exe'
"  }}}

"  vim-table-mode {{{
" let g:table_mode_corner_corner = '+'
" let g:table_mode_header_fillchar = '='
"  }}}

" indentLine {{{
let g:vim_json_syntax_conceal = 1
" let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_bgcolor_gui = '#FF5F00'
if $TERM == 'xterm' || $TERM == 'xterm-256color'
  let g:indentLine_bgcolor_term = 255
  let g:indentLine_color_term = 0
endif
" }}}

" vim-go {{{
let g:go_doc_popup_window = 1
" let g:go_debug = ['shell-commands', 'debugger-state', 'debugger-commands', 'lsp']
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>e <Plug>(go-rename)
  " au FileType go nmap <S-F5> :GoDebugStop<CR>
  " au FileType go nmap <F5> :call QuicklyDebug('')<CR><CR>
  " au FileType go nmap <C-F5> :call QuicklyRun()<CR>
  " au FileType go imap <F5> :call QuicklyDebug('')<CR><CR>
  " au FileType go imap <C-F5> :call QuicklyRun()<CR>

  au Filetype go nmap <leader>gt <plug>(go-coverage-toggle)
  au Filetype go nmap <silent> <leader>l <plug>(go-metalinter)
  au Filetype go nmap <c-g> :godecls<cr>
  au Filetype go nmap <leader>dr :godeclsdir<cr>
  au Filetype go imap <c-g> <esc>:<c-u>godecls<cr>
  au Filetype go imap <leader>dr <esc>:<c-u>godeclsdir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
augroup END


let g:go_list_type = 'quickfix'
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = 'camelcase'
let g:go_info_mode = 'gopls'
let g:go_def_mode = 'gopls'
let g:go_term_enabled = 1
let g:go_debug_log_output = ''
" go install proxy
let $http_proxy='127.0.0.1:9910'
let $GOPROXY='https://goproxy.io'
" let $GO111MODULE='on'
" let $GO111MODULE='off'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
" }}}

" LeaderF {{{
let g:Lf_ShortcutF = '<C-P>'
" }}}


" snippets {{{
" let g:UltiSnipsExpandTrigger='<tab>'
" let g:UltiSnipsJumpForwardTrigger='<c-b>'
" let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit='vertical'
" }}}

" vim-snippets {{{
let g:snips_author = 'dbger'
let g:snips_email = '3982742+dbger@users.noreply.github.com'
let g:snips_github = 'https://github.com/dbger'
" }}}

" auto-pair {{{
" let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
" }}}

" rust.vim {{{
let g:rustfmt_autosave = 1
" }}}

" echodoc {{{
set noshowmode
let g:echodoc_enable_at_startup=1
" }}}

" vim-airline {{{
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
" let g:airline_left_sep = "\uE0B4"
" let g:airline_right_sep = "\uE0B6"
let g:airline#extensions#virtualenv#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {'colnr':' '}
endif
let g:airline_powerline_fonts = 1
" }}}

" AsyncRun {{{
" augroup vimrc
    " autocmd QuickFixCmdPost * botright copen 8
" augroup END
if has('win32')
  let g:asyncrun_encs='gbk'
else
  let g:asyncrun_encs='utf-8'
endif
let g:asyncrun_open=6
let g:asyncrun_rootmarks=['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_template=$VIM . '/task_template.ini'
" noremap <F4> :call asyncrun#quickfix_toggle(8, 0)<cr>
" }}}


" vimspector {{{
let g:vimspector_enable_mappings='VISUAL_STUDIO'
" }}}

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

 " vim:set ft=vim ts=2 sw=2:
