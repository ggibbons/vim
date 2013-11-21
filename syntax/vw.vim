" Vim syntax file
" Language: vimWiki
" Maintainer:   Dave Land
" Last Change:  2007 May 26

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
   echo "wiki.vim quitting"
   finish
endif

syn clear

syn match wikiWord "\<[a-z]\+[A-Z]\+[a-z]\+"

let b:current_syntax = "vw"

highlight wikiWord guifg=yellow

" vim: ts=4


