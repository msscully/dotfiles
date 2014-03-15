" Manage plugins with pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Turns on filetype detection which we need for syntax highliting.
filetype on
filetype plugin on

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

" Ignore .pyc files
set wildignore+=*.pyc

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" For Solarized color scheme
syntax enable
set background=dark
colorscheme solarized

" Turn off autoindent when pasting.  Press F2 to turn off autoindent,
" paste, press F2 to turn it back on
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Auto-indent
filetype plugin indent on

" Setup the python libraries so from within vim you can hit 'gf' to 
" 'goto-file' on an import statement and it will open the source
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" turns on autocomplete for python but only works if vim was compiled with python bindings
"autocmd FileType python set omnifunc=pythoncomplete#Complete

" Changes the autocomplete to CTRL+SPACE instead of CTRL+X, CTRL+O
inoremap <Nul> <C-x><C-o>

" Make the autocomplete menu colors readable
highlight Pmenu ctermbg=238 gui=bold

" Allows us to work with MiniBufExplorer:www.vim.org/scripts/script.php?script_id=159
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Add mappings for TaskList :www.vim.org/scripts/script.php?script_id=2607
" If there are any tasks to process 'T' opens the tasklist and 'q' quits it
" again
map T :TaskList<CR>
map P :TlistToggle<CR>

" Switch between tabs with Shift-RightArrow and Shift-LeftArrow
map <S-Right> :bnext<CR>
map <S-Left> :bprevious<CR>

" Recognize .txx files as cpp files
au BufNewFile,BufRead *.txx set filetype=cpp

" Correctly indent cmake files
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt runtime! indent/cmake.vim

" Turn on code folding based on indentation level
set foldmethod=indent

" Space bar toggles fold state between closed and opened
" 
" If there is no fold at current line, just moves forward. 
" If it is present, reverse it's state. 
fun! ToggleFold() 
if foldlevel('.') == 0 
  normal! l 
else 
  if foldclosed('.') < 0 
    . foldclose 
  else 
    . foldopen 
  endif 
endif 
" Clear status line 
echo 
endfun 

" Map this function to Space key. 
noremap <space> :call ToggleFold()<CR>

" Map F3 to open a vertical split bash shell with conque shell:
" http://www.vim.org/scripts/script.php?script_id=2771
nnoremap <F3> :ConqueTermVSplit bash<CR>
nnoremap <F4> :ConqueTermSplit bash<CR>

" Map F5 to insert a date stamp
" To add time append " \%H:\%M:\%S"
" http://stackoverflow.com/questions/56052/best-way-to-insert-timestamp-in-vim
nnoremap <F5> :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<cr>

" Map F6 to list existing F# mappings
" http://stackoverflow.com/questions/6414690/detect-if-a-f-key-is-mapped-on-vim
:nnoremap <F6> :for i in range(1, 12) <bar> execute("verbose map <F".i.">") <bar> endfor<cr>

set backspace=indent,eol,start 

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Autocomplete settings for omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Correc the indentation for coffeescript to 2 spaces
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Compile coffee script files on write
au BufWritePost *.coffee silent CoffeeMake!

set ai
set ts=4
set sts=4
set et
set sw=4
set textwidth=79

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" XHTML (tab width 2 chr, no wrapping)
autocmd FileType xhtml set sw=2
autocmd FileType xhtml set ts=2
autocmd FileType xhtml set sts=2
autocmd FileType xhtml set textwidth=0
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2

" Disable backups when using vim to edit crontab to prevent 
" "crontab: temp file must be edited in place"
au FileType crontab set nobackup nowritebackup

" Set indent to 4 spaces for html
setlocal sw=4 sts=4 et
