" Miguel Martinez Chapa .vimrc

" Section: Vundle {{{1
"--------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ap/vim-css-color'
Plugin 'ap/vim-buftabline'
Plugin 'fatih/vim-go'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



" Section: Key mappings {{{1
"--------------------------------------------------------------------------

nmap \o :set paste!<CR>:set paste?<CR>
nmap \l :setlocal number!<CR>

nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

nmap \Y :vertical resize 40<CR>:wincmd l<CR>
nmap \y :exec "vertical resize " . (80 + (&number * &numberwidth))<CR>:wincmd l<CR>

" Move between open buffers.
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

" Why not use the space or return keys to toggle folds?
nnoremap <space> za
nnoremap <CR> za
vnoremap <space> zf

" Window movement shortcuts from Mark
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
"nmap <C-p> :bprev<CR>
"nmap <C-p> :CtrlPBuffer<CR>
nmap \e :NERDTreeToggle<CR>

" Section: Hacks {{{1
"--------------------------------------------------------------------------

let g:Powerline_symbols="fancy"

noremap j gj
noremap k gk
" having Ex mode start or showing me the command history
" is a complete pain in the ass if i mistype
map Q <silent>
map q: <silent>
map K <silent>
"map q <silent>

" ctrlp.vim
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_c_checkers = ['make']


" Make the cursor stay on the same line when window switching {{{2
function! KeepCurrentLine(motion)
let theLine = line('.')
let theCol = col('.')
exec 'wincmd ' . a:motion
if &diff
call cursor(theLine, theCol)
endif
endfunction
nnoremap <C-w>h :call KeepCurrentLine('h')<CR>
nnoremap <C-w>l :call KeepCurrentLine('l')<CR>



" Section: Vim options {{{1
"--------------------------------------------------------------------------

