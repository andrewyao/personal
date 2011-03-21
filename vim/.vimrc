" File:       $HOME/.vimrc
" Purpose:    Configuration file for VIM
" Author:     Andrew Yao
" Last update:Feb 2011
"
version 5.4


set nocompatible
" allow backspacing over everything in insert mode
" should be part of a default RedHat vimrc
set backspace=2

" i use vim to code mostly, so autoindent makes sense
set autoindent
set smarttab
set smartindent
set wildmenu
set wildmode=longest,full
set backspace=indent,eol,start
set tags=tags

" When you hit 'K' over a word to get the man page,
" make man search programming sections first, so that function man
" pages are found instead of command man pages from section 1
set keywordprg=man\ -S\ 3:2:7

" Convenient windows key mappings
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" definitely.  can't code without it
syntax on

map zpdb O__import__("ipdb").set_trace()<ESC>

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


" save before :make, :suspend, etc
set autowrite

" don't wrap lines by default.  makes sense on 80x25.
set nowrap

" write a .viminfo file, don't store more than 50 lines
set viminfo='20,\"50

" expand tabs to spaces.  makes sense if we want people with other editors
" to see the file looking the same.
set expandtab

" various options for a tab stop of 4 spaces.
set shiftwidth=4
set tabstop=4
set softtabstop=4

" different syntax highlighting look
set background=dark

" stop beeping!
set noerrorbells

" show partial command in status line
set showcmd

" show matching brackets
set showmatch

" show ruler (line & column numbers)
set ruler

" don't ignore case while searching
set noignorecase

" don't jump cursor around, stay in current column
set nostartofline

" search like emacs, show matches while searching
set incsearch

" always show status line, even when editing just one file
set laststatus=2 

set joinspaces

" yes.  allow magic patterns in searches
set magic

" we use bash
set shell=bash

" show short messages.  lessens the changes of ever getting a 'hit-return'
" prompt
set shortmess=at    " show short messages

set joinspaces

" yes.  allow magic patterns in searches
set magic

" we use bash
set shell=bash

" show which mode we're in
set showmode

" display title in X
set notitle

" smoother output, we're not on a 1200 dialup :)
set ttyfast 

" i hate cyan comments :)
hi Comment ctermfg=DarkGrey guifg=DarkGrey

" suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc

set formatoptions +=cr

set nu
set bg=light
" set bg=dark
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

" so ~/.vim/colors/zenburn.vim
colorscheme zenburn

