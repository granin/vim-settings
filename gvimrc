" -----------------------------------------------------------------------------
" | VIM Settings |
" | GUI stuff |
" -----------------------------------------------------------------------------


" OS Specific *****************************************************************
if has("gui_macvim")

  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  set fu
  "set guifont=Monaco:h11            " Font family and font size.
  "set antialias                     " MacVim: smooth fonts.
  set encoding=utf-8                " Use UTF-8 everywhere.
  set guioptions-=T                 " Hide toolbar.
  set lines=85 columns=280          " Window dimensions.
  "set transparency=3
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  "map <D-t> <Plug>PeepOpen

elseif has("gui_gtk2")

  "set guifont=Courier\ 10\ pitch
  set guioptions-=T " remove toolbar

elseif has("x11")
elseif has("gui_win32")
end

" General *********************************************************************
set anti " Antialias font

"set transparency=0

" Default size of window
set columns=120
set lines=45

" Tab headings
set gtl=%t gtt=%F



" Uncomment to use.
set guioptions-=r                 " Don't show right scrollbar

colorscheme solarized
"to have a different background in GUI and terminal modes, use the following if-then. However, I find vim's background autodetection to be pretty good and, at least with MacVim, I can leave this background value assignment out entirely and get the same results.
if has('gui_running')
    set background=light
else
    set background=dark
endif


