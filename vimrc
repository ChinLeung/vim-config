" Required
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vim modifiers
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-sensible'

" Utilities
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'mileszs/ack.vim'
Plugin 'Shougo/vimproc.vim'

" Auto-completion
Plugin 'Shougo/neocomplete.vim'
Plugin 'm2mdas/phpcomplete-extended'
Plugin 'ervandew/supertab'

" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'nicholasc/vim-black'
Plugin 'nicholasc/vim-seti'

" Language files
Plugin 'StanAngeloff/php.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
syntax on
filetype plugin indent on

" Basic sets
set cul
set number
set hidden
set expandtab
set tabstop=4
set shiftwidth=4
set synmaxcol=512
set guioptions-=r
set guifont=Monaco:h13
set showtabline=2
set backspace=indent,eol,start

" Color scheme configuration
set background=dark
colorscheme gruvbox 

" Map F13 & F14 to edit configuration
map <F13> :e ~/.vim/vimrc<cr>
map <F14> :e ~/.vim/gvimrc<cr>

" PHP DocBlock configuration
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
map <D-D> :call pdv#DocumentCurrentLine()<cr>

" EasyMotion configuration 
let g:EasyMotion_leader_key = '<Leader>' 
set completeopt=longest,menuone

" SuperTab configuration
let g:SuperTabDefaultCompletionType = "<c-n>"

" Neocomplete configuration
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#min_keyword_length = 3

" File type omni completion configuration
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

" CtrlP configuration
map <leader>t :CtrlPCurWD<cr>
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.svn$|\.phalcon|\.phpcomplete_extended|dump$|',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.swp$'
  \ }

" PHP Complete Extended configuration
let g:phpcomplete_index_composer_command = "composer"

" Composer configuration
map <leader>pi :!composer install --no-ansi<cr>
map <leader>pu :!composer update --no-ansi<cr>

" Fugitive configuration
map <leader>gw :Gwrite<cr>
map <leader>gs :Gstatus<cr>
map <leadeR>gc :Gcommit<cr>
map <leader>gd :Gdiff<cr>
map <leader>gp :Gpull<cr>
map <leader>gg :Gpush<cr>
map <leader>gm :Git mergetool<cr>

" NERDTree configuration
map <leader>n :NERDTreeToggle<cr>
let g:NERDTreeWinSize = 36 
let g:NERDTreeQuitOnOpen 3= 1

" NERDCommenter configuration
map <leader>c :NERDComToggleComment<cr>

" TagBar configuration
map <leader>tb :TagbarOpen fc<cr>
let g:tagbar_width = 36

" cTags configuration
set tags=./tags
map <D-C> :!ctags -R --languages=php --exclude='.*'<cr>

" Ack configuration
map <leader>s :call AckSearch()<cr>
fun! AckSearch()
  let name = input('Enter search: ')
  execute 'Ack "' . name . '"'
endfunction

" GitGutter configuration
hi SignColumn guibg=#282828
hi GitGutterAdd guibg=#282828
hi GitGutterChange guibg=#282828
hi GitGutterDelete guibg=#282828
hi GitGutterChangeDelete guibg=#282828
autocmd BufEnter * sign define DefaultColumnSign
autocmd BufEnter * execute 'sign place 9999 line=1 name=DefaultColumnSign buffer=' . bufnr('')
