" .vimrc

"dein.vim"{{{
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.cache/dein')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml('~/dev/config/vim/dein.toml')
  call dein#load_toml('~/dev/config/vim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif


if dein#check_install()
  call dein#install()
endif

function! s:deinClean()
  if len(dein#check_clean())
    call map(dein#check_clean(), 'delete(v:val, "rf")')
  else
    echo '[ERR] no disabled plugins'
  endif
endfunction
command! DeinClean :call s:deinClean()
"}}}

"General"{{{
filetype plugin on
filetype indent on

" initialize augroup
augroup vimrc
  autocmd!
augroup end

set encoding=utf-8
syntax on
set autoindent
set smartindent

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" UI"{{{
set t_Co=256
colorscheme onedark
set background=dark

set list
set listchars=tab:¦-,trail:˽

let g:indentLine_char = '¦' "|¦┆│
"let g:indentLine_first_char = '|'
let g:indentLine_leadingSpaceChar = '·' "also can use: ˽˰··
"let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_setConceal = 0


set laststatus=2
set cmdheight=2
set showcmd
set title
set noshowmode
set number
set ruler
set wrap
set wrapscan
set breakindent
set showmatch
set wildmenu
set formatoptions-=ro
set mouse=
set hidden
set colorcolumn=80
set textwidth=80
set previewheight=5
set signcolumn=yes
"}}}

autocmd vimrc BufWritePre * :%s/\s\+$//ge

" tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=2

" search
set hlsearch
set ignorecase
set smartcase
set incsearch

set foldmethod=marker

let g:incsearch#magic = '\v'

set pyxversion=3

"}}}

" Key Mappings"{{{
nnoremap [ctrlp] <Nop>
nmap <Space>c [ctrlp]
nnoremap <silent> [ctrlp]f :<C-u>CtrlP<CR>
nnoremap <silent> [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
nnoremap <silent> [ctrlp]t :<C-u>CtrlPTag<CR>
nnoremap <silent> [ctrlp]x :<C-u>CtrlPMixed<CR>
nnoremap <silent> [ctrlp]y :<C-u>CtrlPYankRound<CR>
nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>

nnoremap [tags] <Nop>
nmap <Space>t [tags]
nnoremap <silent> [tags]j <C-]>
nnoremap <silent> [tags]b <C-t>

nnoremap [loc] <Nop>
nmap <Space>l [loc]
nnoremap <silent> [loc]n :<C-u>lnext<CR>
nnoremap <silent> [loc]p :<C-u>lprev<CR>

nnoremap [git] <Nop>
nmap <Space>g [git]
nnoremap [git]a :Gwrite<CR>
nnoremap [git]c :Gcommit<CR>
nnoremap [git]s :Gstatus<CR>
nnoremap [git]d :Gdiff<CR>
nnoremap [git]l :Glog<CR>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap Q <Nop>
inoremap <C-c> <Esc>

noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>


nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <silent> <Space>nh :<C-u>noh<CR>

nnoremap <silent> <Space>jd :<C-u>JsDoc<CR>

"}}}

" Languages"{{{
" python"{{{
autocmd vimrc FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
"
"}}}

" javascript"{{{
autocmd vimrc FileType javascript setl foldmethod=syntax
let g:vim_json_syntax_conceal = 0
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_tags = {}
let g:jsdoc_tags['returns'] = 'return'
let g:vim_jsx_pretty_colorful_config = 1 " default 0
"}}}
"
"}}}

" Plugins"{{{
" Quickrun "{{{
let g:quickrun_config = {
      \ '_' : {
      \   'runner' : 'vimproc',
      \   'runner/vimproc/updatetime' : 60,
      \   'outputter' : 'error',
      \   'outputter/error/success' : 'buffer',
      \   'outputter/error/error' : 'quickfix',
      \   'outputter/buffer/split' : ':rightbelow 8sp',
      \   'outputter/buffer/close_on_empty' : 1,
      \   'outputter/buffer/append' : 1,
      \ },
      \}
au FileType qf nnoremap <silent><buffer>q :quit<CR>
"}}}


"}}}
