syntax on
colorscheme wallaby
set t_Co=256

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
"soqset cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示

set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4



set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
let g:python_highlight_all = 1


" タブ
set showtabline=2
noremap <C-N> gt


set modifiable
set write



" Latex
let g:Tex_AutoFolding=0



if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif



" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

    " インストールするプラグインをここに記述
    NeoBundle 'Shougo/unite.vim'
    " 挿入モードで開始する
    let g:unite_enable_start_insert=1
    noremap <C-F> :Unite -buffer-name=file file<CR> " ファイル一覧 "


    NeoBundle 'Shougo/vimfiler'
    noremap <silent> :e :VimFiler -split -simple -winwidth=25 -no-quit<Enter>
    let g:vimfiler_edit_action = 'tabopen'
    noremap <buffer><silent> <Plug>(vimfiler_exit)
        \ q call <SID>exit(b:vimfiler)<CR>


    NeoBundle 'Townk/vim-autoclose'
    NeoBundle 'junegunn/vim-easy-align'

    NeoBundle 'jpo/vim-railscasts-theme'
    NeoBundle 'ujihisa/unite-colorscheme'
    NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
    \ }}

    " call neobundle#end()
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'

    " NERDTreeの設定
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'jistr/vim-nerdtree-tabs'
    " 隠しファイルを表示する
    " let NERDTreeShowHidden = 1
    " 起動時にNERDTreeを表示
    autocmd vimenter * NERDTree
    " デフォルトでツリーを表示させる
    let g:nerdtree_tabs_open_on_console_startup=1
    " NERDTress File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction
    call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
    call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
    call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
    call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
    
    " ディレクトリ表示記号を変更する
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeDirArrowExpandable  = '▶'
    let g:NERDTreeDirArrowCollapsible = '▼'
    
    " Ctrl + eでNERDTree表示
    nnoremap <silent><C-e> :NERDTreeToggle<CR>
    
    " 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " コメントアウト
    NeoBundle 'tomtom/tcomment_vim'

    " Gitの設定
    NeoBundle 'tpope/vim-fugitive'

call neobundle#end()
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on


