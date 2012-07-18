" ===================================================================
" HTML - HTML - HTML - HTML - HTML - HTML - HTML - HTML
" ===================================================================
" ===================================================================
" HTML - Inserting "single" tags
" ===================================================================
"
  iab Ybr <br>
  iab Yhr <hr>
  iab Yp  <p>
"
" ===================================================================
" HTML - making environments
" ===================================================================
"
" HTML - make current word an HTML environment
  map ,me yiwi<<ESC>ea></<C-R>"><ESC>
"
" ===================================================================
" HTML - inserting environments
" ===================================================================
"
" Comment:
  iab  Ycom  <!--X--><ESC>FXs
  vmap ,com v`<i<!--<ESC>`>i--><ESC>
"
" ===================================================================
" HTML - changing the appearance/font of text
" ===================================================================
"
" BlockQuoted Text:
  iab  Ybl  <blockquote></blockquote><ESC>T>i
" vmap ,bl  "zdi<blockquote><C-R>z</blockquote><ESC>2F>
"
" Bold text:
  iab  Yb  <b></b><ESC>T>i
" vmap ,b  "zdi<b><C-R>z</b><ESC>2F>
  vmap ,b  c<b></b><C-O>F<<C-R>"<ESC>
"
" Centered Text:
  iab  Ycen <center></center><ESC>T>i
  vmap ,cen "zdi<center><C-M><C-R>z<C-M></center><ESC>T>i
"
" Code in Text:
  iab  Ycod <code></code><ESC>T>i
  vmap ,cod "zdi<code><C-M><C-R>z<C-M></code><C-M><ESC>T>i
"
" Italic Text:
  iab  Yi   <i></i><ESC>T>i
  vmap ,i   "zdi<i><C-R>z</i><ESC>T>
"
" Typewriter Type:
  iab  Ytt   <tt></tt><ESC>T>i
  vmap ,tt   "zdi<tt><C-R>z</tt><ESC>T>
"
" ===================================================================
" HTML - Preserving Text Structure
" ===================================================================
"
" Preserve Text Formatting *with*  interpretation of HTML:
  iab  Ypre <pre></pre><ESC>T>i
" vmap ,pre "zdi<pre><C-M><C-R>z</pre><C-M><ESC>T>
  vmap ,pre mz:<ESC>'<O<pre><ESC>'>o</pre><ESC>`z
"
" Preserve Text Formatting without interpretation of HTML:
"           Insert environment <xmp></xmp>
  iab  Yxmp <xmp></xmp><ESC>T>i
" vmap ,xmp "zdi<xmp><C-M><C-R>z<C-M></xmp><C-M><ESC>T>i
  vmap ,xmp mz:<ESC>'<O<xmp><ESC>'>o</xmp><ESC>`z
"
" ===================================================================
" HTML - Making Tables
" ===================================================================
"
" Table Data
  iab  Ytd  <td></td><ESC>T>i
  vmap ,td  "zdi<td><C-R>z</td><ESC>T>i
" Table Row
  iab  Ytr  <tr></tr><ESC>T>i
  vmap ,tr  "zdi<tr><C-R>z</tr><ESC>T>i
"
"
" ===================================================================
" HTML - Making Header Lines (h1 to h6)
" ===================================================================
"
  iab  Yh1 <h1></h1><ESC>T>i
  vmap ,h1 "zdi<h1><C-R>z</h1><ESC>2F>
  iab  Yh2 <h2></h2><ESC>T>i
  vmap ,h2 "zdi<h2><C-R>z</h2><ESC>2F>
  iab  Yh3 <h3></h3><ESC>T>i
  vmap ,h3 "zdi<h3><C-R>z</h3><ESC>2F>
  iab  Yh4 <h4></h4><ESC>T>i
  vmap ,h4 "zdi<h4><C-R>z</h4><ESC>2F>
  iab  Yh5 <h5></h5><ESC>T>i
  vmap ,h5 "zdi<h5><C-R>z</h5><ESC>2F>
  iab  Yh6 <h6></h6><ESC>T>i
  vmap ,h6 "zdi<h6><C-R>z</h6><ESC>2F>
"
" ===================================================================
" HTML - Making Lists and List Items
" ===================================================================
"
"           Insert "ordered list" with one list element
  iab Yol <ol><CR><li><CR></ol><ESC>k
"           Insert "unordered list" with one list element
  iab Yul <ul><CR><li><CR></ul><ESC>k
"           Insert "decsription list" with one list element
" iab Ydl <dl><CR><dt><CR><dd><CR><p><CR></dl><CR><ESC>4kA
  iab Ydl <dl><CR><CR><dt><CR><dd><CR><p><CR><CR></dl><CR><ESC>5kA
"
" Insert "list" item (for both ordered and unordered list)
  iab Yli <li>
" Insert "description list" item
  iab Ydt <dt><CR><dd><CR><p><CR><ESC>kA
  iab Ydp <dt><CR><dd><C-M><p><C-M><ESC>kkkA
"
" ===================================================================
" HTML - Making Links
" ===================================================================
"
"
"     A HREF (HTML 2.0)
  iab  Yhref <a href=""></a><ESC>?""<CR>a
  vmap ,href "zdi<a href=""><C-R>z</a><ESC>F"i
  iab  Ylink <a href=""></a><ESC>?""<CR>a
  vmap ,link "zdi<a href="<C-R>z"<C-M><C-I>><C-R>z</a><ESC>F"i
"
"     A NAME (HTML-2.0)
  iab  Yname <a name=""></a><ESC>?""<CR>a
  vmap ,name "zdi<a name="<C-R>z"<C-M><C-I>><C-R>z</a><ESC>2F>
"
"            Insert/make link to image
  iab  Yimg  <img alt="[]"<C-M>   align=<C-M>     src=""></a><ESC>?""<CR>a
"
