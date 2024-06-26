" plugins {{{1
call plug#begin('~/Documents/dotfiles/vimfiles/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'yianwillis/vimcdoc'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'jiangmiao/auto-pairs'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/seoul256.vim'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'kana/vim-textobj-user'
"Plug 'tomtom/tcomment_vim'
"Plug 'kana/vim-textobj-lastpat'
"Plug 'mattn/emmet-vim'
"Plug 'sheerun/vim-polyglot'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()

" vim-airline {{{2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='seoul256'

" Nerdtree {{{2
nnoremap yon :<c-u>NERDTreeToggle<cr>

" " oneDark {{{2
" if (empty($TMUX))
" 	if (has("nvim"))
" 		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" 	endif
" 	if (has("termguicolors"))
" 		" set termguicolors
" 	endif
" endif
colorscheme seoul256-light

" fzf {{{2
nnoremap <leader>ff :<c-u>Files<cr>
nnoremap <leader>fp :<c-u>GFiles<cr>
nnoremap <leader>fo :<c-u>History<cr>
nnoremap <leader>fs :<c-u>GFiles?<cr>
nnoremap <leader>fg :<c-u>Rg<cr>
nnoremap <leader>fb :<c-u>Buffers<cr>
nnoremap <leader>fl :<c-u>Lines<cr>
nnoremap <leader>fbl :<c-u>BLines<cr>
nnoremap <leader>ss :<c-u>Rg<space><c-r>=expand('<cword>')<cr><cr>
vnoremap <leader>ss y:Rg<space><c-r>=escape(@",'"*?()[]{}.')<cr><cr>

" ale.vim {{{2
" let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
\ 'vue': ['eslint', 'volar'],
\ 'python': ['pyright'],
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'vue': ['prettier'],
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <silent> <C-]> <Plug>(ale_go_to_definition)

" vim-lsp-settings
let g:lsp_settings_filetype_vue = ['typescript-language-server', 'volar-server']
nmap <silent> <C-]> <Plug>(lsp-definition)
