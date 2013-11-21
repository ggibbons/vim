"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buftabs (C) 2006 Ico Doornekamp
"
" This is a tiny script that allows switching between buffers with the F1 and
" F2 keys, while showing a tabs-like list of buffers in the bottom of the
" window. The biggest advantage of this script over various others is that it
" does not take any lines of the window.
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Show_buftabs()

	let l:i = 1
	let l:names = ''
	
	" Add all modifieable buffer names to the list. Visible
	" buffers are enclosed in []'s, modified buffers get an
	" exclaimation mark appended.

	while(l:i <= bufnr('$'))
	
		if getbufvar(l:i, "&modifiable") == 1

			if bufwinnr(l:i) != -1
				let l:names = l:names . '('
			endif
				
			let l:names = l:names . l:i . ":" . bufname(l:i) 
			if getbufvar(l:i, "&modified") == 1
				let l:names = l:names . "!"
			endif
			
			if bufwinnr(l:i) != -1
				let l:names = l:names . ')'
			endif

			let l:names = l:names . ' '
		endif
		let l:i = l:i + 1
	endwhile

	" If the resulting string is too long to display, find
	" the current selected file and make sure it's in view

	let l:width = winwidth(0) - 12
	let l:start = match(l:names, "(")+1
	let l:end = match(l:names, ")")+1

	if ! exists("g:from") 
		let g:from = 0
	endif

	if(l:start < g:from) 
		let g:from = l:start - 1
	endif

	if l:end > g:from + l:width
		let g:from = l:end - l:width 
	endif
		
	let l:names = strpart(l:names, g:from, l:width)
	
	redraw
	echon l:names

endfunction

" Show buftabs at startup
"
autocmd VimEnter * call Show_buftabs()

" F1/F2 switch between buffers

:noremap <f1> :bprev<return>:call Show_buftabs()<enter>
:noremap <f2> :bnext<return>:call Show_buftabs()<enter>

" end

