execute pathogen#infect()

" My Plugins: (in ~/.vim/bundle)
" =================================
" https://github.com/kien/ctrlp.vim
" https://github.com/scrooloose/nerdtree
" https://github.com/xuhdev/vim-latex-live-preview
" git://github.com/tpope/vim-sensible.git

syntax on
filetype plugin indent on
set number

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2

let g:livepreview_previewer = 'open -a Skim'

map <C-n> :NERDTreeToggle<CR>
map <C-t> :LLPStartPreview<CR>

if has("gui_running")
	colorscheme darkblue
	set guifont=Anonymous\ Pro:h16
	set lines=141 columns=141
endif
