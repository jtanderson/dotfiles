" execute pathogen#infect() " no longer needed with vim 8 plugins

" My Plugins: (clone each into ~/.vim/pack/vendor)
" =================================
" https://github.com/kien/ctrlp.vim
" https://github.com/scrooloose/nerdtree
" https://github.com/tpope/vim-sensible.git
" https://github.com/mattn/emmet-vim.git
" https://github.com/xolox/vim-misc
" https://github.com/xolox/vim-session
" git://github.com/JuliaEditorSupport/julia-vim.git

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has ("unix")
    if system('uname') =~ 'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

let os=GetRunningOS()

syntax on
filetype plugin indent on
set number

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2

map <C-n> :NERDTreeToggle<CR>
" map <C-t> :LLPStartPreview<CR>

set guifont="Monaco:h16"

if has("gui_running")
  "colorscheme darkblue
  set lines=141 columns=141
endif

colorscheme elflord

autocmd BufEnter *.tex colorscheme kellys
autocmd BufEnter *.tex setlocal spell spelllang=en_us

let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode -synctex=1 $*'
let g:Tex_MultipleCompileFormats = 'pdf, aux'

if os == "mac"
  let g:Tex_ViewRule_pdf = 'Skim'
else
  let g:Tex_ViewRule_pdf = 'okular'
endif

" map <C-b> :w<enter>\ll
map <F2> :w<enter>\ll

set autochdir
set listchars=eol:¬
set list
set autoread

"let g:session_autosave = 'yes'
"let g:session_autoload = 'yes'

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

let g:Tex_UseMakefile = 0
