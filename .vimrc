" *****************
" My vimrc config
" ---------------
"
"
" Vim Plugins
"
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'nightsense/stellarized'
Plug 'vim-scripts/TagHighlight'
Plug 'Valloric/YouCompleteMe'
call plug#end()

" Basic rules
"
filetype plugin on
syntax enable
set encoding=utf-8
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
autocmd bufnewfile *.h,*.c so /home/$USER/.vim/epitech-headers/c_header.txt
autocmd bufnewfile main.c so /home/$USER/.vim/epitech-headers/main_header.txt
autocmd bufnewfile Makefile so /home/$USER/.vim/epitech-headers/make_header.txt

" highlight current line
highlight CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

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
set background=dark
colorscheme dracula

" Text mapping
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Python mapping
" inoremap def def ():<left><left><left>

"
"
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
"
" Mapping CTRL + C to cancel
nmap <c-c> :q<CR>
imap <c-s> <Esc>:q<CR>
