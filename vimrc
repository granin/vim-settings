
set nocompatible               " be iMproved
filetype off                   " required!
set foldcolumn=1


" -----------------------------------------------------------------------------
" | VIM Settings |
" | (see gvimrc for gui vim settings) |
" -----------------------------------------------------------------------------
 "--VUNDLE----------------------------------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

" My Bundles here:
"
" original repos on github
Bundle 'granin/soywiki'                            
Bundle 'bkad/CamelCaseMotion'                      
Bundle 'shemerey/vim-project'                      
Bundle 'tpope/vim-pathogen'                        
Bundle 'vim-scripts/netrw.vim'                     
Bundle 'tsaleh/vim-align'                          
Bundle 'vim-scripts/vimwiki.git'                   
Bundle 'vim-scripts/ZoomWin'                       
Bundle 'vim-scripts/Color-Sampler-Pack'            
Bundle 'hallettj/jslint.vim'                       
Bundle 'robgleeson/hammer.vim'                     
Bundle 'jcf/rvm_ruby.vim'                          
Bundle 'vim-scripts/MailApp'                       
Bundle 'vim-scripts/ScrollColors'                  
Bundle 'vim-scripts/translit_converter'            
Bundle 'tpope/vim-ragtag'                          
Bundle 'slack/vim-bufexplorer'                     
Bundle 'altercation/vim-colors-solarized'          
Bundle 'kchmck/vim-coffee-script'                  
Bundle 'Lokaltog/vim-easymotion'                   
Bundle 'mattn/gist-vim'                            
Bundle 'itspriddle/vim-jquery'                     
Bundle 'michaeljsmith/vim-indent-object'           
Bundle 'tpope/vim-pastie'                          
Bundle 'gerardc/vim-padrino'                       
Bundle 'tpope/vim-repeat'                          
Bundle 'tpope/vim-speeddating'                     
Bundle 'tpope/vim-markdown'                        
Bundle 'cakebaker/scss-syntax.vim'                 
Bundle 'sophacles/vim-outliner'                    
Bundle 'bbommarito/vim-slim'                       
Bundle 'tpope/vim-rails'                           
Bundle 'tpope/vim-cucumber'                        
Bundle 'tpope/vim-haml'                            
Bundle 'scrooloose/nerdtree'                       
Bundle 'mileszs/ack.vim'                           
Bundle 'godlygeek/tabular'                         
Bundle 'tpope/vim-fugitive'                        
Bundle 'srushti/snipmate.vim'                      
Bundle 'scrooloose/nerdcommenter'                  
Bundle 'duff/vim-bufonly'                          
Bundle 'tpope/vim-endwise'                         
Bundle 'tpope/vim-surround'                        
Bundle 'csexton/rvm.vim'                           
Bundle 'tpope/vim-unimpaired'                      
Bundle 'tpope/vim-rake'                            
Bundle 'chrismetcalf/vim-yankring'                 
Bundle 'pangloss/vim-javascript'                   
Bundle 'Townk/vim-autoclose'                       
Bundle 'ecomba/vim-ruby-refactoring'               
Bundle 'nelstrom/gundo.vim'                        
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
 "------------------------------------------------------------------------

                                  
let mapleader = ","
set wildmenu
set wildmode=list:longest,full
set autowriteall
               
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

if has('autocmd')
  autocmd FileType html let g:html_indent_strict=1
  autocmd BufNewFile,BufRead Gemfile setfiletype ruby
  autocmd BufNewFile,BufRead *.j setfiletype objc
  autocmd BufWritePre *.rb,*.py,*.js :call <SID>StripTrailingWhitespaces()
endif

set nocompatible

set keymap=russian-jcuken
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
                                 
" Shortcuts********************************************************************
nmap <silent> <leader>i 1z=
"nmap <silent> <unique> <C-S-Down> :A<CR>
"dashed line above current
nmap <silent> <leader>= O<ESC><down>o========================================================================<CR><CR><ESC>
nmap <silent> <leader>- O<ESC><down>o------------------------------------------------------------------------<CR><CR><ESC>

