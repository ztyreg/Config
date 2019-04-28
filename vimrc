""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" learn the vimscript the hard way
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" 1 Echoing Messages
""""""""""""""""""""""""""""""
echo $PWD
echo "(>^.^<)"
""""""""""""""""""""""""""""""
" 2 Setting Options
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" 3 Basic Mapping
""""""""""""""""""""""""""""""
" Comments do not work after the map
" move one line up/down
noremap <space> viw
noremap - ddp
noremap _ kddpk
""""""""""""""""""""""""""""""
" 4 Modal Mapping
""""""""""""""""""""""""""""""
" convert to uppercase
inoremap <LocalLeader>u <esc>viwU
" nmap <LocalLeader>u viwU
""""""""""""""""""""""""""""""
" 5 Strict Mapping
""""""""""""""""""""""""""""""
" The danger of recursing
""""""""""""""""""""""""""""""
" 6 Leaders
""""""""""""""""""""""""""""""







































""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2015 Mar 24
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

set nrformats=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'oplatek/Conque-Shell'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rails'
Plug 'tmhedberg/matchit'
Plug 'vim-scripts/surround.vim'
Plug 'tpope/vim-bundler'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-abolish'
Plug 'mileszs/ack.vim'
Plug 'lervag/vimtex'
Plug 'vim-scripts/CycleColor'
"Plug 'vhda/verilog_systemverilog.vim'
Plug 'vim-scripts/vim-xdc-syntax'
Plug 'vim-scripts/ucf.vim'
"Plug 'harenome/vim-mipssyntax'
Plug 'ARM9/mips-syntax-vim'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-obsession'
Plug 'sirver/ultisnips'
Plug 'vim-airline/vim-airline'
" snippets and relevant
Plug 'honza/vim-snippets'
"Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/dbext.vim'
Plug 'majutsushi/tagbar'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'chrisbra/csv.vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/UnconditionalPaste'
call plug#end()

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

filetype plugin on
" Enable plugins
runtime macros/matchit.vim

" set pastetoggle=<f5>
set tabstop=4
colorscheme janah

" page 162 example
" set nocompatible
" filetype plugin indent on
" set hidden
" if has("autocmd")
  " autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
" endif

" noh
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" star search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

nnoremap & :&&<CR>
xnoremap & :&&<CR>
" & command


"nnoremap <f5> :!ctags -R<CR>
nnoremap <f5> :!ctags<CR>
" autocmd BufWritePost * call system("ctags -R")
" ctags

nnoremap <buffer> <F9> :w<CR> :exec '!python' shellescape(@%, 1)<cr>
" python


set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
" ack

set complete-=i
" keyword completion

set mouse=niv
set clipboard=unnamed
" smooth scrolling

runtime macros/matchit.vim
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogFollowPort<CR>
nnoremap <leader>u :VerilogGotoInstanceStart<CR>
let g:SuperTabDefaultCompletionType = 'context'
" verilog

set nobackup
" no backup files

au BufNewFile,BufRead *.s,*.S set filetype=mips
" MIPS

hi Folded ctermbg=233
" Folding

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"




nnoremap <leader>t :TagbarToggle<CR>
" File tree

" hi Normal guibg=NONE ctermbg=NONE
" transparent background



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" working with Skim
"if has('macunix')
"    let g:vimtex_view_general_viewer
"                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
"elseif has('unix')
"    let g:vimtex_view_general_viewer
"                \ = 'zathura'
"endif
"let g:vimtex_view_general_options = '-r @line @pdf @tex'
"
"" This adds a callback hook that updates Skim after compilation
"let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
"function! UpdateSkim(status)
"	if !a:status | return | endif
"
"	let l:out = b:vimtex.out()
"	let l:tex = expand('%:p')
"	let l:cmd = [g:vimtex_view_general_viewer, '-r']
"	if !empty(system('pgrep Skim'))
"		call extend(l:cmd, ['-g'])
"	endif
"	if has('nvim')
"		call jobstart(l:cmd + [line('.'), l:out, l:tex])
"	elseif has('job')
"		call job_start(l:cmd + [line('.'), l:out, l:tex])
"	else
"		call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
"	endif
"endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetsDirectories = ['UltiSnips']
let g:UltiSnipsSnippetsDir = '/Users/zty/.vim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger = '<c-c>'
let g:UltiSnipsJumpForwardTrigger = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rnu
set numberwidth=4
highlight LineNr ctermfg=grey
" line number
"set number
" number

" tabs
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" specific to neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" conda neovim
let g:python3_host_prog="/anaconda3/bin/python3"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LocalLeader>o :OpenIndentToCursorCol<CR>
command! OpenIndentToCursorCol call append('.', repeat(' ', getcurpos()[2] -1)) | exe "normal j" | startinsert!

set list lcs=tab:\|\ 
let g:indentLine_color_dark = 1 " (default: 2)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <c-s> save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-s> :w <CR>
nnoremap <c-q> :wq <CR>
inoremap <c-s> <esc>:w <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_verilog_checkers = ['iverilog']
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_tex_checkers = []

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Monaco\ Regular:h10
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
