"=============================================================================
"         File: bufexplorer.vim
"  Description: Buffer Explorer
"               This explorer displays a list of all the buffers currently
"               opened by vim.  The user is then able to open a different
"               buffer, delete/close a buffer or quit the explorer.
"
"               This code is based on work done by Jens Wessling (buf.vim)
"               which was based on M A Aziz Ahmed's explorer.vim and
"               Bram Moolenaar's original buf.vim.
"       Author: Jeff Lanzarotta (frizbeefanatic@yahoo.com)
"  Last Change: Tuesday, September 07, 2000
"      Version: 1.0
"
" Key 
" Combination     Function
" -----------     --------
"    ,b           Launches the buffer browser in the current window. If the
"                 current buffer has been modified, the window is split
"                 and the explorer is run there.
"    ,B           Splits the windows and launches the explorer there.
"    <cr>         Switches to the buffer the cursor is on.
"    d            Deletes the buffer the cursor is on.
"    q            Quits the buffer browser.
"=============================================================================

nmap ,b :call BufExplorer(0, 0)<cr>
nmap ,B :call BufExplorer(1, 0)<cr>

"********************************************************************
" BufExplorer()
" Main
"********************************************************************
function! BufExplorer(split, marked)
  let g:_oldCh = &ch
  let &ch = 2
  
  if(expand("%:p:t") == "_bufExplorer.tmp")
    echo "Sorry, your already in the buffer explorer"
  else
    if((&modified == 1) || (a:split == 1))
      sp /_bufExplorer.tmp
      let b:splitWindow=1
    else
      e /_bufExplorer.tmp
      let b:splitWindow=0
    endif

    call BufSetupSyntaxFile()
    call BufProcessBuffers()
  endif
endfunction

"********************************************************************
" BufProcessBuffers
" Puts the header the buffer names in the window.
"********************************************************************
function! BufProcessBuffers()
  1,$d _
  let oldRep=&report
  set report=1000
  
  call BufAddHeader()
  call BufAddBuffers()

  normal zz
  let &report=oldRep
  let &modified=0
endfunction

"********************************************************************
" BufAddHeader
" This creates the information header.
"********************************************************************
function! BufAddHeader()
   let @f =    "\"-----------------------------------\n"
   let @f = @f."\" <enter> : open a buffer\n"
   let @f = @f."\" d : unload and delete a buffer.\n" 
   let @f = @f."\" q : quit buffer explorer\n"
   let @f = @f."\"-----------------------------------\n"

   put! f
   $
   d _
endfunction

"********************************************************************
" BufAddBuffers
" Add the buffer names to the window.
"********************************************************************
function! BufAddBuffers()
  let _NBuffers = bufnr("$")     " Get the number of the last buffer.
  let _i = 0                     " Set the buffer index to zero.

  let @f = ""

  " Loop through every buffer less than the total number of buffers.
  while _i <= _NBuffers
    let _i = _i + 1
    " Get the name of the buffer.
    let _BufName = bufname(_i)
     
    " Check to see if the buffer is a blank or not. If the buffer does have a
    " name, process it.
    if strlen(_BufName)
      " Only add buffer names that don't match the temp file's.
      if(matchstr(_BufName, "_bufExplorer.tmp") == "")
        let @f = @f._BufName."\n"
      endif
    endif
  endwhile

  put f

  unlet _NBuffers
  unlet _i
endfunction

"********************************************************************
" BufSelect
"
"********************************************************************
function! BufSelect()
  let _cfile = getline('.')
  let _cfile = substitute(_cfile, "\\", "\\\\", "g")

  let _bufnr = bufnr(_cfile)     " Get the buffer number.

  if strlen(_cfile)
    if(_bufnr != -1)             " If the buffer exists.
      " This preserves alternate file.
      if (@#!="")
"        exec("e #")
        exec("e ".escape(@#, ' '))
      endif

      " Open the new buffer.
      exec("b! "._bufnr)
    endif
  endif

  unlet _cfile
  unlet _bufnr

  call BufExit()
endfunction

"********************************************************************
" BufDelete
" Deletes the specified buffer.
"********************************************************************
function! BufDelete()
  let oldRep = &report
  let &report = 1000

  let _cfile = getline('.')
  let _cfile = substitute(_cfile, "\\", "\\\\", "g")
  
  " Check it the file exists and is readable.
  if filereadable(_cfile)
    " Delete the buffer selected.
    exec("bd! ".(bufnr(_cfile)))
    " Delete the buffer's name from the list.
    d _
  endif

  unlet _cfile
  let &report = oldRep
  let &modified=0
endfunction

"********************************************************************
" BufSetupSyntaxFile
" This sets up the syntax highlighting.
"********************************************************************
function! BufSetupSyntaxFile()
  if 1 || has("syntax") && exists("syntax_on") && !has("syntax_items")
    syn match browseSynopsis    "^\".*"
    syn match browseDirectory   "[^\"].*"
    hi link browseSynopsis      PreProc
    hi link browseDirectory Statement
  endif
endfunction

"********************************************************************
" BufBack2PrevFile
" Revirts back to the previous file and exits the buffer explorer.
"********************************************************************
function! BufBack2PrevFile()
  if ((@#!="") && (@#!="_bufExplorer.tmp") && (b:splitWindow==0)) 
    exec("e #")
  endif
  
  call BufExit()
endfunction

"********************************************************************
" BufExit
" Exits the buffer explorer.
"********************************************************************
function! BufExit()
  bd! /_bufExplorer.tmp

  if(exists("g:_oldCh"))
    let &ch=g:_oldCh 
  endif
endfunction

"********************************************************************
" BufferExplorer
" BufferExplorer's autocommand setups.
"********************************************************************
augroup BufferExplorer
  au!
  au BufEnter _bufExplorer.tmp let oldSwap=&swapfile | set noswapfile
  au BufLeave _bufExplorer.tmp let &swapfile=oldSwap
  au BufEnter _bufExplorer.tmp nm <cr> :call BufSelect()<cr>
  au BufLeave _bufExplorer.tmp nun <cr>
  au BufEnter _bufExplorer.tmp nm d :call BufDelete()<cr>
  au BufLeave _bufExplorer.tmp nun d
  au BufEnter _bufExplorer.tmp nm q :call BufBack2PrevFile()<cr>
  au BufLeave _bufExplorer.tmp nun q
augroup end
