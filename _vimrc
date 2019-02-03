set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""Vim Plugin via Vundle""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim' "プラグインの管理"
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'
let g:unite_enable_start_insert=1 "insert modeでUniteを開く"
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
nnoremap <silent> ,uu :<C-u>Unite file_mru <CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file <CR>

Plugin 'Shougo/neomru.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tomtom/tcomment_vim'

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  "挿入モード時に非点滅の縦棒タイプのカーソル"
  let &t_SI .= "\e[6 q"
endif

"" Setting of vim-indent-guides "
"let g:indent_guides_enable_on_vim_startup = 1
"set shiftwidth=2

" 挿入モード時、ステータスラインの色を変更
"let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
"
"if has('syntax')
"  augroup InsertHook
"    autocmd!
"    autocmd InsertEnter * call s:StatusLine('Enter')
"    autocmd InsertLeave * call s:StatusLine('Leave')
"  augroup END
"endif
"
"let s:slhlcmd = ''
"function! s:StatusLine(mode)
"  if a:mode == 'Enter'
"    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
"    silent exec g:hi_insert
"  else
"    highlight clear StatusLine
"    silent exec s:slhlcmd
"  endif
"endfunction
"
"function! s:GetHighlight(hi)
"  redir => hl
"  exec 'highlight '.a:hi
"  redir END
"  let hl = substitute(hl, '[\r\n]', '', 'g')
"  let hl = substitute(hl, 'xxx', '', '')
"  return hl
"endfunction
"""""""""""""""""""""""""""""""""

"[Backspace] で既存の文字を削除できるように設定
"start - 既存の文字を削除できるように設定
"eol - 行頭で[Backspace]を使用した場合上の行と連結
"indent - オートインデントモードでインデントを削除できるように設定
set backspace=indent,start,eol

"""""""""""""""""""""""""""""""buffer setting""""""""""""""""""""""""""""""
set hidden "保存せずにバッファを切り替えるようにする"

""""""""""""""""""""""""""""Mouse Settign""""""""""""""""""""""""""""""""""
set mouse=a "マウスを使えるようにする"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:hybrid_use_iTerm_colors = 1
"colorscheme hybrid"
syntax on

"自動でカッコを挿入
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap < <><LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

set noswapfile "スワップファイルは使わない
"set whichwrap=b,s,h,l,<,>,[,] "カーソルが行頭、行末で止まらないようにする"
set nohlsearch " 検索キーワードをハイライトしないように設定
set number	" 行番号を表示

""""""""""""""""""representation of status line""""""""""""""""""""""
set laststatus=2 " ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容
" インクリメンタル検索を有効化
set incsearch
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Clipboard setting """"""""""""""""""
set clipboard=unnamed,autoselect
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showmatch " 括弧の対応関係を一瞬表示する
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




