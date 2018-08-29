" vim-bootstrap

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('$VIM/vimfiles/plug.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,go,lisp,python,rust"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo $VIM/plug.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

set rtp+=$VIM/vimfiles/plug.vim
if has('nvim')
let $MYVIMRC=$VIM. '/sysinit.vim'
endif
"  Required: {{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('$VIM/vimfiles/plugged')

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

" Speeddating
Plug 'tpope/vim-speeddating', { 'for': 'org' }

" org-mode
Plug 'jceb/vim-orgmode', { 'for': 'org' }

" Multiple Plug commands can be written in a single line using | separators
Plug 'tpope/vim-surround' | Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-repeat'

Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/echodoc.vim'

" confict with slimv, slimv can't prompt
Plug 'jiangmiao/auto-pairs'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

Plug 'bling/vim-airline'

" color scheme
Plug 'lifepillar/vim-solarized8'

Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' } | Plug 'Yggdroot/indentLine'

" buffer manage 
Plug 'jlanzarotta/bufexplorer'

" Plug 'ervandew/supertab'

"
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'

" if has('nvim')
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
    " Plug 'Shougo/deoplete.nvim'
    " Plug 'roxma/nvim-yarp'
    " Plug 'roxma/vim-hug-neovim-rpc'
" endif


" for python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'for': 'python' }

" for perl
Plug 'vim-perl/vim-perl', { 'for': 'perl'}

" Plug 'skywind3000/asyncrun.vim',

" for Markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode' |", { 'for' : 'markdown' }


" for lisp
Plug 'kovisoft/slimv', { 'for' : ['lisp', 'scheme'] }

" Plug 'bhurlow/vim-parinfer', { 'for': 'lisp' }

" for sql
Plug 'mbra/prettysql', { 'for' : 'sql' }

" for go
" Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'fatih/vim-go' |", { 'for': 'go' }

Plug 'luochen1990/rainbow'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-gocode.vim'
"

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets', { 'for': ['go', 'rust', 'python'] }

" for rust
" Plug 'racer-rust/vim-racer', { 'for' : 'rust' }
"
Plug 'rust-lang/rust.vim' |", { 'for': 'rust' }

Plug 'mattn/emmet-vim'

" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'tag': 'binary-*-x86_64-pc-windows-gnu'}
" Plug 'maralla/completor.vim'

Plug 'cespare/vim-toml' 

" gdb
Plug 'cpiger/NeoDebug'

"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
" if filereadable(expand("~/.vimrc.local.bundles"))
  " source ~/.vimrc.local.bundles
" endif

" Initialize plugin system
call plug#end()
" }}}

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set termencoding=gbk
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1
" set binary "
set ttyfast
set nobomb

" quickfix-window output encoding
"  neovim not surport
set makeencoding=char

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overritern by autocmd rules
set tabstop=4
set softtabstop=0
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
" set nobackup
" set noswapfile

set fileformats=unix,dos,mac

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
  set shell=cmd.exe |" /bin/sh
endif

" session management
" let g:session_directory = $VIM. '~/.vim/session'
" let g:session_autoload = 'no'
" let g:session_autosave = 'no'
" let g:session_command_aliases = 1

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

set guifont=Consolas:h12:qPROOF:cDEFAULT
" Rendering Bug with the statusline and DirectX Renderer on Windows #1520
" https://github.com/vim/vim/issues/1520
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1

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
    endif
  endif
  
endif


if &term =~ '256color'
  set t_ut=
endif

"" fix menu display not correct
if has("win32")
  set helplang=en
  source $VIMRUNTIME/delmenu.vim
  set langmenu=en_US
  set ambiwidth=double
  source $VIMRUNTIME/menu.vim
  language messages Zh_CN.utf-8
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

cnoreabbrev <expr> cargo ((getcmdtype() == ':' && getcmdpos() <=6)? 'bot term Cargo' : 'Cargo')

cnoreabbrev <expr> Cargo ((getcmdtype() == ':' && getcmdpos() <=6)? 'bot term Cargo' : 'Cargo')
"*****************************************************************************
"" Mappings
"*****************************************************************************

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
inoremap kj <esc>

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

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

map <M-F5> :%s/\(;\s\?\\|&\)/\r/g<CR>

" au FileType python iabbrev <buffer> iff if:<left>
" au FileType python imap <C-F5> <esc>:w<CR> :vert :term python %<CR>
" au FileType python nmap <C-F5> :w<CR> :vert :term python %<CR>

au FileType python inoremap <C-F5> <esc>:w<CR>:botright term python %<CR>
au FileType python nmap <c-F5> :w<CR>:botright term python %<CR>

au FileType perl imap <C-F5> <esc>:w<CR>:!perl %<CR>
au FileType perl nmap <C-F5> <esc>:w<CR>:!perl %<CR>
" lua keymap
au FileType lua imap <C-F5> <esc>:w<CR>:!lua %<CR>
au FileType lua nmap <C-F5> :w<CR>:!lua %<CR>

"  rust keymap
au FileType rust imap <F5> <esc>:w<CR>:call RunIt(1)<CR>
au FileType rust nmap <F5> :w<CR>:call RunIt(1)<CR>
au FileType rust imap <C-F5> <esc>:w<CR>:call RunIt(0)<CR>
au FileType rust nmap <C-F5> :w<CR>:call RunIt(0)<CR>

" json
au FileType json nmap <C-F5> :w<CR>:%!python -m json.tool<CR>

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
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow
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

command! -nargs=* CargoDebug call DebugIt(<q-args>)
function! DebugIt(args)
    if !exists(':Termdebug')
        exec 'packadd termdebug'
    endif
    let l:project_name = expand('%:p:h:h:t')
    let l:cmd = 'TermdebugCommand ../target/debug/' . l:project_name
    if len(a:args) > 0
        let l:cmd = l:cmd . ' ' . a:args
    endif
    exec l:cmd 
endfunction

function! RunIt(debug)
    let l:ext = expand('%:e')
    let l:cmd = ''
    if l:ext == 'rs'
      if a:debug == 1
          call DebugIt('')
          return
      else
          let l:cmd = ':botright term cargo run'
      endif
    elseif l:ext == 'go'
        if a:debug == 1
            let l:cmd = ':GoDebugStart ' . expand('%:t')
        else
            let l:cmd = ':botright term go run %'
        endif
    endif
    if l:cmd != ''
        exec l:cmd
    endif
endfunction

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
        exec "!time python %"
    elseif &filetype == 'html' 
        exec "!firefox % &"
    elseif &filetype == 'go'
        " exec "!go build %<"
        exec "!time go run %" 
    elseif &filetype == 'mkd' 
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &" 
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

" vim-racer {{{
" set hidden
" let g:racer_cmd = $HOME. '/.cargo/bin/racer.exe'
" let g:racer_experimental_completer = 1
" let $RUST_SRC_PATH = $HOME. '/.rustup/toolchains/stable-x86_64-pc-windows-msvc/lib/rustlib/src/rust/src'
" let $RUST_SRC_PATH = $HOME. '/.rustup/toolchains/stable-x86_64-pc-windows-gnu/lib/rustlib/src/rust/src'
" }}}

"  completor {{{
" let g:completor_node_binary = $HOME. '/.cargo/bin/racer.exe'
" let $RUST_SRC_PATH = $HOME. '/.rustup/toolchains/stable-x86_64-pc-windows-msvc/lib/rustlib/src/rust/src'
" let g:completor_gocode_binary = $HOME. '/go/bin/gocode.exe'
"
"  }}}

" vim-solarized8 {{{
if has_key(g:plugs, 'vim-solarized8')
  if has('gui') || has('nvim')
    set background=dark
    colorschem solarized8_flat
  else
    colorschem desert
  endif
else
  colorschem desert
  syntax on
endif
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

" pymode {{{
let g:pymode_options_colorcolumn = 0
let g:pymode_folding             = 0
" fix confilct jedi-vim
let g:pymode_rope                = 0
let g:pymode_python              = 'python3'
let g:pymode_breakpoint          = 1
let g:pymode_breakpoint_bind     = '<leader>b'
let g:pymode_run_bind            = '<leader>ry'

" for ale
"  python synax cheker
let g:pymode_lint=0
" don't check when saving file
let g:pymode_lint_on_write=0
" check when editing file
let g:pymode_lint_on_fly=0
let g:pymode_lint_chekers=['pyflakes', 'pep8']
" don't open QuickFix window when finding error
let g:pymode_lint_cwindow=0
" don't show python-mode signs on slider bar
let g:pymode_lint_signs=0
" }}}

" ale {{{
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✔'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_linters = {
    " \ 'python': ['yapf', 'pylint', 'pycodestyle'],
    " \ 'rust': ['rustc',],
    " \ }

let g:ale_fixers = { 
    \ 'python': ['yapf', 'autopep8'],
    \ }
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
nmap <Leader>s :ALEToggle<CR>
" nnoremap <Leader>d :ALEDetail<CR>
nnoremap <Leader>f :ALEFix<CR>
let g:ale_rust_cargo_check_all_targets = 1
" }}}

"" supertab {{{
" let g:SuperTabDefaultCompletionTypeDiscovery = [
" \ "&completefunc:<c-x><c-u>",
" \ "&omnifunc:<c-x><c-o>",
" \ ]
" let g:SuperTabLongestHighlight = 1
" }}}

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

" YouComplecteMe {{{
let g:ycm_global_ycm_extra_conf=$VIM. '/vimfiles/vim.ycm_extra_conf.py'
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

" https://zhuanlan.zhihu.com/p/33046090
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,go,java,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript,rust': ['re!\w{2}'],
			\ }

let g:ycm_rust_src_path=$HOME. '/.rustup/toolchains/stable-x86_64-pc-windows-msvc/lib/rustlib/src/rust/src'

let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" YcmCompleter Subcommands
nnoremap <leader>jd :YcmCompleter GoTo<CR>
inoremap <leader>;  <C-x><C-o>

function! GenYCM()
    let l:cur_dir=getcwd()
    cd $VIM/Vimfiles/bundle/YCM-Generator
    :silent execute  ":!./config_gen.py ".l:cur_dir
    if v:shell_error == 0
        echom "Generate successfully!"
        :YcmRestartServer
    else
        echom "Generate failed!"
    endif
    exec ":cd ". l:cur_dir
endfunction"
" }}}


" slimv {{{
" let g:slimv_leader = ',,'
let g:slimv_menu=1
let g:lisp_rainbow=0
" let g:paredit_mode=0
" let g:paredit_electric_return=0
" let g:slimv_swank_cmd = '!start "D:/Program Files/Steel Bank Common Lisp/1.4.2/sbcl.exe" -l "D:/Program Files/Vim/vimfiles/plugged/slimv/slime/start-swank.lisp" '
let g:slimv_swank_cmd = '!start /MIN "D:/ccl-1.11.5-windowsx86/ccl/wx86cl64.exe" -l "D:/Program Files/Vim/vimfiles/plugged/slimv/slime/start-swank.lisp" '
let g:slimv_swank_scheme = '!start "C:/Program Files (x86)/MIT-GNU Scheme/bin/mit-scheme.exe" --band "C:\Program Files (x86)\MIT-GNU Scheme\lib\all.com" --library "C:\Program Files (x86)\MIT-GNU Scheme\lib" --load "D:\Program Files\Vim\vimfiles\plugged\slimv\slime\contrib\swank-mit-scheme.scm"'
let g:slimv_clhs_root='file:///d:/Program\%20Files/Vim/vimfiles/HyperSpec-7-0/HyperSpec/Body/'
" or let g:slimv_clhs_root='file:///d:/Progra~1/Vim/vimfiles/HyperSpec-7-0/HyperSpec/Body/'
" autocmd BufNewFile,BufRead *.lisp setlocal noexpandtab tabstop=2 shiftwidth=2
" }}}j

"  Markdown {{{
let g:vim_markdown_folding_disabled=1
" don't conceal when edit link at insert mode
let g:indentLine_concealcursor = 'nc'
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
let g:vim_json_syntax_conceal = 0
" let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_bgcolor_gui = '#FF5F00'
" }}}

" vim-go {{{
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
  au FileType go nmap <S-F5> :GoDebugStop<CR>
  au FileType go nmap <A-F5> :w<CR>:call RunIt(1)<CR>
  au FileType go nmap <C-F5> :w<CR>:call RunIt(0)<CR>
  au FileType go imap <A-F5> <esc>:w<CR>:call RunIt(1)<CR>
  au FileType go imap <C-F5> <esc>:w<CR>:call RunIt(0)<CR>

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
let g:go_info_mode = 'gocode'
let g:go_term_enabled = 1
let $http_proxy='127.0.0.1:9527'

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
let g:airline#extensions#virtualenv#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
" }}}

" LanguageClient-newvim {{{
" let g:LanguageClient_serverCommands = {
    " \ 'rust': [$HOME . '/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    " \ }
" }}}

" deoplete {{{
" let g:python3_host_prog = 'D:/Program Files/Python36/Python.exe'
" let g:deoplete#enable_at_startup = 1
" }}}

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim:ft=vim:et:ts=2:sw=2
