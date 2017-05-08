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
    highlight Pmenu ctermbg=4
    highlight PmenuSel ctermbg=1
    highlight PMenuSbar ctermbg=4

    " 補完ウィンドウの設定
    set completeopt=menuone

    " 補完ウィンドウの設定
    set completeopt=menuone

    " rsenseでの自動補完機能を有効化
    let g:rsenseUseOmniFunc = 1
    " let g:rsenseHome = '/usr/local/lib/rsense-0.3'

    " auto-ctagsを使ってファイル保存時にtagsファイルを更新
    let g:auto_ctags = 1

    " 起動時に有効化
    let g:neocomplcache_enable_at_startup = 1

    " 大文字が入力されるまで大文字小文字の区別を無視する
    let g:neocomplcache_enable_smart_case = 1

    " _(アンダースコア)区切りの補完を有効化
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_camel_case_completion  =  1

    " 最初の補完候補を選択状態にする
    " let g:neocomplcache_enable_auto_select = 1

    " ポップアップメニューで表示される候補の数
    let g:neocomplcache_max_list = 20

    " シンタックスをキャッシュするときの最小文字長
    let g:neocomplcache_min_syntax_length = 3

    " 補完の設定
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
        let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'




    " " AutoComplPopを無効にする
    " let g:acp_enableAtStartup = 0
    " " neocomplcacheを有効にする
    " let g:neocomplcache_enable_at_startup = 1
    " " 入力値に大文字が含まれている場合は、大文字・小文字を無視しない
    " let g:neocomplcache_enable_smart_case = 1
    " " Set minimum syntax keyword length.
    " let g:neocomplcache_min_syntax_length = 3
    " let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    "
    " " Define dictionary.
    " let g:neocomplcache_dictionary_filetype_lists = {
    "     \ 'default' : ''
    "     \ }
    "
    " " Plugin key-mappings.
    " inoremap <expr><C-g>     neocomplcache#undo_completion()
    " inoremap <expr><C-l>     neocomplcache#complete_common_string()
    "
    " " Recommended key-mappings.
    " " <CR>: close popup and save indent.
    " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    " function! s:my_cr_function()
    "     return neocomplcache#smart_close_popup() . "\<CR>"
    " endfunction
    " " <TAB>: completion.
    " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " " <C-h>, <BS>: close popup and delete backword char.
    " inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    " inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    " inoremap <expr><C-y>  neocomplcache#close_popup()
    " inoremap <expr><C-e>  neocomplcache#cancel_popup()

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

    " VimShell
    NeoBundle 'Shougo/vimshell.vim' 
    "ウインドウを分割してシェルを起動
    nnoremap <silent> vs :VimShell<CR>
    nmap <silent> vp :<C-u>VimShellPop<CR> 
    "現在のディレクトリを表示
    let g:vimshell_prompt_expr = 'getcwd()." > "'
    let g:vimshell_prompt_pattern = '^\f\+ > '


    " lightlineの設定
    NeoBundle 'itchyny/lightline.vim' 
    let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

    function! LightlineModified()
        return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LightlineReadonly()
        return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
    endfunction

    function! LightlineFilename()
        return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
            \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
            \  &ft == 'unite' ? unite#get_status_string() :
            \  &ft == 'vimshell' ? vimshell#get_status_string() :
            \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
            \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
    endfunction

    function! LightlineFugitive()
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        else
            return ''
        endif
    endfunction

    function! LightlineFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! LightlineFiletype()
        return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
    endfunction

    function! LightlineFileencoding()
        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
    endfunction

    function! LightlineMode()
        return winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    NeoBundle     'Shougo/neocomplete'

    if neobundle#tap('neocomplete')
        call neobundle#config({
        \   'depends': ['Shougo/context_filetype.vim', 'ujihisa/neco-look', 'pocke/neco-gh-issues', 'Shougo/neco-syntax'],
        \ })

        " 起動時に有効化
        let g:neocomplete#enable_at_startup = 1
        " 大文字が入力されるまで大文字小文字の区別を無視する
        let g:neocomplete#enable_smart_case = 1
        " _(アンダースコア)区切りの補完を有効化
        let g:neocomplete#enable_underbar_completion = 1
        let g:neocomplete#enable_camel_case_completion  =  1
        " ポップアップメニューで表示される候補の数
        let g:neocomplete#max_list = 20
        " シンタックスをキャッシュするときの最小文字長
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        " 補完を表示する最小文字数
        let g:neocomplete#auto_completion_start_length = 2
        " preview window を閉じない
        let g:neocomplete#enable_auto_close_preview = 0
        " AutoCmd InsertLeave * silent! pclose!

        let g:neocomplete#max_keyword_width = 10000


        if !exists('g:neocomplete#delimiter_patterns')
            let g:neocomplete#delimiter_patterns= {}
        endif
            let g:neocomplete#delimiter_patterns.ruby = ['::']

        if !exists('g:neocomplete#same_filetypes')
            let g:neocomplete#same_filetypes = {}
        endif
            let g:neocomplete#same_filetypes.ruby = 'eruby'


        if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
        endif

        let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
        let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' " Same as JavaScript
        let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'         " Same as JavaScript

        let s:neco_dicts_dir = $HOME . '/dicts'
        if isdirectory(s:neco_dicts_dir)
            let g:neocomplete#sources#dictionary#dictionaries = {
            \   'ruby': s:neco_dicts_dir . '/ruby.dict',
            \   'javascript': s:neco_dicts_dir . '/jquery.dict',
            \ }
        endif
        let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'

        " call neocomplete#custom#source('look', 'min_pattern_length', 1)

        call neobundle#untap()
endif

call neobundle#end()
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on