augroup filetype
au!
au! BufRead,BufNewFile *.pls   set filetype=perl
au! BufRead,BufNewFile *.asp   set filetype=html
au! BufRead,BufNewFile *.aspx  set filetype=html
au! BufRead,BufNewFile *.cs    set filetype=java
au! BufRead,BufNewFile *.htc   set filetype=javascript
au! BufRead,BufNewFile *.xhtml set filetype=xml
au! BufRead,BufNewFile *.html  set filetype=xml
au! BufRead,BufNewFile *.log   set filetype=log nowrap
au! BufRead,BufNewFile *.xml   set nowrap
au! BufRead,BufNewFile *.uix   set filetype=xml nowrap
au! BufRead,BufNewFile *.jsp   set filetype=xml nowrap
au! BufRead,BufNewFile *.jspf  set filetype=xml nowrap
au! BufRead,BufNewFile *.jamon set filetype=html nowrap
au! BufRead,BufNewFile *.java  set cino=(0 
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


" Set the colorscheme
if has("autocmd")
  filetype plugin indent on
  au FileType text setlocal tw=78

  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

endif " has("autocmd")

"----- always have a status line
set laststatus=2

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
abbr copyr ## (c) Copyright 2011 Cloudera, Inc. All rights reserved.
"------ all of this stuff allows me to write gzipped files natively...cool eh?
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

set clipboard+=unnamed " share windows clipboard
set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildmode=full

set cursorcolumn
set cursorline

":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if 1 "ignore these functions if not compiled with +eval
    function! CheckStyle()
	!clear; styler %
	edit %
    endfunction

    function! FixStyle()
	silent !clear; cd %:h; fstyle.space %:t
	edit %
	redraw!
    endfunction

    function! SccsEdit()
	if expand('%:h') == ""
	    exec "silent !sccs edit " . expand('%:t')
	else
	    exec "silent !cd " . expand('%:h') . " && sccs edit " .
			\expand('%:t')
	endif
	edit %
	redraw!
    endfunction

    function! SccsUnedit()
	if expand('%:h') == ""
	    exec "silent !sccs unedit " . expand('%:t')
	else
	    exec "silent !cd " . expand('%:h') . " && sccs unedit " .
			\expand('%:t')
	endif
	edit %
	redraw!
    endfunction

    function! SccsPrs()
	let l:file = expand('%')
	new
	exec "%!sccs prs '" . l:file . "'"
	set nomodified
    endfunction

    function! SccsPrint()
	let l:file = expand('%')
	new
	exec "%!sccs print '" . l:file . "'"
	set nomodified
    endfunction

    function! SccsCreate(...)
	if a:0 != 0
	    let l:comment = " -y'" . a:1 . "'"
	else
	    let l:comment = input("SCCS comment: ")
	endif

	if l:comment == ""
	    echo "Empty comment string.  Sccs create aborted."
	    return
	endif

	if expand('%:h') == ""
	    exec "silent !sccs create -y\"" . l:comment . "\" " . expand('%:t')
	else
	    exec "silent !cd " . expand('%:h') . " && sccs create -y\"" .
			\l:comment . "\" " .  expand('%:t')
	endif
	redraw!
    endfunction

    function! SccsDelget(...)
	let l:comment = ""
	if a:0 != 0
	    let l:comment = " -y'" . a:1 . "'"
	endif

	if expand('%:h') == ""
	    exec "silent !sccs delget" . l:comment  . " " . expand('%:t')
	else
	    exec "silent !cd " . expand('%:h') . " && sccs delget" . l:comment .
			\" " .  expand('%:t')
	endif
	redraw!
    endfunction

    function! Gitdiffs()
	silent !clear; git difftool -t gvimdiff % &
	redraw!
    endfunction

    function! Gitadd()
	silent !clear; git add %
	redraw!
    endfunction

    function! Gitlog()
	!clear; git log %
	redraw!
    endfunction

    filetype plugin indent on
    autocmd FileType html setl noexpandtab shiftwidth=2 ts=2 smarttab
    autocmd FileType xml  setl expandtab shiftwidth=2 smarttab
    autocmd FileType tex  setl expandtab shiftwidth=4 smarttab
    autocmd FileType python  setl expandtab shiftwidth=2 smarttab textwidth=80
    autocmd FileType java  setl expandtab shiftwidth=2 smarttab cindent textwidth=80
    autocmd FileType java setl tags=~/.jtags,tags
    autocmd FileType javascript setl noexpandtab ts=2 smarttab
    autocmd FileType c  setl expandtab shiftwidth=4 smarttab cindent
    autocmd FileType cpp  setl expandtab shiftwidth=4 smarttab cindent
    autocmd FileType rst setl expandtab shiftwidth=4 smarttab
    autocmd BufRead,BufNewFile *.md	setl filetype=mkd
    autocmd BufRead,BufNewFile Makefile* setl noexpandtab nosmarttab ts=8 filetype=make
    autocmd BufRead,BufNewFile *.mako setl filetype=mako
    autocmd BufRead,BufNewFile *.json setl filetype=json
    autocmd BufRead,BufNewFile *.txt setl tw=65

    "command! Cstyle call CheckStyle()
    "command! Fstyle call FixStyle()
    "command! Edits call SccsEdit()
    "command! Unedits call SccsUnedit()
    "command! Prs call SccsPrs()
    "command! Prints call SccsPrint()
    "command! -nargs=? Creates :call SccsCreate(<args>)
    "command! -nargs=? Delgets :call SccsDelget(<args>)

    command! Gitlog call Gitlog()
    command! Gitadd call Gitadd()
    command! Diffs call Gitdiffs()

    command! GDiff VCSVimDiff
endif
