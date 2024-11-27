""===========================
"" basic setting
""===========================
set nocompatible    "不兼容vi
filetype on  "设置不同文件缩进
set mouse=a         "启用鼠标
set encoding=utf-8  "设置编码
set noerrorbells    "去除错误响铃
set number          "显示行号
set relativenumber "显示相对行号
syntax on           "高亮语法
set noshowmode        "显示当前输入模式
set showcmd         "命令行显示输入命令
" set autochdir       "执行命令在当前目录
" set term=screen-256color        "设施256色
set tabstop=4       "Tab显示为4个空格(仍是tab符号)
set shiftwidth=4    "Tab替换的空格数量为4个
set expandtab       "Tab自动替换成空格
set softtabstop=0   "输入一个Tab时变成对应的Tab和space组合
set backspace=indent,eol,start  "行首退格到上一行行尾
set cursorline      "高亮光标所在行
set wrap            "自动换行
set linebreak       "整词换行
set wrapmargin=2    "距离右边2列时换行
set scrolloff=5     "打开文件时光标在第5行
set laststatus=2    "底部永久显示状态栏2行
set ruler           "右下角显示当前光标位置
set showmatch       "显示配对的另一半括号
set hlsearch        "高亮搜索
set incsearch       "增量搜索
set ignorecase      "忽略大小写
set smartcase       "智能大小写(与ignorecase联用时,搜索test,显示test和Test,搜索Test只显示Test)
set autoread        "当文件外部被改变时,自动更新载入
set hidden          "switch buffer without write
set listchars=tab:»·,trail:·        "显示符号
set list                            "显示符号
set wildmode=longest,list,full
set wildmenu                        "命令行补全
set tags=./.tags;,.tags;       "自动设置tags
set timeout timeoutlen=1000     "按下后等待1000ms
set ttimeout ttimeoutlen=100     "keycode 按下后等待100ms
set updatetime=200
set clipboard=unnamedplus
set completeopt=menuone,noselect
set shortmess-=S     "搜索显示次数

"" change path of vim setting files
let g:vimrc_dir = fnamemodify(expand('<sfile>'), ':h')
let &viminfo .= ',n'.expand(g:vimrc_dir).'/.viminfo'
let &runtimepath .= ','.expand(g:vimrc_dir)
let &packpath .= ','.expand(g:vimrc_dir)

"" cursor shape
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

""===========================
"" map
""===========================
let mapleader=" "
" map s <nop>
inoremap jk <ESC>

" reload vimrc config
nnoremap <leader>R :w<CR>:source %<CR>

"" moving cursor
nnoremap J 5j
nnoremap K 5k
nnoremap H ^
nnoremap L $
vnoremap J 5j
vnoremap K 5k
vnoremap H ^
vnoremap L $
onoremap H ^
onoremap L $

"" change join keybind
nnoremap <leader>j J

"" split window
map <leader>- <C-w>s
map <leader>= <C-w>v
map <leader><BS> <C-w>c

"" move cursor to split window
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
inoremap <C-l> <ESC><C-w>l
inoremap <C-h> <ESC><C-w>h
inoremap <C-j> <ESC><C-w>j
inoremap <C-k> <ESC><C-w>k

"" complete select
inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>

"" control window size
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"" control buffer
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

"" control tab
" nnoremap tb :tabe<CR>
" nnoremap tc :tabc<CR>
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>

"" cancel search highlight
map <leader><CR> :nohlsearch<CR>

"" terminal
tnoremap <ESC><ESC> <C-\><C-n>

"" copy and paste with system
vnoremap <C-C> "+y

"" open lazygit
nnoremap <leader>lg :!lazygit<CR>


""===========================
"" IDE setting
""===========================
if has('ide')
    "" setting for ideavim
    nmap <Leader>R <Action>(IdeaVim.ReloadVimRc.reload)

    " Hide open panels
    nmap <Leader>w <Action>(HideAllWindows)

    " terminal
    nmap <C-q> <Action>(ActivateTerminalToolWindow)
    imap <C-q> <ESC><Action>(ActivateTerminalToolWindow)
    " map <C-q> <Action>(HideActiveTerminalToolWindow)

    nmap <Leader>b <Action>(Switcher)
    nmap <leader>p <Action>(RecentProjectListGroup)
    nmap <leader>o <Action>(RecentFiles)
    nmap <leader>f <Action>(GotoFile)
    nmap <leader>g <Action>(FindInPath)

    " diag
    nmap gh <Action>(ShowErrorDescription)
    nmap gd <Action>(GotoDeclaration)
    nmap gr <Action>(GotoImplementation)
    nmap ]d <Action>(GotoNextError)
    nmap [d <Action>(GotoPreviousError)

    " git
    nmap ]c <Action>(VcsShowNextChangeMarker)
    nmap [c <Action>(VcsShowPrevChangeMarker)

    " Plugins
    set surround
    set multiple-cursors
    set commentary
    set keep-english-in-normal-and-restore-in-insert
    set NERDTree
    nmap <leader>n :NERDTree<CR>

    finish
end

""===========================
"" Plugin setting
""===========================
execute 'source ' . g:vimrc_dir . '/plugins.vimrc'

""==Nerdtree==
nnoremap <leader>n :NERDTreeToggle<CR>
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

"" Nerdtree git plugin config
let NERDTreeMapActivateNode = 'l'
let NERDTreeCloseDir = 'h'

let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'✹',
            \ 'Staged'    :'✚',
            \ 'Untracked' :'✭',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'═',
            \ 'Deleted'   :'✖',
            \ 'Dirty'     :'✗',
            \ 'Ignored'   :'☒',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }

""==Airline==
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

""==Airline Theme==
let g:airline_theme='simple'

""==TagBar==
nnoremap <leader>t :TagbarToggle<CR>

""==signify==
nnoremap <leader>g :SignifyToggle<CR>
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE

""==vim-tmux-navigator==
let g:tmux_navigator_no_mappings = 1
noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
"noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

""==vim fzf==
if executable('fzf')
    nnoremap <leader>f :Files<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>g :Rg<CR>
else
    "" add all sub folder into list
    set path+=**
end

""==ALE==
set omnifunc=ale#completion#OmniFunc
nmap <silent> [d <Plug>(ale_previous_wrap)
nmap <silent> ]d <Plug>(ale_next_wrap)
nmap <buffer> gd <plug>(ale_go_to_definition)
nmap <buffer> gr <plug>(ale_find_references)
nmap <buffer> gi <plug>(ale_go_to_implementation)
nmap <buffer> gp <plug>(ale_hover)
let g:ale_completion_enabled = 1
let g:ale_cpp_cc_options = "-std=c++17 -Wall"
let g:ale_cpp_clangd_options = "-std=c++17 -Wall"

""==Gutentags==
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" " 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" " 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags
" 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" " 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

""===========================
"" Autocmds
""===========================
execute 'source ' . g:vimrc_dir . '/autocmds.vimrc'


""===========================
"" color schemes
""===========================
try
    colorscheme gruvbox
    set bg=dark
    let g:airline_theme='gruvbox'
catch
    colorscheme ron
endtry

""===========================
"" GUI
""===========================
if has("gui_running")
    set guifont=Consolas:h14
    "set guifontwide=h11
endif
