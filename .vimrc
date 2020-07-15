set nocompatible              " be iMproved, required
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
filetype off                  " required

"set makeprg=~/bin/mymake
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
" Plugin 'valloric/youcompleteme'
Plugin 'yegappan/grep'
Plugin 'ctrlpvim/ctrlp.vim.git'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"set list     shows tailing white space
"set verbose=9
"let loaded_matchparen = 1
"au VimEnter * :NoMatchParen
"set clipboard=unnamed
"call pathogen#infect()
set pastetoggle=<F11>
:if !exists("autocommands_loaded")
:  let autocommands_loaded = 1
:  au BufWritePost /Users/ggibbons/.vim/doc/gfg.txt helptags ~/.vim/doc 
:  au BufWritePost /Users/ggibbons/.vim/doc/gfg.txt bw /Users/ggibbons/.vim/doc/gfg.txt
:  au BufWritePost /Users/ggibbons/.vim/doc/etl.txt helptags ~/.vim/doc 
:  au BufWritePost * if getline(1) =~ "^#!/bin/" | silent !chmod a+x <afile>
:  autocmd BufWritePre *.py :%s/\s\+$//e
:  autocmd BufWritePost .vimrc source $MYVIMRC
:  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
 
:filetype plugin indent on 
autocmd FileType python set omnifunc=pythoncomplete#Complete
":source ~/.vim/plugin/matchit.vim
au BufRead,BufNewFile *.t set filetype=perl
au FileType c,cpp,css,javascript,java,html,rb  let b:match_words = &matchpairs
"autocmd FileType python,ruby  match ErrorMsg '\%>79v.\+'
"autocmd FileType python nmap <buffer> <leader>c :new<CR>:r !pep8 #<CR><CR><C-W><C-P>
autocmd FileType ruby nmap <buffer> <leader>c :w<CR> :!rake
autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
autocmd FileType python set makeprg=pylint\ --rcfile=pylint13.cfg\ p4gf_log.py\ %:p\ 2>&1
autocmd FileType python set errorformat=%f:%l:\ %m
"need absolute path below ...

set wildmenu