nmap <silent> <unique> <leader>s :w<CR>
nmap <silent> <unique> <leader>q :wa<CR>:qa<CR>
nmap <silent> <unique> <leader>Z "*x
nmap <silent> <unique> <leader>P "*p
nmap <silent> <unique> <Space> <PageDown>
nmap <silent> <unique> <S-Space> <PageUp>
nmap <silent> <unique> <C-S-Left> <C-o>
nmap <silent> <unique> <C-S-Right> <C-i>
" Work with vim-projects
nmap <silent> <leader>J <Plug>ToggleProject

"variable %% for all commands below
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
nmap <unique> <leader>aw :e %%

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
nmap <unique> <leader>at :tabe %%
nmap <unique> <leader>as :sp %%
nmap <unique> <leader>av :vsp %%

" cd to the directory containing the file in the buffer
nmap <unique> <leader>ac :lcd %:h
" cd to the ~/txt directory 
nmap <unique> <leader>ar :lcd ~/txt

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist     
nmap <unique> <leader>am :!mkdir -p %:p:h

" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

" Files, backups and undo******************************************************
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
  if MySys() == "windows"
    set undodir=C:\Windows\Temp
  else
    set undodir=~expand('$HOME/.vim/tmp')
  endif

  set undofile
catch
endtry

" Whitespace stuff
" make uses real tabs   
au FileType make set noexpandtab

syntax match Tab /\t/
set nowrap
function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

if hostname() == "Misha-Granins-MacBook-Air.local"
  call Tabstyle_tabs()
else
  call Tabstyle_spaces()
endif

" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent  (local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4

" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
:noremap -V :vsp^M^W^W<cr>
":noremap -n :split^M^W^W<cr>"no nerd - works by default

" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn

" Searching *******************************************************************
set hlsearch " highlight search
set incsearch " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase

