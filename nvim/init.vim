set number
set ruler

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

call plug#begin()
    Plug 'ron89/thesaurus_query.vim'
    Plug 'mzlogin/vim-markdown-toc'
    Plug 'preservim/nerdtree'
call plug#end()

"Spelling
autocmd FileType markdown setlocal spell
set spelllang=en
hi SpellBad ctermfg=white ctermbg=red

"Mappings
:inoremap <C-z> <ESC>ui
:inoremap <C-r> <ESC><C-r>i


"NERDtree
map <C-b> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set autochdir
let NERDTreeShowHidden=1
