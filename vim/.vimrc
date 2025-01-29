let mapleader=","

" encoding
set encoding=utf-8

" themes
"set bg="light"
set bg="dark"

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" highlights searchs
set hlsearch

" does searches incrementally
set incsearch

" sets default clipboard to the system clipboard
set clipboard=unnamedplus

" sets our tab size to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" converts our tabs to spaces
set expandtab

" auto indent after using enter
set autoindent

" sets file format to unix
set fileformat=unix

" set compatibility to vim only
set nocompatible

" automatically wrap text that extends beyond thescreen length
set wrap

" syntax highlighting
syntax on

" show line numbers
set number
" changes the number lines to numbers relative to the current active line
set relativenumber

" show status bar
set laststatus=2

" enable autocompletion ctrl+n to activate
set wildmode=longest,list,full

" disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" REMAPS for split windows
" shortcutting split navigation, saving a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Some custom maps
map <C-F> :Ex<CR>

" Replace all is aliased to S.
"noremap <silent> S :%s//g<Left><Left>
" Newtab
noremap <silent> <C-i> :tabnew<CR>
" paste from system clipboard with ctrl+i instead of shift insert
map <S-Insert> <C-i>

" ensure file are read as what i want
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown', '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*.~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
" automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed)
"vnoremap <C-c> "+y
"map <C-p> "+P

" automatically deletes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

""" when shortcut files are updated, renew bash and vim configs with new material
"autocmd BufWritePost ~/config/bmdirs,~/.config/bmdiles !shortcuts
""" update binds when sxhkdrc is updated
"autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
""" run xrdb whenever Xdefaults or Xresources are updated
"autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Call the .vimrc.plug file
"if filereadable(expand("~/.vimrc.plug"))
"    source ~/.vimrc.plug
"endif
