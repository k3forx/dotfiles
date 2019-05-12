filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""Vim Plugin via Vundle""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'               "プラグインの管理マネージャはVundleを使用

Plugin 'scrooloose/nerdtree'                "ディレクトリ構造をNEEDTREEで表示するプラグイン
nnoremap <silent><C-i> :NERDTreeToggle<CR>  "Ctrl + iでツリーを表示

Plugin 'Shougo/unite.vim'                   "vimのインターフェースUniteのプラグイン
let g:unite_enable_start_insert=1           "insert modeでUniteを開く
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
nnoremap <silent> ,uu :<C-u>Unite file_mru <CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file <CR>

Plugin 'Shougo/neomru.vim'                  "最近使用したファイルをUniteから呼び出す
Plugin 'bronson/vim-trailing-whitespace'    "余分なスペースをハイライト・削除する
Plugin 'tpope/vim-commentary'               "gcでコメントアウト
Plugin 'Lokaltog/vim-powerline'             "ステータスラインの表示を色別にする
Plugin 'mbbill/undotree'                    "undo-treeのプラグイン
Plugin 'tpope/vim-surround'                 "カッコやシングルクォートに対するプラグイン
Plugin 'jiangmiao/auto-pairs'               "カッコを自動的に挿入&削除

" Plugin 'reireias/vim-cheatsheet'                  "vimのメモを表示するプラグイン
" let g:cheatsheet#cheat_file = '~/.cheatsheet.md'  ":Cheatで表示

Plugin 'simeji/winresizer'                  "分割したウィンドウをリサイズ
let g:winresizer_start_key = '<C-T>'        "Ctrl + tでresize開始
let g:winresizer_vert_resize = 1            "垂直方向を1ずつ動かす"
let g:winresizer_horiz_resize = 1           "水平方向を1ずつ動かす"

Plugin 'lighttiger2505/gtags.vim'           "vimでgnu globalを使う
Plugin 'jsfaint/gen_tags.vim'               "ctagsやgtagsの生成を自動で行う
let g:gen_tags#gtags_auto_gen = 1

Plugin 'vim-syntastic/syntastic'            "pythonのコーディングチェック
let g:syntastic_python_checkers = ["flake8"]
Plugin 'davidhalter/jedi-vim'               "pyhonの関数補完検索
Plugin 'ervandew/supertab'                  "devidhalter/jedi-vimををtapで補完

Plugin 'tpope/vim-markdown'
Plugin 'kannokanno/previm'
Plugin 'tyru/open-browser.vim'
nnoremap <silent> <C-p> :PrevimOpen<CR>     "Ctrl + p でmarkdownのPreviewをブラウザで表示

Plugin 'tpope/vim-fugitive' "git用のプラグイン

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

"""""""""""""""""""""""""""""""""

"[Backspace] で既存の文字を削除できるように設定
"start - 既存の文字を削除できるように設定
"eol - 行頭で[Backspace]を使用した場合上の行と連結
"indent - オートインデントモードでインデントを削除できるように設定
set backspace=indent,start,eol

"""""""""""""""""""""""""""""""buffer setting""""""""""""""""""""""""""""""
set hidden "保存せずにバッファを切り替えるようにする"

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
"set whichwrap=b,s,h,l,<,>,[,]    "カーソルが行頭、行末で止まらないようにする
set nohlsearch                    "検索キーワードをハイライトする
set incsearch                     "検索ワードを全て打つ前からヒットするものをハイライト
set number	                      "行番号を表示

""""""""""""""""""representation of status line""""""""""""""""""""""
set laststatus=2                  "ステータスラインを常に表示
set statusline=%F%r%h%=           "ステータスラインの内容

" 補完時の一覧表示機能有効化
set wildmenu wildmode=list:full
set virtualedit=block
set showcmd                       "ノーマルモードでコマンドの一部を表示"

""""""""""""""""""""""Tab Setting"""""""""""""""""""""""
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
set virtualedit=onemore

""""""""""""""""""""" Clipboard setting """"""""""""""""""
set clipboard=unnamed,autoselect


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