""""""""
" Go to previously edited  file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"
""""""""
nmap <buffer> <leader>pr :new<CR>:r !tannex<CR><CR>
"  au BufLeave /Users/ggibbons/.vim/doc/gfg.txt bw /Users/ggibbons/.vim/doc/gfg.txt
:endif
autocmd FileType html source $HOME/.vim/ftplugin/html.vim
set nocompatible
"set undofile
"colorscheme darkblue
" colorscheme gzellner
colorscheme gfg
"filetype on
syntax on
highlight ColorColumn ctermbg=7 guibg=Grey90
set colorcolumn=80
hi clear SpellBad
hi SpellBad cterm=underline
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
set tags=./tags,tags
set includeexpr=Inclsub(v:fname)
set suffixesadd=.java
set autoindent
set autowrite
set smartindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set nostartofline
set hidden
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
" Remember SPACE must be escaped with \ - or error reported on load
set statusline=%F%m%r%h%w\ b:%n\ \ %l,%v\ \ %p%%\ \ %L\ %<\ %=\ [x%2.2B]
set laststatus=2
"set patchmode=.orig
set softtabstop=4
set shiftwidth=4
set backup
set showmatch
set tabstop=4
set ruler
set showcmd
set wildignore=*.class,*.orig,*.v*,*~
set listchars=eol:$,tab::.,trail:_,extends:>,precedes:<
set virtualedit=block
set fo=troqc
"set diffopt=siller,iwhite
set backspace=start,indent,eol
"set whichwrap=b,s,<,>,[,]
set whichwrap=b,s,<,>,[,


set backup                    " keep a backup file
set backupdir=~/.vim/_backups " store backups here
set directory=~/.vim/_swaps   " store swap files here


":set <LEFT>=[D
":set <RIGHT>=[C
"replace all occurrences of the word under the cursor and prompt for the
"replacement string
":nmap <leader>z :%s#<c-r>=expand("<cword>")<cr>#
:nnoremap <leader><Space> :ZoomWin<CR>
" macro converts tag to 8 spaces
"vmap ;e :%s/^\t/        <CR>
" Still needs work :g does all lines, but just s failes if no match 
"vmap ;e :'<,'>g/^\t\t\t/s/^\t\t\t/\t                 <CR> \| :'<,'>g/^\t\t/s/^\t\t/\t        <CR>

"replace all occurrences of the visualmode selected test and prompt for the
"replacement string
:vmap <leader>z y:%s/<C-R>"/
:vmap <leader>] :s/^/#/<CR>:noh<CR>
:vmap <leader>[ :s/^#//<CR>:noh<CR>
autocmd FileType cpp  vmap <leader>] :s/^/\/\//<CR>:noh<CR>
autocmd FileType cpp vmap <leader>[ :s/^\/\///<CR>:noh<CR>
"the following enables vimdiff to ignore whitespace when comparing files
set diffexpr=MyDiff()
function! MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-b --ignore-all-space "
   endif
   silent execute "!diff " . opt . v:fname_in . " " . v:fname_new .
	\  " > " . v:fname_out
endfunction

if &diff
 map gs :call IwhiteToggle()<CR>
 function! IwhiteToggle()
   if &diffopt =~ 'iwhite'
	 set diffopt-=iwhite
   else
	 set diffopt+=iwhite
   endif
 endfunction
endif
"these mappings apply to VisualMode 
"
:set ssop+=buffers
au WinLeave * set cursorline 
au WinEnter * set nocursorline 
hi Cursorline term=underline cterm=underline ctermfg=5 gui=underline guifg=SlateBlue 
"these wrap ansii color character commands around the visualmode selected text - good for adding
"color to stdout  [b=blue, [r=red, etc
:vmap [b "zdi<C-V><ESC>[1;34m<C-R>z<C-V><ESC>[0m<ESC>
:vmap [r "zdi<C-V><ESC>[1;31m<C-R>z<C-V><ESC>[0m<ESC>
:vmap [m "zdi<C-V><ESC>[1;35m<C-R>z<C-V><ESC>[0m<ESC>
:vmap [c "zdi<C-V><ESC>[1;36m<C-R>z<C-V><ESC>[0m<ESC>
:vmap [y "zdi<C-V><ESC>[1;33m<C-R>z<C-V><ESC>[0m<ESC>
:vmap [g "zdi<C-V><ESC>[1;32m<C-R>z<C-V><ESC>[0m<ESC>

"wrap highlighted text in doublequotes
:vmap [q "zdi"<C-R>z"

"the following do things to the visualmode selected texti .. for loops,
"Vector iterator,HashMap iterator
:vmap sy "zdi<<C-R>y><C-R>z</<C-R>y><ESC>
:vmap sb "zdi<b><C-R>z</b><ESC>
:vmap sc "zdi/*<CR><C-R>z<CR>*/<CR><ESC>
:vmap ss "zdiif (<C-R>z != null && <C-R>z.length() > 0 ) <ESC>
:vmap sv "zdifor (int ix = 0 ; ix < <C-R>z.size(); ix++) { <CR><TAB><CR>} <ESC>2kV2j=
:vmap sm "zdifor (Iterator iter = <C-R>z.keySet().iterator(); iter.hasNext();) { <CR><TAB><CR>} <ESC>2kV2j=
:vmap st "zdi<?= <C-R>z ?><ESC>
:vmap sf "zdiif (<C-R>z != null && <C-R>z.size() > 0) {<CR><TAB><CR>} <ESC>2kV2j=
:vmap sz "zdiif (<C-R>z != null && <C-R>z.size() > 0) {<CR><TAB>for (int ix = 0 ; ix < <C-R>z.size(); ix++) { <CR><TAB>Vector recvec = (Vector)<C-R>z.get(ix);<CR>}<CR>} <ESC>4kV4j=
":vmap sh "zy:split! /Users/ggibbons/.vim/doc/gfg.txt<CR>Gmao<C-R>z<ESC>'ajO<CR>NewTag                 *gfg-NewTag*<ESC>
:vmap sh "zy:call GetTagName("gfg")<CR>:split! /Users/ggibbons/.vim/doc/gfg.txt<CR>Gmao#TAG#<CR><C-R>z<ESC>'aj:call InsertTagName("g")<CR>
:vmap se "zy:call GetTagName("etl")<CR>:split! /Users/ggibbons/.vim/doc/etl.txt<CR>Gmao#TAG#<CR><C-R>z<ESC>'aj:call InsertTagName("e")<CR>

:function! GetTagName(name)
:  call inputsave()
:  let g:MyTagName = input("enter " . a:name . " tagname: ")
:  call inputrestore()
:endfunction
:function! InsertTagName(name)
:let tag2 = g:MyTagName . "                   *" . a:name ."-" . g:MyTagName . "*"
:call setline(".",tag2)
:endfunction
:let g:mypath = &path
autocmd FileType python let Grep_Default_Filelist = 'bin/*.py' 
autocmd FileType python let Grep_Default_Filelist = 'bin/*.py' 
autocmd FileType cpp let Grep_Default_Filelist = '*.cc *.h' 
autocmd BufEnter,BufRead */depot/main/*  let Rgrep_Start_Dir = '$HOME/server/depot/main/p4' 
autocmd BufEnter,BufRead */depot/p17.1/*  let Rgrep_Start_Dir = '$HOME/server/depot/p17.1/p4' 
autocmd BufEnter,BufRead */depot/p17.2/*  let Rgrep_Start_Dir = '$HOME/server/depot/p17.2/p4' 
autocmd BufEnter,BufRead */depot/p18.2/*  let Rgrep_Start_Dir = '$HOME/server/depot/p18.2/p4' 
autocmd BufEnter,BufRead */depot/main/gconn/*  let Rgrep_Start_Dir = '$HOME/server/depot/main/gconn/src' 
autocmd BufEnter,BufRead */depot/p18.2/gconn/*  let Rgrep_Start_Dir = '$HOME/server/depot/p18.2/gconn/src' 
autocmd BufEnter,BufRead */depot/main/*  set tags=./tags,tags,$HOME/server/depot/main/p4/tags 
"autocmd BufEnter,BufRead */depot/main/*  cd $ppm
autocmd BufEnter,BufRead */depot/p17.1/*  set tags=./tags,tags,$HOME/server/depot/p17.1/p4/tags 
autocmd BufEnter,BufRead */depot/p17.2/*  set tags=./tags,tags,$HOME/server/depot/p17.2/p4/tags 
autocmd BufEnter,BufRead */depot/p18.2/*  set tags=./tags,tags,$HOME/server/depot/p18.2/p4/tags 
autocmd BufEnter,BufRead */depot/p18.2/*  set path+=$HOME/server/depot/p18.2/**
autocmd BufEnter,BufRead */depot/p18.2/gconn/*  set path=.,/usr/include,$HOME/server/depot/p18.2/gconn/src/**
autocmd BufEnter,BufRead */depot/main/*  set path+=$HOME/server/depot/main/**
autocmd BufEnter,BufRead */depot/main/*  set tags=$HOME/server/depot/main/p4/tags,./tags,tags
autocmd BufEnter,BufRead */depot/main/gconn/*  set path+=$HOME/server/depot/main/gconn/src/**
autocmd BufEnter,BufRead */depot/main/gconn/*  set tags=tags,./tags,$HOME/server/depot/main/gconn/src/tags 
" 19.1 autocmd
autocmd BufEnter,BufRead */depot/p19.1/*  let Rgrep_Start_Dir = '$HOME/server/depot/p19.1/p4' 
autocmd BufEnter,BufRead */depot/p19.1/gconn/*  set tags=tags,./tags,$HOME/server/depot/p19.1/gconn/src/tags 
autocmd BufEnter,BufRead */depot/p19.1/gconn/*  let Rgrep_Start_Dir = '$HOME/server/depot/p19.1/gconn/src' 
autocmd BufEnter,BufRead */depot/p19.1/*  set tags=$HOME/server/depot/p19.1/p4/tags,./tags,tags
autocmd BufEnter,BufRead */depot/p19.1/*  set path+=$HOME/server/depot/p19.1/**
"autocmd BufEnter,BufRead */depot/p19.1/gconn/*  set path+=$HOME/server/depot/p19.1/gconn/src/**
autocmd BufEnter,BufRead */depot/p19.1/gconn/*  set path=.,/usr/include,$HOME/server/depot/p19.1/gconn/src/**
" 19.2 autocmd
autocmd BufEnter,BufRead */depot/p19.2/*  let Rgrep_Start_Dir = '$HOME/server/depot/p19.2/p4' 
autocmd BufEnter,BufRead */depot/p19.2/gconn/*  set tags=tags,./tags,$HOME/server/depot/p19.2/gconn/src/tags 
autocmd BufEnter,BufRead */depot/p19.2/gconn/*  let Rgrep_Start_Dir = '$HOME/server/depot/p19.2/gconn/src' 
autocmd BufEnter,BufRead */depot/p19.2/*  set tags=$HOME/server/depot/p19.2/p4/tags,./tags,tags
autocmd BufEnter,BufRead */depot/p19.2/*  set path+=$HOME/server/depot/p19.2/**
"autocmd BufEnter,BufRead */depot/p19.2/gconn/*  set path+=$HOME/server/depot/p19.2/gconn/src/**
autocmd BufEnter,BufRead */depot/p19.2/gconn/*  set path=.,/usr/include,$HOME/server/depot/p19.2/gconn/src/**

autocmd BufEnter,BufRead */depot/p20.1/*  let Rgrep_Start_Dir = '$HOME/server/depot/p20.1/p4' 
autocmd BufEnter,BufRead */depot/p20.1/gconn/*  set tags=tags,./tags,$HOME/server/depot/p20.1/gconn/src/tags 
autocmd BufEnter,BufRead */depot/p20.1/gconn/*  let Rgrep_Start_Dir = '$HOME/server/depot/p20.1/gconn/src' 
autocmd BufEnter,BufRead */depot/p20.1/*  set tags=$HOME/server/depot/p20.1/p4/tags,./tags,tags
autocmd BufEnter,BufRead */depot/p20.1/*  set path+=$HOME/server/depot/p20.1/**
"autocmd BufEnter,BufRead */depot/p20.1/gconn/*  set path+=$HOME/server/depot/p20.1/gconn/src/**
autocmd BufEnter,BufRead */depot/p20.1/gconn/*  set path=.,/usr/include,$HOME/server/depot/p20.1/gconn/src/**
autocmd BufNewFile,BufRead */server/* set ts=8 sw=4 noexpandtab cinoptions=^1s
autocmd BufNewFile,BufRead */gconn/*  set ts=8 sw=4 noexpandtab cinoptions=^1s
"set expandtab
"highlight all matches if the visualmode selection
:vmap // y/<C-R>"<CR>
:noremap <Space> <PageDown>
:noremap <BS> <PageUp>
":noremap <F5> <C-W>w:resize<CR>
"map <leader>cs to close previously visited window
noremap <leader>cs <C-W><C-P>:close<CR>
"map Ctl-K to scroll up in the previously visited window
:noremap <C-K> <C-W><C-P>k<C-W><C-P>
"map Ctl-J to scroll down in the previously visited window
:noremap <C-J> <C-W><C-P>j<C-W><C-P>
"map Ctl-N to search down for the next occurence of search pattern in the previously visited window
:noremap <C-N> <C-W><C-P>n<C-W><C-P>
"map Ctl-P to search up for the next occurence of search pattern in the previously visited window
":noremap <C-P> <C-W><C-P>N<C-W><C-P>
":noremap <C-;> <C-W><C-P>
:noremap <C-E> <C-W><C-P>
" map <C-H> to scroll down 
":noremap <C-H> <C-D>
":noremap <C-L> <C-U>
set wmh=0
map \d /<enter<CR>v4ec
map <F2> /^Files:/<CR>jVG!sed -n -f $HOME/p4submitlist.log<CR>
map <F3> :let @/=""<CR>
map <F6> :ls<CR>:e #
map <F8> :w<CR>:make<CR> 
map <leader>n :set number!<CR>
nmap ;q :qa!<CR>
nmap ;v :vert sba<CR>

":let b:match_words = '<td[^>]*>:</td>,<tr[^>]*:</tr>,<table[^>]*>:</table>,<%:%>'
":let b:match_words = '<\([a-zA-z]\)[^>]*>:</\1>'
:let b:match_words='<\([a-zA-Z]\+\)[^>]*>:</\1>,<%:%>'
function! InsertTabWrapper() 
    let col = col('.') - 1 
    if !col || getline('.')[col - 1] !~ '\k' 
    return "\<tab>" 
    else 
    return "\<c-p>" 
    endif 
endfunction 

"inoremap <tab> <c-r>=InsertTabWrapper()<cr> 
"set shellpipe=2>&1\|\ tee
" here is where :make is setup to call javac
set shellpipe=2>
"set shell=bash\ --login
"set errorformat=%f:%l:%m
":set efm=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
":set efm=%A%f:%l:\ %m,%+Z%p^,%+C%.%#,%-G%.%#
":set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
"             \%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
"map ;s   :up \| w! %:p:h/<C-R>=strftime("%y%m%d-%H:%M")<CR>--<C-R>=expand("%:t")<CR><CR>
map ;s :mksession! <cr>
map ;r :source Session.vim<cr>
map ;d :bd!<cr>

"add the current path to the vim path variable
fun! AddPath()
	let added = expand("%:p:h")
	:execute "set path+=" . added
endfun
map ;p :call AddPath()<CR>
" Removes trailing spaces 
function! TrimWhiteSpace() 
: %s/\s*$// 
: '' 
:endfunction 

let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*\|^/private/.*\|.*\.v\d\+$'  " For Unix
function! P4filter()
  :let logfile = $HOME . "/p4submitlist.log"
  :let havefile = filereadable(logfile)
  :if havefile
  :call search('^Files:')
  :normal jVGd
  :r $HOME/p4submitlist.log
  :exe 'normal zz' 
  :endif
  :call search('<enter')
  :normal v4e
:endfunction
:command! Pf :call P4filter()

"setup for the jcommenter.vim javadoc macro
"autocmd FileType java source $HOME/.vim/macros/jcommenter.vim
"autocmd FileType java let b:jcommenter_class_author='g gibbons (ggibbons@liveworld.com)'
"autocmd FileType java let b:jcommenter_file_author='g gibbons (ggibbons@liveworld.com)'
"autocmd FileType java map <Leader>c :call JCommentWriter()<CR>

" change n (find next) command to autoscroll at the bottom of the page
map <silent> zx :call ZZTop()<CR>
function! ZZTop()
	:let mypos = winline() + 5
	:if mypos  > winheight(0) 
	:exe 'normal zz'
	:endif
:endfunction
nmap n nzx
nmap ne :ne<CR>
set scrolloff=4

"nmap n nzz
"nmap N Nzz
"nmap * *zz
"nmap # #zz
"nmap g* g*zz
"nmap g# g#zz 
"
" these assume work on the current line - assumes it is an XML line and
" add/remove XML comment
map str :s:^\(\w\+\):<td><b>\1</b></td><td>:<CR>:s:^:<tr>:<CR>:s:$:</td></tr>:<CR>
map sxc :s:^<:<!-- :<CR>:s:/>:/> -->:<CR>
map sxd :s:^<!-- :<:<CR>:s:/> -->:/><CR>
map &t :%s/delimiter=","/delimiter="\\t"/
function! Hgfg()
	:helptags ~/.vim/doc
:endfunction
let Vimplate = "$HOME/bin/vimplate"
nmap <M-Left> :bprev<CR>
nmap <M-Right> :bnext<CR>

:nmap <leader>o :cn<CR>
:nmap <leader>p :cp<CR>
inoremap jj <ESC>
"inoremap [[ []<Left>
"inoremap (( ()<Left>
"inoremap {{ {}<Left>
set timeoutlen=275
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  " new | r # | normal 1Gdd - for horizontal split
  vnew | r # | normal 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diff call s:DiffWithSaved() 
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
:let g:netrw_longlist=1

" expand path of current buffer's file  .. good for :e or :cd or whatever
inoremap <leader>f <C-R>=expand("%:p")<CR>



function! Inclsub(fstring)
	if a:fstring =~ "/merge"
		let s:fstring=substitute(a:fstring,'/merge','','')
	else
		let s:fstring=a:fstring
	endif
	if s:fstring =~ ".jsp"
		let s:fstring=substitute(s:fstring,'^/','','')
	else
		let s:fstring=substitute(s:fstring,'\.','/','g')
	endif
	return s:fstring

endfunction
function! ToggleExpSortDir()
    if g:netrw_sort_direction =~ "reverse"
        let g:netrw_sort_direction="normal"
    else
        let g:netrw_sort_direction="reverse"
    endif
endfunction
nnoremap <silent> ss :call ToggleExpSortDir()<CR>


:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
set complete-=i
map gdt vat<Esc>`<df>`>F<df>
"set highlight=8:SpecialKey,@:NonText,d:Directory,e:ErrorMsg,i:IncSearch,l:Search,m:MoreMsg,M:ModeMsg,n:LineNr,r:Question,s:StatusLine,S:StatusLineNC,c:VertSplit,t:Title,v:Visual,V:VisualNOS,w:WarningMsg,W:WildMenu,f:Folded,F:FoldColumn,A:DiffAdd,C:DiffChange,D:DiffDelete,T:DiffText
nmap - $ 
"map option-e optione to p4 edit
function! Openxwork(theaction)
  :tabe ${sxwk} 
  :let actionname='action name="' . a:theaction
  :call search(actionname)
endfunction
"source /Applications/Vim.app/Contents/Resources/vim/runtime/ftplugin/man.vim

:let @r="G?build-result0d%gg/buildtopP"
"@d will add the ModifiedDate> after every <CreationDate>
":let @d="/<CreationDatge€kb€kbe>yyp:s/Creationdate€kb€kb€kb€kbDate/ModifiedDate/gj"
"@t will copy the closest CreationDate/ModifiedDate pair after the <Thread> tag
":let @t="/<Thread>/€kb/€kb/<CreationDate>2yy?<Thread>pjj"
"set: tw=0 wrap linebreak
"function! Esctag()
" :s/</&lt;/g
" :s/>/&gt;/g
"endfunction
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
" Bubble single lines
nmap <C-UP> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-UP> xkP`[V`]
vmap <C-Down> xp`[V`]

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! <SID>align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

nnoremap <silent> <leader>x :call <SID>StripTrailingWhitespaces()<CR>

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
  let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
cnoremap %% <C-R>=expand('%:p')<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
  
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
 let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|^bin/__pycache__|^depot|^build'

:noremap <leader>f :FufCoverageFile<CR>
:noremap <leader>t :FufTag<CR>
:noremap <leader>b :FufBuffer<CR>
:noremap <leader>b :FufBuffer<CR>
:noremap <leader>w <C-W><C-W>
":noremap <C-A> <C-W><C-W>
:nnoremap \; :<c-u>call MultiCursorSearch('<c-r><c-w>')<cr>
let g:multicursor_quit = "\:"
function! Gofl()
    :s/", line//
    :normal 2w
    :normal gF
endfunction
":nmap ggf :s/", line//<CR> | normal gF
":nmap <leader>g :vim <C-R><C-W> bin/*.py<CR>
:nmap <leader>g :g/<C-R><C-W>/#<CR>
map \\ :e#<CR>
map \| :g/^\d\d-\d\d /s/^.\{15}//<CR>
" set functions keys with actual values received by vim
set <F1>=OP
set <F2>=OQ
set <F3>=OR
set <F4>=OS
set <F5>=[15~]
" now map to frequent actions
":noremap <F1> :noh<CR>
":noremap <F2> :set nonumber!<CR>
":noremap <F3> :set nolist!<CR>
":noremap <F4> :source $MYVIMRC<CR>
nmap <leader>v :vertical resize -30<CR>
nmap <leader>vv :vertical resize +30<CR>
nmap <leader>r :resize -6<CR>
nmap <leader>rr :resize +6<CR>
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
"function! s:DiffWithGITCheckedOut()
"  let filetype=&ft
"  diffthis
"  vnew | exe "%!git diff " . expand("#:p:h") . "| patch -p 1 -Rs -o /dev/stdout"
"  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
"  diffthis
"endfunction
"com! DiffGIT call s:DiffWithGITCheckedOut()
command! DiffGit vert new | set bt=nofile | r ++edit  !git show HEAD: . expand(%:p:h) | 0d_ | diffthis | wincmd p | diffthis
function! Wmake()
	:w
    : make
:endfunction
nmap <Leader>a :call Wmake()<CR>
function! Wrun()
	:w
    :!%
:endfunction
function! RemoveEscapeSeq()
    :%s/[\x1b]\[\(\d\+\)m//
endfunction
map <leader>re :call RemoveEscapeSeq()<CR> 
function! WrunT()
    let tfile = expand("%:t:r")
	:vert rightbelow new
    :execute '$read !rgf '. tfile 
    :call RemoveEscapeSeq()
    :1 
"    :%s/[\x1b]\[\(\d\+\)m//
:endfunction
autocmd FileType python nmap \r :w<CR>:!%<CR>
"au BufRead,BufNewFile *.t  nmap \r :w<CR>:!rgf %:t:r<CR>
au BufRead,BufNewFile *.t  nmap \r :w<CR>:call WrunT()<CR>
command! Setw let g:netrw_chgwin= winnr()

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
"  http://superuser.com/questions/377501/keep-cursor-in-netrw-window-when-browsing-files-in-vim
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
"let g:netrw_browse_split = 4
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_sort_by = "time"
let g:netrw_sort_direction = "reverse"
" absolute width of netrw window
"let g:netrw_winsize = -28

" do not display info on the top of window
let g:netrw_banner = 1

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below

" use the previous window to open file
"let g:netrw_browse_split = 4

" Default to tree mode
let g:netrw_liststyle=3

autocmd FileType netrw setl bufhidden=delete " or use :qa!

" Change directory to the current buffer when opening files.
"set autochdir

:function! Vgf(name)
:execute 'vimgrep' a:name 'bin/*.py'
:endfunction
command! -nargs=* Vgf call Vgf( '<f-args>' )
command! Defs :g/def /# 
nnoremap ,cd :cd %:p:h<CR>
map <leader>' F"i_(<Esc>2f"a)<Esc>
map <leader>h :noh<CR>
map <leader>y :YcmRestartServer<CR>
map <leader>B) :Grep <C-R><C-W> bin/*.py <CR> 
map <leader>T :Grep <C-R><C-W> p4-test/dev/* <CR> 
autocmd FileType python map ;b :Grep <C-R><C-W> "%:p:h"/*.py<CR>
autocmd FileType cpp map ;b :Rgrep <C-R><C-W><CR>
map ;t :Grep <C-R><C-W> "%:p:h"/* <CR>
map vv :vertical: resize +30<CR>
map vb :vertical: resize -30<CR>
"let g:netrw_list_hide='p4gf_g2p_matrix*,p4gf_fastex*'
let @d=':%s/^.*DEBUG/DEBUG/^M:%s/^.*INFO/INFO/'

"" braces completion ...
":inoremap ( ()<Esc>i
:inoremap (( ()
":inoremap { {}<Esc>i
:inoremap {{ {}
":inoremap [ []<Esc>i
:inoremap [[ []
" while in insert mode, move over one char and continue insert
:inoremap <C-L> <Esc>la
":inoremap <C-P> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

"call matchadd('ColorColumn', '\%100v', 100)
let g:airline#extensions#branch#enabled = 1
" toggle nu and rnu together
":map ;n :set nu!<CR>:set rnu!<CR>
:map ;n :set nu!<CR>
:map ;l :set list!<CR>
:map ;; d$
:map ;c :set t_Co=0<CR>
:map ;cb :windo set scb!<CR>
"nnoremap <silent> gc :redir @a<CR>:g//#<CR>:redir END<CR>:new<CR>:put! a<CR>
nnoremap <silent> gc :redir >>matches.tmp<CR>:g//#<CR>:redir END<CR>:new matches.tmp<CR>
"inoremap <C-a> <ESC>A
nnoremap <-C-G> :g/<C-R><C-W>/#<CR>
":cd %:h
"below .. find lines <= 25 char
"/^.\{,25}$/
"below .. find lines >= 100 char
"/^.\{100,}$/
"highlight ColorColumn ctermbg=7 guibg=Grey90
map oo <C-O>;
"open tag in vertical window
"nnoremap ]] :vsplit %<CR>g<C-]>
nnoremap Q !!$SHELL<CR>

function! FixTabs(...)
    " Replace left justified 3 TABS with 1 TAB and spaces
    " Then replace left justified 2 TABS with 1 TAB and spaces
    " Assumes:  tabstop=8   shiftwith=4  softtabstop=4
    " If no args, get the line and column of the visual selection marks
    " If any arg, process the entire file
    "
    if a:0 == 0
        let [lnum1, col1] = getpos("'<")[1:2]
        let [lnum2, col2] = getpos("'>")[1:2]
        execute "silent " . lnum1 . ',' . lnum2 .  "g/^\t\t\t\t/s/^\t\t\t\t/\t                        "
        execute "silent " . lnum1 . ',' . lnum2 .  "g/^\t\t\t/s/^\t\t\t/\t                "
        execute "silent " . lnum1 . ',' . lnum2 . "g/^\t\t/s/^\t\t/\t        "
    " Process the entire file
    else
        execute "silent g/^\t\t\t/s/^\t\t\t/\t                "
        execute "silent g/^\t\t/s/^\t\t/\t        "
    endif
endfunction

vnoremap <silent> ;w :call FixTabs()<CR>
nnoremap <silent> ;w :call FixTabs(1)<CR>

" Call diff -w  to ignore whitespace
set diffopt+=iwhite
set diffexpr=DiffW()
function DiffW()
  let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w " " swapped vim's -b with -w
   endif
   silent execute "!diff -a --binary " . opt .
     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction

" Usage:
" :call Annotate()
" or
" :call Annote(1)
" Must be called while in the perforce source window.
"
" open a new vertical buffer
" run p4 annotate on the previous buffer's fname.
" by default show change numbers
" pass any argument to show rev numbers
function Annotate(...)
	let g:gfgFname=expand('%:p')  
	:vnew
	if a:0 < 1 
	  :execute ":read !p4 annotate -c " . g:gfgFname
	else
	  :execute ":read !p4 annotate " . g:gfgFname
	endif
endfunction

function GetChangeFromRev(revNum)
	:redir @r 
	":execute "!p4 filelog " .  g:gfgFname . " | grep " . a:revNum . " | cut -d ' ' -f4"
	:execute "!p4 filelog " .  g:gfgFname . " | grep " . a:revNum
	:redir END
endfunction

"nnoremap ;x O#<ESC>\|j\|o#<ESC>
nnoremap ;x O<ESC>\|j\|o<ESC>
nnoremap ;z :s/note/like/ \| :s/;/, qr:fixme:, "fixmsg";/ <CR>
command! -nargs=? Filter let @a='' | execute 'g/<args>/y# A' | new | setlocal bt=nofile | put! a
nnoremap ;g :redir @a<CR>:g//#<CR>:redir END<CR>:new<CR>:put! a<CR>
nnoremap c0 0i#

"
" Insert triple # c comment
" Smart enought to wrap non blank line with # above and below
" Or start inset mode on middle or 3 blank # comments
" #
" # comment
" # 
function InsertComment()
	let l:firstc=getline('.')[0] 
	if getline('.') =~ '^\s*$'
		exe "norm! 0i# "
		exe "norm! O"
		exe "norm! jo"
		exe "norm! k"
		:startinsert! 
	elseif l:firstc == "#"
		exe "norm! O"
		exe "norm! jo"
		exe "norm! k$"
	else
		exe "norm! 0i# "
		exe "norm! O"
		exe "norm! jo"
		exe "norm! k$"
	endif
endfunction

nnoremap dc :call InsertComment()<CR>
