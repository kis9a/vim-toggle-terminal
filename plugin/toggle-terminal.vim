if exists('g:loaded_vim_toggle_terminal') && g:loaded_vim_toggle_terminal
 finish
endif

function! s:toggleTerminal(...) abort
  let buftype = getbufvar(bufnr('%'), '&buftype')
  if buftype ==# 'terminal' 
    execute bufwinnr(bufnr('%')) . 'hide'
  else
    let termNumber = v:count
    if a:0 > 0
      let termNumber = a:1
    endif

    if termNumber ==# 0
      let termBuffers = s:getTerminalBufnrs()
      if len(termBuffers) > 0
        call s:openTerminalBottom(min(termBuffers))
      else
        call s:newTerminalBottom()
      endif
    else
      if termNumber =~# '^\d\+$'
        let termBuffers = s:getTerminalBufnrs()
        if termNumber > len(termBuffers)
          call s:newTerminalBottom()
        else
          let bufidx = termNumber - 1
          let termBuffers = sort(termBuffers, 'n')
          if bufidx >= 0
            call s:openTerminalBottom(termBuffers[bufidx])
          endif
        endif
      endif
    endif
  endif
endfunction

function! s:openTerminalBottom(bufnr) abort
  execute 'bo sp | b ' . a:bufnr
  if mode() ==# 'n'
    execute 'normal! i'
  endif
endfunction

function! s:newTerminalBottom() abort
  execute 'bo terminal!'
  if mode() ==# 'n'
    execute 'normal! i'
  endif
endfunction

function! s:getTerminalBufnrs() abort
  let terminalBufnrs = []
  for buf in getbufinfo()
    if getbufvar(buf.bufnr, '&buftype') ==# 'terminal'
      call add(terminalBufnrs, buf.bufnr)
    endif
  endfor
  return terminalBufnrs
endfunction

command! -range -nargs=? ToggleTerminal call s:toggleTerminal(<f-args>)

let g:loaded_vim_toggle_terminal = 1
