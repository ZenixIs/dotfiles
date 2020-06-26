"" *****************
" My vimrc config
" ---------------
"
"
" Vim Plugins
"

call plug#begin('~/.vim/plugged') 

    Plug 'dracula/vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'ayu-theme/ayu-vim'
    Plug '907th/vim-auto-save'
    Plug 'nightsense/stellarized'
    Plug 'vim-scripts/TagHighlight'
    Plug 'Valloric/YouCompleteMe'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'terryma/vim-multiple-cursors'
    Plug 'Yggdroot/indentLine'
    "Plug 'ryanoasis/vim-devicons'
    "Plug 'taigcute/spaceline.vim'

call plug#end()

" Basic rules
"
filetype plugin on
syntax enable
set encoding=UTF-8
set number
set smartindent
set autoindent
set ruler
set mouse=a
set smarttab
set backspace=indent,eol,start

" Autocompletion compilation config file
"
let g:ycm_global_ycm_extra_conf = "/home/$USER/.vim/.ycm_extra_conf.py"

" Auto save
"let g:auto_save = 1
"source /home/$USER/.vim/.CocConfig

let g:spaceline_seperate_style= 'arrow'
" Ignore .swp files
"
set noswapfile

" Text rules
"
set shiftwidth=4
set tabstop=4
set textwidth=80
set expandtab

" Auto Epitech headers
"
autocmd bufnewfile *.h,*.c,*.cpp,*.hpp so /home/$USER/.vim/epitech-headers/c_header.txt
autocmd bufnewfile main.c,main.cpp so /home/$USER/.vim/epitech-headers/main_header.txt
autocmd bufnewfile Makefile so /home/$USER/.vim/epitech-headers/make_header.txt

" highlight current line
highlight CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" Highlight extrawhitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Status line configuration
" -------------------------
"
" Loading git branch function
source /home/$USER/.vim/statusbar/git/git_get_branch.vim
let branch = GetGitBranch()

set laststatus=2
" Prompt
set statusline=
set statusline+=%1*
set statusline+=❱\ %t
set statusline+=
if branch != ''
    if branch != 'master'
        set statusline +=\ on%3*\ %{branch}\%1*\ ⎇
    else
        set statusline +=\ on\%2*\ %{branch}\%1*\ ⎇
    endif
endif
set statusline +=%=
set statusline +=%y
set statusline +=\ %p%%
set statusline +=\  
set statusline +=(%{strftime('%R')})\%*


" Setting colors
"
""set background=dark
set termguicolors
set background=dark
"let ayucolor="dark"
colorscheme ayu

" Text mapping
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap " ""<left>
" Python mapping
" inoremap def def ():<left><left><left>

"
"
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
"
" Mapping CTRL + C to cancel
"nmap <c-c> :q<CR>
"imap <c-s> <Esc>:q<CR>
