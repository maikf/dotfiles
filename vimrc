set background=dark

" no bells
set vb t_vb=
" easier searching
set ignorecase
set smartcase
set hlsearch

" make vim more friendly
set nocompatible
" always allow backspace
set bs=2

set autoindent smartindent 

set history=50

" always show filename
set laststatus=2
set ruler

" better completion for filenames
set wildmenu

set expandtab
set sts=4
set sw=4

filetype indent on

set number
hi LineNr cterm=bold ctermfg=black
syntax on

filetype plugin on
autocmd FileType perl setlocal commentstring=\ \ #%s

let perl_fold=1
let perl_nofold_packages=1
let perl_nofold_subs=1

hi Folded cterm=bold ctermfg=black ctermbg=NONE
" hi FoldColumn cterm=bold ctermfg=black ctermbg=NONE

" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
  let save_cursor = getpos('.')
  let append = ' vim: set ts=4 sw=4 sts=4 expandtab: '
  $put =substitute(&commentstring, '%s', append, '')
  call setpos('.', save_cursor)
  set ts=4 sw=4 sts=4 et
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

let NERDTreeIgnore=['\.o$', '\.cmi$', '\.annot$', '\.cmx$', '\~$']
