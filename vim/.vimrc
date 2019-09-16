" File:       $HOME/.vimrc
" Purpose:    Configuration file for VIM
" Author:     Andrew Yao
" Last update:Apr 2011
version 5.4

syntax on
set nocompatible
set backspace=2     " allow backspacing over everything in insert mode should be part of a default RedHat vimrc
set autoindent      " i use vim to code mostly, so autoindent makes sense
set smarttab
set smartindent
set wildmenu
set wildmode=longest,full
set wildignore=*.bak,*.swp,*.o,*.info,*.aux,*.log,*.dvi,*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set backspace=indent,eol,start
set tags=tags
set autowrite           " save before :make, :suspend, etc
set nowrap              " don't wrap lines by default.  makes sense on 80x25.
set viminfo='20,\"50    " write a .viminfo file, don't store more than 50 lines
set expandtab           " expand tabs to spaces.  makes sense if we want people with other editors to see the file looking the same.
set shiftwidth=4        " various options for a tab stop of 4 spaces.
set tabstop=4
set softtabstop=4
set noerrorbells        " stop beeping!
set showcmd             " show partial command in status line
set showmatch           " show matching brackets
set ruler               " show ruler (line & column numbers)
set noignorecase        " don't ignore case while searching
set nostartofline       " don't jump cursor around, stay in current column
set incsearch           " search like emacs, show matches while searching
set laststatus=2        " always show status line, even when editing just one file
set joinspaces
set magic               " yes.  allow magic patterns in searches
set shell=bash
" show short messages.  lessens the changes of ever getting a 'hit-return' " prompt
set shortmess=at        " show short messages
set showmode            " show which mode we're in
set notitle             " display title in X
set ttyfast             " smoother output, we're not on a 1200 dialup :)
" suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc
set formatoptions +=cr
set nu
set bs=2
set ai
set history=50
set hlsearch
set mps+=<:>
set backup                " keep backup file after written
set backupdir=$HOME/tmp   " directory of backup files
" set list
set cindent
set cinoptions+=j1,(0
set cino=(0
set clipboard+=unnamed " share windows clipboard
set cursorcolumn
set cursorline


" Set the colorscheme" 
" so ~/.vim/colors/zenburn.vim
colorscheme zenburn
" set bg=light
set bg=dark
set background=dark     " different syntax highlighting look

augroup filetype
au! BufRead,BufNewFile *.cs    set filetype=java
au! BufRead,BufNewFile *.htc   set filetype=javascript
au! BufRead,BufNewFile *.xhtml set filetype=xml
au! BufRead,BufNewFile *.html  set filetype=xml
au! BufRead,BufNewFile *.log   set filetype=log nowrap
au! BufRead,BufNewFile *.xml   set nowrap
au! BufRead,BufNewFile *.jamon set filetype=html nowrap expandtab sw=4 ts=4 sts=4
au! BufRead,BufNewFile *.java  set cino=(0  expandtab sw=2 ts=2  sts=2
au! BufRead,BufNewFile *.sql   set ic filetype=plsql
au! BufRead,BufNewFile *.sq    set ic filetype=plsql
au! BufRead,BufNewFile *.tsc   set filetype=sh
au! BufRead,BufNewFile *.cls   set filetype=vb
au! BufRead,BufNewFile *.php   set filetype=html
au! BufRead,BufNewFile *.as    set filetype=actionscript
au! BufRead,BufNewFile *.mxml  set filetype=mxml
au! BufRead,BufNewFile *.py    set filetype=python expandtab shiftwidth=2 tabstop=2 softtabstop=2
au! BufRead,BufNewFile *.mako  set filetype=mako expandtab sw=2 ts=2 sts=2
au! BufRead,BufNewFIle *.js    set filetype=javascript noexpandtab shiftwidth=2 tabstop=2 softtabstop=2
au! BufRead,BufNewFile *.css   set filetype=css noexpandtab sw=2 ts=2 sts=2
au! BufWrite *.mako silent! %s/\s\+$//ge
au! BufWrite *.py silent! %s/\s\+$//ge
au! BufWrite *.css silent! %s/\s\+$//ge
augroup END

autocmd FileType html setl noexpandtab shiftwidth=2 ts=2 smarttab
autocmd FileType xml  setl expandtab shiftwidth=2 smarttab
autocmd FileType tex  setl expandtab shiftwidth=4 smarttab
autocmd FileType python  setl expandtab shiftwidth=2 smarttab textwidth=80
autocmd FileType java  setl expandtab shiftwidth=4 smarttab cindent textwidth=80
autocmd FileType java setl tags=~/.jtags,tags
autocmd FileType javascript setl noexpandtab ts=2 smarttab
autocmd FileType c  setl expandtab shiftwidth=4 smarttab cindent
autocmd FileType cpp  setl expandtab shiftwidth=4 smarttab cindent
autocmd BufRead,BufNewFile *.md	setl filetype=mkd
autocmd BufRead,BufNewFile Makefile* setl noexpandtab nosmarttab ts=8 filetype=make
autocmd BufRead,BufNewFile *.mako setl filetype=mako
autocmd BufRead,BufNewFile *.json setl filetype=json
autocmd BufRead,BufNewFile *.txt setl tw=65

"edit my .vimrc file
"update the system settings from my vimrc file
map <C-\> <ESC>0i<CR><ESC>kdd<C-N>
map ,x :set filetype=xml
map ,h :set filetype=html
map ,p :set filetype=plsql
map ,j :set filetype=javascript
map ,t :set filetype=text
map ,u  :source ~/.vimrc
map ,U  :vs ~/.vim/.vimrc
map ,i :set ic
map ,I :set noic
map ,n :set nonu
map ,N :set nu
map ,z :let g:zenburn_high_Contrast=1\|source ~/.vim/colors/zenburn.vim
map ,Z :let g:zenburn_high_Contrast=0\|source ~/.vim/colors/zenburn.vim
map ,gd :new\|:set filetype=diff\|:r !git diff origin/master HEAD
map ,s :silent! %s/\s\+$//g
" Convenient windows key mappings
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map zpdb O__import__("ipdb").set_trace()<ESC>

abbr copyr ## (c) Copyright 2011 Cloudera, Inc. All rights reserved.

" hi Comment ctermfg=DarkGrey guifg=DarkGrey " i hate cyan comments :)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

if has("autocmd")
  filetype plugin indent on
  au FileType text setlocal tw=78

  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

endif " has("autocmd")

"------ all of this stuff allows me to write gzipped files natively...cool eh?
filetype plugin indent on
filetype plugin on

autocmd BufRead *.gz set bin|%!gunzip
autocmd BufRead *.gz set nobin
autocmd BufWritePre *.gz %!gzip
autocmd BufWritePre *.gz set bin
autocmd BufWritePost *.gz undo|set nobin
autocmd FileReadPost *.gz set bin|'[,']!gunzip
autocmd FileType tex set formatoptions=qcrl
autocmd FileReadPost set nobin

autocmd WinEnter * setlocal cursorline  cursorcolumn
autocmd WinLeave * setlocal nocursorline nocursorcolumn
autocmd WinEnter * lcd %:p:h

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")

" When you hit 'K' over a word to get the man page,
" make man search programming sections first, so that function man
" pages are found instead of command man pages from section 1
set keywordprg=man\ -S\ 3:2:7
" Pyflakes
noremap <silent> <F2> :PyflakesUpdate<CR>
noremap <silent> <F3> :ClearPyflakes<CR>
" Toggle TagList
nnoremap <silent> <F8> :TlistToggle<CR>
" Highlight current word
nnoremap <silent> <F9> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> <F10> :setlocal spell spelllang=en_us<CR>
" Maximize windows
noremap <silent> <F12> :set winheight=999<CR>

if has("unix")
  cmap %/ <C-R>=expand("%:p:h") . '/'<CR>
else
  cmap %/ <C-R>=expand("%:p:h") . '\'<CR>
endif


:hi CursorLine   cterm=NONE ctermbg=blue ctermfg=white guibg=blue guifg=white
:hi CursorColumn cterm=NONE ctermbg=blue ctermfg=white guibg=blue guifg=white
":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
