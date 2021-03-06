filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""Vim Plugin via Vundle""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
nnoremap <silent><C-i> :NERDTreeToggle<CR>
map <C-i> <plug>NERDTreeTabsToggle<CR>

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'Shougo/denite.nvim'
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'

Plugin 'Shougo/unite.vim'                   "vimのインターフェースUniteのプラグイン
let g:unite_enable_start_insert=1           "insert modeでUniteを開く
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
nnoremap <silent> ,uu :<C-u>Unite file_mru <CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file <CR>

Plugin 'Shougo/neomru.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-commentary'
Plugin 'itchyny/lightline.vim'
" let g:lightline = {
"       \ 'colorscheme': 'one dark',
"       \ 'tabline': {
"       \   'left': [['cmd'], ['tabs']],
"       \   'right': [['close'], ['gitbranch', 'wifi', 'battery']],
"       \ },
"       \ 'component_function': {
"       \   'cwd': 'getcwd',
"       \   'gitbranch': 'gitbranch#name',
"       \   'wifi': 'wifi#component',
"       \   'battery': 'battery#component',
"       \ },
"       \}
set laststatus=2
set showtabline=2

Plugin 'tpope/vim-surround'                 "カッコやシングルクォートに対するプラグイン
Plugin 'jiangmiao/auto-pairs'               "カッコを自動的に挿入&削除

Plugin 'simeji/winresizer'                  "分割したウィンドウをリサイズ
let g:winresizer_start_key = '<C-T>'        "Ctrl + tでresize開始
let g:winresizer_vert_resize = 1            "垂直方向を1ずつ動かす"
let g:winresizer_horiz_resize = 1           "水平方向を1ずつ動かす"

Plugin 'vim-syntastic/syntastic'            "pythonのコーディングチェック
let g:syntastic_python_checkers = ["flake8", "black"]
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let g:syntastic_python_flake8_post_args='--ignore=D401'
Plugin 'davidhalter/jedi-vim'               "pyhonの関数補完検索
let g:jedi#auto_initialization = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
Plugin 'ervandew/supertab'                  "devidhalter/jedi-vimををtapで補完
let g:SuperTabContextDefaultCompletionType = "context"

Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
let g:go_null_module_warning = 0
let g:go_fmt_command = "gofmt"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" Plugin 'fatih/vim-go'
" let g:go_fmt_command = 'goimports'

Plugin 'SirVer/ultisnips' "スニペット

Plugin 'vim-scripts/vim-auto-save'
let g:auto_save = 1
" let g:auto_save_in_insert_mode = 0

Plugin 'hashivim/vim-terraform'
let g:terraform_align = 1
let g:terraform_fold_sections = 1
" let g:terraform_fmt_on_save = 1

Plugin 'lambdalisue/wifi.vim'
let g:wifi#update_statusline = 1

Plugin 'lambdalisue/battery.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'kamykn/spelunker.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'tarekbecker/vim-yaml-formatter'
Plugin 'yasuhiroki/github-actions-yaml.vim'

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make,grepなどをした後にQuickfix を自動的に開く "
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,SyntasticCheck,Errors if len(getqflist()) != 0 | copen | endif

""""""""""insert modeでカーソル移動""""""""""
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

""""" map ESC to jj """""
inoremap <silent> jj <ESC>

"[Backspace] で既存の文字を削除できるように設定
"start - 既存の文字を削除できるように設定
"eol - 行頭で[Backspace]を使用した場合上の行と連結
"indent - オートインデントモードでインデントを削除できるように設定
set backspace=indent,start,eol

"""""""""""""""""""""""""""""""buffer setting""""""""""""""""""""""""""""""
set hidden "保存せずにバッファを切り替えるようにする"
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

""""""""""""""""""""""""""""Mouse Setting""""""""""""""""""""""""""""""""""
set mouse=a "マウスを使えるようにする"

""""""""""""""""""""""""""""Syntax Setting"""""""""""""""""""""""""""""""""
syntax on
highlight Normal ctermbg=black ctermfg=white
highlight Comment ctermbg=black ctermfg=grey
highlight Keyword ctermbg=black ctermfg=yellow
highlight Identifier ctermfg=magenta
highlight Constant ctermbg=black ctermfg=cyan
highlight Special ctermbg=black ctermfg=white
highlight Number ctermfg=darkgreen
highlight String ctermbg=black ctermfg=white
highlight Operator ctermbg=black ctermfg=white
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
highlight LineNr cterm=none ctermbg=black ctermfg=grey
let g:hybrid_use_iTerm_colors = 1

"""""""""""自動でカッコを挿入
set showmatch " 括弧の対応関係を一瞬表示する

set noswapfile                    "スワップファイルは使わない
set nohlsearch                    "検索キーワードをハイライトする
set incsearch                     "検索ワードを全て打つ前からヒットするものをハイライト
set number	                      "行番号を表示

" 補完時の一覧表示機能有効化
set wildmenu wildmode=list:full
set virtualedit=block

""""""""""""""""""""""Tab Setting"""""""""""""""""""""""
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
set virtualedit=onemore

nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>








""""""""""""""""""""" Clipboard setting """"""""""""""""""
set clipboard=unnamed,autoselect

""""""""""""""""""""" folding setting """"""""""""""""""
set foldmethod=manual


hi MatchParen ctermfg=LightGreen ctermbg=blue
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
