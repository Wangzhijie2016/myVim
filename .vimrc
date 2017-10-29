set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/root/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'AutoClose'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlp.vim'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'easymotion/vim-easymotion'
Plugin 'The-NERD-Commenter'
Plugin 'https://github.com/Yggdroot/indentLine.git'
Plugin 'iCyMind/NeoSolarized'
Plugin 'tpope/vim-fugitive'
Plugin 'python-mode/python-mode'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required
filetype plugin indent on    " required

"========== General settings =========="
let python_highlight_all=1
syntax enable
set t_Co=256
set encoding=utf-8
set nu
set showcmd
set showmatch
set incsearch
set ignorecase
set smartcase
set cursorline
set isk+=-

set shiftwidth=4
set sts=4
set tabstop=4
set dictionary+=/usr/share/dict/words
""set background=light
set background=dark
colorscheme gruvbox

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

let mapleader=";"
inoremap jk <ESC>
vnoremap <Leader>y "+y    " 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>p "+p    " 设置快捷键将系统剪贴板内容粘贴至 vim
nnoremap <Leader>w :res 100<CR>
nnoremap <Leader>c :res 30<CR>
nnoremap <Leader>d :res 10<CR>
nnoremap nw <C-W><C-W>    " 依次遍历子窗口"
nnoremap <Leader>lw <C-W>l    "" 跳转至右方的窗口
nnoremap <Leader>hw <C-W>h    "跳转至左方的窗口"
nnoremap <Leader>kw <C-W>k    " 跳转至上方的子窗口
nnoremap <Leader>jw <C-W>j    " 跳转至下方的子窗口

"========== Nerdtree-tabs settings =========="
let NERDTreeWinPos = 'left'
let NERDTreeWinSize = 30
nmap <F7> <ESC>:NERDTreeToggle<RETURN>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"========== Tagbar settings =========="
" "nmap <F8> :TagbarOpen<CR>
nmap <F6> <ESC>:TagbarToggle<RETURN>
autocmd BufReadPost *.py,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
let g:tagbar_width = 30
"let g:tagbar_ctags_bin = 'ctags'

"========== Python-mode settings =========="
let g:pymode_run = 0
let g:pymode_python = 'python3'
let g:pymode_warnings = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_folding = 0
"开启python-mode定义的移动方式
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_cwindow = 0
let g:pymode_rope = 1
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Tab>'
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"========== Vim-markdown settings =========="
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1

"========== ALE settings =========="
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_args = '-m flake8'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▶'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['flake8']}

"========== AsyncRun settings =========="
func! AsyncRun()
	exec "w"
	if &filetype == 'python'
		exec "AsyncRun python3.6 %"
	elseif &filetype == 'sh'
		exec "AsyncRun /bin/bash %"
	endif
	exec "copen"
endfunc

func! AsyncStop()
	exec "AsyncStop[!]"
endfunc

func! AsyncRunInput()
	    exec "copen" 
		:AsyncRun<Space>
endfunc

noremap <Leader>r :call asyncrun#quickfix_toggle(8,1)<CR> :AsyncRun<Space>
" noremap <Leader><Leader>r :call AsyncRunInput()<CR>
map <F4> :call AsyncStop()<CR>
map <F5> :call AsyncRun()<CR>