" Colors **********************************************************************
"set t_Co=256 " 256 colors
syntax on " syntax highlighting
"colorscheme camouflage

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}\ %{exists('g:loaded_rvm')?rvm#statusline():''}%=\ %l:%c%V\ %L\ %P
set laststatus=2

" Line Wrapping ***************************************************************
"http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
"When editing a text file, if you want word wrapping, but only want line breaks inserted when you explicitly press the Enter key: 
"set wrap  " попросим Vim переносить длинные строки
set nolist  " list disables linebreak
"set linebreak " Wrap at word
set showbreak=…
"
"In addition, you will need to prevent Vim from automatically inserting line breaks in newly entered text. The easiest way to do this is: 

:set textwidth=0
:set wrapmargin=0

"If you want to keep your existing 'textwidth' settings for most lines in your file, but not have Vim automatically reformat when typing on existing lines, you can do this with: A

:set formatoptions+=l

" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @

" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h

" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype

autocmd FileType html :set filetype=xhtml " we couldn't care less about html


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how

" подсвечивать некоторые символы
" Set list Chars - for showing characters that are not
" normally displayed i.e. whitespace, tabs, EOL
nmap <unique><leader>K :set list!<CR>
" установим символы для подсветки
if has("unix")
    set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
else
    set listchars=tab:+-,trail:?,extends:>,precedes:<,nbsp:?
endif
"Показываем табы в начале строки точками
set listchars=tab:▸\ ,eol:¬
"set listchars=tab:··

" Mouse ***********************************************************************
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
"behave xterm
"set selectmode=mouse

" Ruby stuff ******************************************************************
compiler ruby " Enable compiler support for ruby
map <F5> :!ruby %<CR>

" Omni Completion *************************************************************
if has('autocmd')
  autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " may require ruby compiled in
endif

" -----------------------------------------------------------------------------
" | Plugins |
" -----------------------------------------------------------------------------

" NERDTree ********************************************************************
nmap <silent> <unique> <leader>U :NERDTreeToggle<CR>
nmap <silent> <unique> <leader>/ :NERDTreeFind<CR>

" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1

" Single click for everything
let NERDTreeMouseMode=1

" Ignoring java class files
let NERDTreeIgnore=['.class$', '\.rbc$', '\~$']

" fuzzyfinder_textmate ********************************************************
nmap <silent> <leader>R :FufFile<CR>
nmap <silent> <leader>L :FufBuffer<CR>
let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" Rails.vim shortcuts ********************************************************
"nmap <silent> <unique> <leader>s :.Rake<CR>
"nmap <silent> <unique> <leader>S :Rake<CR>
"nmap <silent> <unique> <leader>- :Rake -<CR>

" yankring*********************************************************************
let g:yankring_history_dir = expand('$HOME/.vim/tmp')

" Command-T *******************************************************************
let g:CommandTMatchWindowAtTop = 1
set wildignore+=*~,.DS_Store,*.class,*.gif,*.png,*.sqlite3,*.o,*.obj,.git,*.rbc
nmap <silent> <Leader>r :CommandT<CR>
nmap <silent> <Leader>I :CommandTBuffer<CR>

" Gundo ***********************************************************************
nmap <silent> <unique> <leader>u :GundoToggle<CR>

" autocomplpop ****************************************************************
" complete option
" settings for completion 
" like
set complete=.,w,b,t
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

" -----------------------------------------------------------------------------
" | OS Specific |
" | (GUI stuff goes in gvimrc) |
" -----------------------------------------------------------------------------

" Mac *************************************************************************
if has("mac")
  nmap <silent> <D-Left> <C-o>
  nmap <silent> <D-Right> <C-i>
endif

" Windows *********************************************************************
"if has("gui_win32")
""
"endif

" -----------------------------------------------------------------------------
" | Startup |
" -----------------------------------------------------------------------------
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l 

filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

set hid

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

syntax enable

filetype plugin on
set ofu=syntaxcomplete#Complete

"====================================
"====================================
"====================================
"call pathogen#runtime_append_all_bundles()
"bufferexplorer plugin
" let g:bufExplorerShowRelativePath=1
"
"
"====================================
"====================================
"====================================
" отключить автоматическое открытие новой строки комментария
" set formatoptions-=o

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
" MacVIM shift+arrow-keys behavior (required in .vimrc)
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif
 
 
" сохранять умные резервные копии ежедневно
function! BackupDir()
    " определим каталог для сохранения резервной копии
    let l:backupdir=$HOME.'/.vim/backup/'.
            \substitute(expand('%:p:h'), '^'.$HOME, '~', '')
 
    " если каталог не существует, создадим его рекурсивно
    if !isdirectory(l:backupdir)
        call mkdir(l:backupdir, 'p', 0700)
    endif
 
    " переопределим каталог для резервных копий
    let &backupdir=l:backupdir
 
    " переопределим расширение файла резервной копии
    let &backupext=strftime('~%Y-%m-%d~')
endfunction
 
" выполним перед записью буффера на диск
autocmd! bufwritepre * call BackupDir()
 
 
" хранить больше истории команд ...
set history=128     " keep 50 lines of command line history
 
" ... и правок
set undolevels=2048
 
" меньше приоритета бинарным файлам при автодополнении
set suffixes+=.png,.gif,.jpg,.jpeg,.ico
 
" информация о положении курсора в строке статуса
"set statusline+=%=Col:%3*%03c%*\ Ln:%3*%04l/%04L%*
" информация о типе и атрибутах файла в строке статуса
"set statusline+=%(\ File:%3*%{join(filter([&filetype,&fileformat!=split(&fileformats,\",\")[0]?&fileformat:\"\",&fileencoding!=split(&fileencodings,\",\")[0]?&fileencoding:\"\"],\"!empty(v:val)\"),\"/\")}%*%)
" показывать имя буфера в заголовке терминала
set title
" формат заголовка
set titlestring=%t%(\ %m%)%(\ %r%)%(\ %h%)%(\ %w%)%(\ (%{expand(\"%:p:~:h\")})%)\ -\ VIM

" удалять лишние пробелы при отступе
set shiftround
 
" не менять позицию курсора при прыжках по буферу
set nostartofline
 
" расстояние до края при вертикальной прокрутке
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8
 
" размер прыжка при вертикальной прокрутке
set scrolljump=10 
" расстояние до края при горизонтальной прокрутке
"set sidescrolloff=3
 
" размер прыжка при горизонтальной прокрутке
set sidescroll=10
 
" разбивать окно горизонтально снизу
"set splitbelow
 
" разбивать окно вертикально справа
"set splitright
 
" не выравнивать размеры окон при закрытии
"set noequalalways
 
" не вставлять лишних пробелов при объединении строк
set nojoinspaces
" показывать совпадающие скобки для HTML-тегов
set matchpairs+=<:>
 
" сделать строку команд больше
set cmdheight=2
 
" сделать окно команд больше
set cmdwinheight=16
 
" показывать строку вкладок всегда
set showtabline=2
 
" показывать строку статуса всегда
" tell Vim to always put a status line in, even if there is only one
" window
"set laststatus=2
 
" информация о флагах файла и его пути в строке статуса
"set statusline=%1*%m%*%2*%r%*%3*%h%w%*%{expand(\"%:p:~\")}\ %<
 
"Порядок применения кодировок и формата файлов
 
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866


" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make command line two lines high
set ch=1

" set visual bell -- I hate that damned beeping
" убираем звук переключения раскладки
set vb

" allow backspacing over everything in insert mode
" Allow backspacing over indent, eol, and the start of an insert
set backspace=2 "set backspace=indent,eol,start

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions=ces$

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" Hide the mouse pointer while typing
set mousehide

" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=ac
"BASIC
"=====================
" http://www.derekwyatt.org/vim/the-vimrc-file/the-absolute-bare-minimum/
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Forget being compatible with good ol' vi
set nocompatible
" MISC
"=====================
"http://www.derekwyatt.org/vim/the-vimrc-file/better-settings/
" Set the search scan to wrap around the file
set wrapscan

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

"Mac OS X clipboard sharing
set clipboard=unnamed

"================
"================
" Get that filetype stuff happening
" load the plugin and indent settings for the detected filetype 
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" не выгружать скрытые буферы
set hidden
"
" Don't update the display while executing macros
set lazyredraw
"set lz " ленивая перерисовка экрана при выполнении скриптов


" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu
"================
 
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
"
 
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
 let g:PreviewBrowsers=' firefox,safari,epiphany,google-chrome,opera' 
 let g:PreviewCSSPath='/path/to/css/file'
 let g:PreviewTextileExt='textile,txt'

"================
" Searching
set incsearch
set smartcase
"Далее настроим поиск и подсветку результатов поиска и совпадения скобок
set showmatch 
set hlsearch
set ignorecase
set smartcase " Vim ищет игнорируя регистр если искомое выражение не содержит большие буквы, в противном случае учитывает регистр.
"
" Incrementally match the search.  I orignally hated this
" but someone forced me to live with it for a while and told
" me that I would grow to love it after getting used to it...
" turns out he was right :)
set incsearch



"================
set ai " включим автоотступы для новых строк
" перечитывать изменённые файлы автоматически
set autoread
if has("unix")
 
    " кодировка по-умолчанию
    set encoding=utf-8
 
endif
 
" порядок перебора кодировок
set fileencodings=utf-8,windows-1251,iso-8859-15,koi8-r
 
" порядок перебора типов EOL
set fileformats=unix,dos,mac
 
" максимальное число вкладок
set tabpagemax=99
 
 
if has("folding")
 
    " сворачивать по отступам
    set foldmethod=indent
 
    " не сворачивать рекурсивно
    set foldlevel=99
endif
" Set region to British English
" и русский
:setlocal spell spelllang=ru,en_us
"
"
" хранить swap в отдельном каталоге
set directory=~/.vim/swap/
" включить сохранение резервных копий
set backup
"backup system 
" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"=========================================
"=====VISUAL APEARANCE====================
"=========================================
" Underlining search results in vim (instead of highlighting them)
hi Tab gui=underline guifg=blue ctermbg=blue 

"no extension files are what?
"au BufNewFile,BufRead * if &ft == '' | set ft=markdown | endif

" Default color scheme
"color solarized

" --- подсветка ---
 
" подсветка строки статуса
highlight user1 term=bold cterm=inverse,bold ctermbg=green gui=inverse,bold guibg=#8AE234
highlight user2 term=bold cterm=inverse,bold ctermbg=red gui=inverse,bold guibg=#EF2929
highlight user3 term=bold cterm=inverse,bold ctermbg=blue gui=inverse,bold guibg=#729FCF
" подсветка непечатаемых символов
highlight specialkey ctermfg=lightgray guifg=#D3D7CF
highlight nontext ctermfg=gray guifg=#D3D7CF
 
" подсветка вкладок
highlight tabline term=none cterm=none ctermbg=lightgray gui=none guibg=#D3D7CF
highlight tablinefill term=none cterm=none ctermbg=lightgray gui=none guibg=#D3D7CF
 

" --- аббревиатуры ---
 
" дизайнерская рыба
inoreabbrev lorem Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.<C-O>:call EatChar()<CR>
" autocorrection 
iab gh. GitHub
iab verr version
iab winn windows
iab US United States
iab seva Seva
iab sadhana Sadhana
iab satsang Satsang
"REMAPS
"==========================================
let mapleader = ","
let maplocalleader = ","
"RagTag
 "=====================
        inoremap <M-o>       <Esc>o
        inoremap <C-j>       <Down>
        let g:ragtag_global_maps = 1
"==========================================
"  Markdown to HTML
nmap <leader>G :%!/usr/local/bin/Markdown.pl --html4tags <cr>

"Color change
map <silent><leader>c :NEXTCOLOR<cr>
map <silent><leader>C :PREVCOLOR<cr><ESC>
"WINDOWS
"=========================================
"http://www.derekwyatt.org/vim/the-vimrc-file/walking-around-your-windows/

noremap <silent> - <C-W>
nmap <silent> <unique> <leader><leader> :wincmd w<cr>

" Close the window below this one
noremap <silent> +J :wincmd j<cr>:close<cr>

" Close the window above this one
noremap <silent> +K :wincmd k<cr>:close<cr>

" Close the window to the left of this one
noremap <silent> +H :wincmd h<cr>:close<cr>

" Close the window to the right of this one
noremap <silent> +L :wincmd l<cr>:close<cr>

"=========================================
"EDIT / SOURCES FILES
map ,v :vsp ~/.vimrc<CR>

autocmd! bufwritepost $VIM/.vimrc source $VIM/.vimrc
" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
"nmap <silent> ,sv :so $MYVIMRC<cr>
map ,V :source $MYVIMRC<CR>
autocmd! bufwritepost $VIM/.vimrc source $VIM/.vimrc

"TOGGLES
"=====================
"http://www.derekwyatt.org/vim/the-vimrc-file/toggling-and-shortening/

" Turn off that stupid highlight search
nmap  <silent> <leader>z  :set invhlsearch
" Set text wrapping toggles
nmap  ,] :set invwrap:set wrap?
" Set up retabbing on a source file
"nmap  ,rr :1,$retab

" ZoomWin configuration
"map <Leader><Leader> :ZoomWin<CR>
map -- :ZoomWin<CR>

" CTags
"map <Leader>rt :!ctags --extra=+f -R *<CR><CR>


" Inserts the path of the currently edited file into a command
"zsh:1: command not found: m
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Toggle spell checking on and off with `,y`
nmap <silent> <leader>S :set spell!<CR>
 
" исправить отступы при вставке из внешнего буфера
"nnoremap <silent>,p u:set paste<CR>.:set nopaste<CR>:echo "pasted text fixed"<CR>
 
" сохранять выделение при визуальном изменении отступа
vnoremap < <gv
vnoremap > >gv
 
" более логичное копирование во внутренний буфер
nnoremap Y y<END>

" более логичная запись макроса
nnoremap Q qq

" поиск слова под курсором не целиком
nnoremap * g*N
nnoremap # g#N
 
" не перепрыгивать через длинные строки при включённом переносе строк
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <DOWN> gj
nnoremap <UP> gk
vnoremap <DOWN> gj
vnoremap <UP> gk
inoremap <DOWN> <C-O>gj
inoremap <UP> <C-O>gk
 
" сохранять строку курсора при page up/down
nnoremap <PAGEUP> <C-U>
nnoremap <PAGEDOWN> <C-D>
inoremap <PAGEUP> <C-O><C-U>
inoremap <PAGEDOWN> <C-O><C-D>
vnoremap <PAGEUP> <C-U>
vnoremap <PAGEDOWN> <C-D>
 
" Insert New Line **************************************************************
"Insert newline without entering insert mode
"map <S-Enter> O<ESC> 
map <S-Enter> i
map <S-M-Enter> o<Esc>
map <M-Enter> O<Esc>
"nnoremap <C-I> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>

set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)
"(Shift)Enter to toggle INSERT
function! ToggleEnterMapping()
  if empty(mapcheck('<CR>', 'i'))
    inoremap <CR> <Esc>`^
    return "\<Esc>"
  else
    iunmap <CR>
    return "\<CR>"
  endif
endfunction
call ToggleEnterMapping()



inoremap <expr> <S-CR> ToggleEnterMapping()
" Optional (so <CR> cancels prefix, selection, operator).
nnoremap <CR> <Esc>
vnoremap <CR> <Esc>gV
onoremap <CR> <Esc>
 

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"пробелом перехд из normal в insert mode
":nm <Space> i


" CoffeeScript**************************************************************
"Disable trailing whitespace error highlighting
"If having trailing whitespace highlighted as an error is a bit much, the following line can be added to your ~/.vimrc to disable it:

let coffee_no_trailing_space_error = 1

"Disable trailing semicolon error highlighting
"Likewise for the highlighting of trailing semicolons:

let coffee_no_trailing_semicolon_error = 1

"Disable future/reserved words error highlighting
"The same for reserved words:

let coffee_no_reserved_words_error = 1

"js check
cabbr js !js ~/bin/js/runjslint.js "`cat %`" \| ~/bin/python/format_lint_output.py
" Additional  my additions to vimrc  ****************************
so ~/txt/personal/myStuff.txt			
 "------------------------------------------------------------------------
"experimental try to switch off camel case syntax. 
syn match NoSpell /\u\l\+\%(\u\l\+\)\+/ contains=@NoSpell
syn match CamelCase "\<\%(\u\l*\)\{2,}\>" contains=@NoSpell
syn match CamelCase2 transparent "\<\%(\u\l*\)\{2,}\>" contains=@NoSpell contained
au Syntax * syn match CamelCase "\<\%(\u\l*\)\{2,}\>" transparent containedin=.*Comment.* contains=@NoSpell contained

 "-------CAMELCASE MOTION-------------------------------------------------
   
"EXAMPLE: Replace the default|w|,|b| and|e| mappings instead of defining additional mappings|,w|,|,b| and|,e|: >
    map <silent> w <Plug>CamelCaseMotion_w
    map <silent> b <Plug>CamelCaseMotion_b
    map <silent> e <Plug>CamelCaseMotion_e
    sunmap w
    sunmap b
    sunmap e

"EXAMPLE: Replace default|iw|text-object and define|ib|and |ie|motions: >
    omap <silent> iw <Plug>CamelCaseMotion_iw
    xmap <silent> iw <Plug>CamelCaseMotion_iw
    omap <silent> ib <Plug>CamelCaseMotion_ib
    xmap <silent> ib <Plug>CamelCaseMotion_ib
    omap <silent> ie <Plug>CamelCaseMotion_ie
    xmap <silent> ie <Plug>CamelCaseMotion_ie

:cd ~/txt

