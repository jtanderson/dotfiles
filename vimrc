execute pathogen#infect()

" My Plugins: (clone into ~/.vim/bundle)
" =================================
" https://github.com/kien/ctrlp.vim
" https://github.com/scrooloose/nerdtree
" https://github.com/tpope/vim-sensible.git
" https://github.com/mattn/emmet-vim.git
" https://github.com/xolox/vim-misc
" https://github.com/xolox/vim-session

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

syntax on
filetype plugin indent on
set number

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2

let g:livepreview_previewer = 'open -a Skim'

map <C-n> :NERDTreeToggle<CR>
" map <C-t> :LLPStartPreview<CR>

if has("gui_running")
  colorscheme darkblue
  set guifont=Anonymous\ Pro:h16
  set lines=141 columns=141
endif

autocmd BufEnter *.tex colorscheme kellys
autocmd BufEnter *.tex setlocal spell spelllang=en_us

let g:Tex_MultipleCompileFormats = 'pdf'

" map <C-b> :w<enter>\ll
map <F2> :w<enter>\ll

set autochdir
set listchars=eol:¬
set list
set autoread

"let g:session_autosave = 'yes'
"let g:session_autoload = 'yes'

augroup filetypedetect
  au! BufNewFile,BufRead *.jemdoc setf jemdoc
augroup END

autocmd Filetype jemdoc setlocal comments=:#,fb:-,fb:.,fb:--,fb:..,fb:\:

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

let g:Tex_UseMakefile = 0
