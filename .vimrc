version 5.4

" pathogen!
call pathogen#infect()


" Remove ALL auto-commands.  This avoids having the
" autocommands twice when the vimrc file is sourced again.
autocmd!
filetype on
"filetype plugin on
syntax on

"==============
"   SETTINGS
"==============

set autoindent
set autowrite
"set backspace=indent,eol,start
set nobackup
"set backupdir=~/.vim/backups
set background=dark
set clipboard=autoselect
set nocompatible
set complete=.,b,u,w,t,i " buffers used for lookup in autocompletion
set cinoptions=>3,e0,n0,}0,^0,:2,=3,p3,t0,(3,)30,*40,+3,f0,{0,c3,u3
set cinkeys=0{,0},!^F,o,O,e,*<Return>,0#
set comments=s1:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,nb:>,fb:-
set dictionary=/usr/share/dict/words
set noerrorbells
set equalprg="indent"
set esckeys
set expandtab
set fileformat=unix  " Always on a linux or unix box :-)
set formatoptions=cqrtl
set helpheight=0
set hidden
set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
set history=100
set nohlsearch
set ignorecase
set incsearch
" iskeyword:  Add the dash ('-'), the dot ('.'), and the '@'
"                   as "letters" to "words".
" iskeyword=@,48-57,_,192-255   (default)
set iskeyword=@,48-57,_,192-255,-,.,@-@
set laststatus=2
" lazyredraw:  do not update screen while executing macros
set lazyredraw
" magic: use some magic in search patterns
set magic
" modeline:    ...
" Allow the last few lines to be a modeline - useful when
" the last line in sig gives the preferred textwidth for replies.
set modeline
set modelines=4
set more
set mouse=a
set nonumber
set pastetoggle=<F9>
" path: The list of directories to search when you specify a file with an
" edit command.
set path=.,~/
set report=0
set restorescreen
set ruler
set scrolloff=0
set shell=/bin/sh
" shiftwidth:  Number of spaces to use for each insertion of (auto)indent.
set   shiftwidth=2
" String to put at the start of lines that have been wrapped.
set showbreak="+ "
" showcmd: Show current uncompleted command
set showcmd
" showmatch:   Show the matching bracket for the last ')'?
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
" startofline: do not jump to first character with page commands,
" ie keep the cursor in the current column.
set nostartofline
" suffixes: Ignore filename with any of these suffixes
" when using the ":edit" command.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=2
set tildeop
"set textwidth=76
set title
set ttyfast
set undolevels=1000  " undoing 1000 changes should be enough :-)
set updatecount=100  " write swap file to disk after each 200 characters
set updatetime=6000  " write swap file to disk after 5 inactive seconds
" viminfo:  What info to store from an editing session
" in the viminfo file;  can be used at next session.
set viminfo=%,'50,\"100,:500,n~/.viminfo
set visualbell
set whichwrap=<,>,b,s
" wildchar  the char used for "expansion" on the command line
set   wildchar=<TAB>

if &term=="xterm"
  set t_Co=8          " "terminal has eight colors"
  set t_Sb=[4%dm    " escape sequence for background
  set t_Sf=[3%dm    " escape sequence for foreground
endif

" ===================================================================
" Abbreviations
" ===================================================================
"  source ~/.abbr.vimrc
"
" ===================================================================
" MAPpings
" ===================================================================
" Caveat:  Mapping must be "prefix free", ie no mapping must be the
" prefix of any other mapping.  Example:  "map ,abc foo" and
" "map ,abcd bar" will give you the error message "Ambigous mapping".
"
" The following maps get rid of some basic problems:
"
" Disable the suspend for ^Z.
  map <C-Z> :shell
"
" When I let Vim write the current buffer I frequently mistype the
" command ":w" as ":W" - so I have to remap it to correct this typo:
  nmap :W :w
  nmap :Q :q

  map Q gq
" Don't use Ex mode, use Q for formatting
"
" ===================================================================
" VIM - Editing and updating the vimrc:
" As I often make changes to this file I use these commands
" to start editing it and also update it:
  let vimrc='~/.vimrc'
  let myabbr='~/.abbr.vimrc'
  nn  ,vu :source <C-R>=vimrc<CR><CR>
  nn  ,ve :edit   <C-R>=vimrc<CR><CR>
  nn  ,vy :edit   <C-R>=myabbr<CR><CR>
" ===================================================================
"
" General Editing
"
"      ;rcm = remove "control-m"s - for those mails sent from DOS:
  cmap ;rcm %s/<C-M>//g
"
"     Make whitespace visible:
"     Sws = show whitespace
  nmap ,Sws :%s/ /_/g<C-M>
  vmap ,Sws :%s/ /_/g<C-M>
"
"     Sometimes you just want to *see* that trailing whitespace:
"     Stws = show trailing whitespace
  nmap ,Stws :%s/  *$/_/g<C-M>
  vmap ,Stws :%s/  *$/_/g<C-M>
"
" ===================================================================
" General Editing
" ===================================================================
"
"      ,cel = "clear empty lines"
"       - delete the *contents* of all lines which contain only whitespace.
"         note:  this does not uelete lines!
  map ,cel :%s/^\s\+$//
"      ,del = "delete 'empty' lines"
"       - delete all lines which contain only whitespace
"         note:  this does *not* delete empty lines!
  map ,del :g/^\s\+$/d
"
"      ,cqel = "clear quoted empty lines"
"       Clears (makes empty) all lines which start with '>'
"       and any amount of following spaces.
  nmap ,cqel :%s/^[>]\+$//
  vmap ,cqel  :s/^[><C-I> ]\+$//
"
"      ,ksr = "kill space runs"
"             substitutes runs of two or more space to a single space:
  nmap ,ksr :%s/  \+/ /g
  vmap ,ksr  :s/  \+/ /g
"
"    ,Sel = "squeeze empty lines"
"    Convert blocks of empty lines (not even whitespace included)
"    into *one* empty line (within current visual):
   map ,Sel :g/^$/,/./-j
"
"    ,Sbl = "squeeze blank lines"
"    Convert all blocks of blank lines (containing whitespace only)
"    into *one* empty line (within current visual):
   map ,Sbl :g/^\s*$/,/\S/-j
"
" ===================================================================
" Editing of email replies and Usenet followups - using autocommands
" ===================================================================
"
" set the textwidth to 72 characters for replies (email&usenet)
  au BufNewFile,BufRead .letter,mutt*,nn.*,snd.* set tw=72
"
" Part 3 - Change Quoting Level
   map ,dp vip:s/^> //<CR>
  vmap ,dp    :s/^> //<CR>
"
"      ,qp = "quote current inner paragraph"
"            select inner paragraph
"            then do the quoting as a substitution:
   map ,qp   vip:s/^/> /<CR>
"
"      ,qp = "quote current paragraph"
"            just do the quoting as a substitution:
  vmap ,qp    :s/^/> /<CR>

" Changing quote style to *the* true quote prefix string "> ":
"
"      ,kpq "kill power quote"
  vmap ,kpq :s/^> *[a-zA-Z]*>/> >/<C-M>
"
"       Fix various other quote characters:
"      ,fq "fix quoting"
  vmap ,fq :s/^> \([-":}\|][ <C-I>]\)/> > /
"
" Part 5 - Reformatting Text
"
" Formatting the current paragraph according to
" the current 'textwidth' with ^J (control-j):
  imap <C-J> <c-o>gqap
   map <C-J> gqap
"
"      ,j = join line in commented text
"           (can be used anywhere on the line)
" nmap ,j Jxx
  nmap ,j Vjgq
"
" ===================================================================
" Editing your reply
" ===================================================================
"
" Part 6  - Inserting Special or Standard Text
"
" Put parentheses around "visual text"
"      Used when commenting out an old subject.
"
"      ,) and ,( :
  vmap ,( v`<i(<ESC>`>a)<ESC>
  vmap ,) v`<i(<ESC>`>a)<ESC>
  vmap ," c""<left><C-R>"<ESC>
"
" remove signatures
"
"     ,kqs = kill quoted sig (to remove those damn sigs for replies)
"          goto end-of-buffer, search-backwards for a quoted sigdashes
"          line, ie "^> -- $", and delete unto end-of-paragraph:
" map ,kqs G?^> -- $<CR>d}
" map ,kqs G?^> *-- $<CR>dG
"     ,kqs = kill quoted sig unto start of own signature:
map ,kqs G?^> *-- $<CR>d/^-- $/<C-M>
"
"      ,aq = "add quote"
 nmap ,aq :r!fortune<CR><ESC>b

" Indent a C file.
nmap ,ci :w<CR>:!indent %<CR>:e!<CR>
"
" ===================================================================
" HTML
" ===================================================================
" This has become quite big - so I moved it out to another file:
  let FILE=expand("~/.vim/html.vim")
" The "expand" is necessary to evauluate "~".
  if filereadable(FILE)
     exe "source " . FILE
  endif
"
" ===================================================================
" Useful stuff. :-)
" ===================================================================
"
"     ,E = execute line
 map ,E 0/\$<CR>w"yy$:<C-R>y<C-A>r!<C-E>
" This command excutes a shell command from the current line and
" reads in its output into the buffer.  It assumes that the command
" starts with the fist word after the first '$' (the shell prompt
" of /bin/sh).  Try ",E" on that line, ie place the cursor on it
" and then press ",E":
" $ ls -la
"
"      ,dr = decode/encode rot13 text
  vmap ,dr :!tr A-Za-z N-ZA-Mn-za-m
"       Use this with an external "rot13" script:
"       "    ,13 - rot13 the visual text
"       vmap ,13 :!rot13<CR>
"
" Give the URL under the cursor to Netscape
 vmap ,net y:!gnome-moz-remote "<C-R>""<C-M>
"
" ===================================================================
" Mapping of special keys - arrow keys and function keys.
" ===================================================================
  map <F1> oD_ENTER(3);<ESC>
  map <F2> oD_RETURN_(3);<ESC>
  map <F3> oD_RETURN(3, );<ESC>hi
  map <F4> iD_RETURN(3, <ESC>$i)<ESC>
" Buffer commands (split,move,delete) -
" this makes a little more easy to deal with buffers.
  map <F5>  :split<C-M>
  map <F6>  :bp<C-M>
  map <F7>  :bn<C-M>
  map <F8> :bd<C-M>

" <Tab> is bound to `complete'
inoremap <Tab> 
"
" cycle fast thru buffers ...
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
"
" cycle fast thru errors ...
map <m-n> :cn<cr>
map <m-p> :cp<cr>
" ===================================================================
" AutoCommands
" ===================================================================
"
"
so $VIMRUNTIME/syntax/syntax.vim

augroup cprog
    au!
    "autocmd BufRead *      set formatoptions=trcql autoindent nocindent comments&
    autocmd FileType c,cpp set noautoindent cindent formatoptions=croql shiftwidth=4 softtabstop=4 textwidth=778 wrapmargin=3
    autocmd FileType c,cpp source ~/.vim/my_c_syntax.vim
    autocmd FileType c,cpp hi PreProc ctermfg=lightgrey
augroup END

augroup html
    au!
    autocmd FileType html set nocindent autoindent sw=2 ts=2 expandtab equalprg=tidy\ -quiet\ --show-warnings\ no makeprg=tidy\ -quiet\ -e\ % textwidth=700 errorformat=
            \%Eline\ %l\ column\ %c\ -\ Error:%m,
            \%Wline\ %l\ column\ %c\ -\ Warning:%m
augroup END

augroup wml
    au!
    autocmd BufRead *.wml set ft=html
augroup END
"
" ===================================================================
" TEMPORARY STUFF - TESTING THINGS
" ===================================================================
"
" Some simple example of the "expand modifiers":
" insert the current filename *with* path:
  iab _PATHFILE <C-R>=expand("%:p")<cr>
" insert the current filename *without* path:
  iab _FILE <C-R>=expand("%:t:r")<cr>
" insert the path of current file:
  iab _PATH <C-R>=expand("%:h")<cr>

" this will jump to the last edited buffer, if VIM is invoked W/O COMMANDS 
"autocmd VimEnter * nested if argc() == 0 && bufname ("%") == "" && bufname ("2" + 0) != "" | exe ("normal '0") | endif

" this means vim will always jump to the last edited line in a file if poss
autocmd BufEnter *,.* :normal '"

"source ~/.selectBuffer.vim
"source ~/.vim/bracket-macros.vim
"source ~/.vim/comment.vim
source ~/.vim/explorer.vim
source ~/.vim/bufexplorer.vim
"source ~/.vim/word_complete.vim
"source ~/.vim/my_syntax.vim
let mapleader = "`"
au Filetype html,xml source ~/.vim/scripts/wrapwithtag.vim

"
"       vim:tw=78 et sw=4 comments=\:\"