set autoindent " Carry over indenting from previous line
set autoread " Don't bother me hen a file changes
set autowrite " Write on :next/:prev/^Z
set backspace=indent,eol,start
" Allow backspace beyond insertion point
set cindent " Automatic program indenting
set cinkeys-=0# " Comments don't fiddle with indenting
set cino=(0 " Indent newlines after opening parenthesis
set commentstring=\ \ #%s " When folds are created, add them to this
set copyindent " Make autoindent use the same chars as prev line
set directory-=. " Don't store temp files in cwd
set encoding=utf8 " UTF-8 by default
set expandtab " No tabs
set fileformats=unix,dos,mac " Prefer Unix
" Unicode chars for diffs/folds, and rely on
" Colors for window borders
silent! set foldmethod=marker " Use braces by default
set formatoptions=tcqn1 " t - autowrap normal text
" c - autowrap comments
" q - gq formats comments
" n - autowrap lists
" 1 - break _before_ single-letter words
" 2 - use indenting from 2nd line of para
set hidden " Don't prompt to save hidden windows until exit
set history=200 " How many lines of history to save
set hlsearch " Hilight searching
set ignorecase " Case insensitive
set incsearch " Search as you type
set infercase " Completion recognizes capitalization
set laststatus=2 " Always show the status bar
set linebreak " Break long lines by word, not char
" Unicode characters for various things
set matchtime=2 " Tenths of second to hilight matching paren
set modelines=5 " How many lines of head & tail to look for ml's
silent! set mouse=nvc " Use the mouse, but not in insert mode
set nobackup " No backups left after done editing
set nonumber " No line numbers to start
set visualbell t_vb= " No flashing or beeping at all
set nowritebackup " No backups made while editing
set printoptions=paper:letter " US paper
set ruler " Show row/col and percentage
set scroll=4 " Number of lines to scroll with ^U/^D
set scrolloff=15 " Keep cursor away from this many chars top/bot
set shiftround " Shift to certain columns, not just n spaces
set shiftwidth=2 " Number of spaces to shift for autoindent or >,<
set shortmess+=A " Don't bother me when a swapfile exists
set showbreak= " Show for lines that have been wrapped, like Emacs
set showmatch " Hilight matching braces/parens/etc.
set sidescrolloff=3 " Keep cursor away from this many chars left/right
set smartcase " Lets you search for ALL CAPS
set softtabstop=2 " Spaces 'feel' like tabs
set suffixes+=.pyc " Ignore these files when tab-completing
set tabstop=2 " The One True Tab
set notitle " Don't set the title of the Vim window
set wildmenu " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules " Ignore certain files in tab-completion

" Section: Commands & Functions {{{1
"--------------------------------------------------------------------------
" i always, ALWAYS hit ":W" instead of ":w"
command! Q q
command! W w

" http://stackoverflow.com/questions/1005/getting-root-permissions-on-a-file-inside-of-vi
cmap w!! w !sudo tee >/dev/null %

" trim spaces at EOL
command! TEOL %s/ \+$//
command! CLEAN retab | TEOL

" hightlight more than 80 characters
function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    exec 'match RightMargin /\%<' . (&textwidth + 4) . 'v.\%>' . (&textwidth + 2) . 'v/'
  endif
endfunction

" Rename.vim  -  Rename a buffer within Vim and on the disk
" Copyright June 2007 by Christian J. Robinson <infynity@onewest.net>
" Distributed under the terms of the Vim license.  See ":help license".
" http://www.infynity.spodzone.com/vim/Rename.vim
" Usage: :Rename[!] {newname}
command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")
function! Rename(name, bang)
    let l:curfile = expand("%:p")
    let v:errmsg = ""
    silent! exe "saveas" . a:bang . " " . a:name
    if v:errmsg =~# '^$\|^E329'
        if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
            silent exe "bwipe! " . l:curfile
            if delete(l:curfile)
                echoerr "Could not delete " . l:curfile
            endif
        endif
    else
        echoerr v:errmsg
    endif
endfunction

" Section: Color and syntax {{{1
"--------------------------------------------------------------------------
syntax on
set t_Co=256
colorscheme zenburn
highlight Normal ctermbg=234
highlight CursorLine ctermbg=236
let g:zenburn_high_Contrast = 1

" window splits & ruler were too bright - change to white on grey
" (shouldn't change GUI or non-color term appearance)
highlight StatusLine cterm=NONE ctermbg=blue ctermfg=white
highlight StatusLineNC cterm=NONE ctermbg=black ctermfg=white
highlight VertSplit cterm=NONE ctermbg=black ctermfg=white

" unfortunately, taglist.vim's filenames is linked to LineNr, which sucks
highlight def link MyTagListFileName Statement
highlight def link MyTagListTagName Question

" turn off coloring for CDATA
highlight def link xmlCdata NONE

" custom incorrect spelling colors
highlight SpellBad term=underline cterm=underline ctermbg=NONE ctermfg=red
highlight SpellCap term=underline cterm=underline ctermbg=NONE ctermfg=blue
highlight SpellRare term=underline cterm=underline ctermbg=NONE ctermfg=magenta
highlight SpellLocal term=underline cterm=underline ctermbg=NONE ctermfg=cyan

" ignore should be... ignored
highlight Ignore cterm=bold ctermfg=black
highlight clear FoldColumn
highlight def link FoldColumn Ignore
highlight clear Folded
highlight link Folded Ignore
highlight clear LineNr
highlight! def link LineNr Ignore

" nice-looking hilight if I remember to set my terminal colors
highlight clear Search
highlight Search term=NONE cterm=NONE ctermfg=white ctermbg=black

" make hilighted matching parents less offensive
highlight clear MatchParen
highlight link MatchParen Search

" colors for NERD_tree
highlight def link NERDTreeRO NERDTreeFile

" make trailing spaces visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" make menu selections visible
highlight PmenuSel ctermfg=black ctermbg=magenta

" the sign column slows down remote terminals
highlight clear SignColumn
highlight link SignColumn Ignore

" Markdown could be more fruit salady.
highlight link markdownH1 PreProc
highlight link markdownH2 PreProc
highlight link markdownLink Character
highlight link markdownBold String
highlight link markdownItalic Statement
highlight link markdownCode Delimiter
highlight link markdownCodeBlock Delimiter
highlight link markdownListMarker Todo

hi Visual term=reverse cterm=reverse guibg=Grey

