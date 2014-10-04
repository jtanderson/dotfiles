execute pathogen#infect()

syntax on
filetype plugin indent on

let g:livepreview_previewer = 'open -a Skim'

map <C-n> :NERDTreeToggle<CR>
map <C-t> :LLPStartPreview<CR>

if has("gui_running")
	colorscheme darkblue
	set guifont=Anonymous\ Pro:h16
	set lines=141 columns=141
endif
