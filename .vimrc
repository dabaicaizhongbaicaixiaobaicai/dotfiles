" PLUGIN SETUP {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Provides insert mode auto-completion for quotes, parens, brackets, etc
  Plug 'Raimondi/delimitMate'

  " Shows a git diff in the gutter (sign column) and stages/undoes hunks
  Plug 'airblade/vim-gitgutter'

  " Auto close (X)HTML tags
  Plug 'alvan/vim-closetag'
  let g:closetag_close_shortcut = ''
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'

  " CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
  Plug 'hail2u/vim-css3-syntax'
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  " Improved incremental searching for Vim
  Plug 'haya14busa/incsearch.vim'

  " A command-line fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

  " fzf bindings for vim
  Plug 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  let $FZF_DEFAULT_OPTS='-m --reverse'
  let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
  let g:fzf_colors =
        \ { 'fg':    ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Keyword'],
        \ 'fg+':     ['fg', 'Exception', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'Comment', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Ignore'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }

  " A Vim alignment plugin
  Plug 'junegunn/vim-easy-align'

  " Asynchronously control git repositories in Neovim/Vim 8
  Plug 'lambdalisue/gina.vim'

	" Vastly improved Javascript indentation and syntax support in Vim
  Plug 'pangloss/vim-javascript'

  " React JSX syntax highlighting and indenting for vim
  Plug 'mxw/vim-jsx'

  " A tree explorer plugin for vim
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeChDirMode = 2
  let NERDTreeMinimalUI = 1
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 1
  let NERDTreeStatusline = ''

  " Comment stuff out
  Plug 'tpope/vim-commentary'

  " The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
  Plug 'machakann/vim-sandwich'

  " Lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline'
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#hunks#enabled = 0
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_inactive_collapse=0
  let g:airline_section_a = ''
  " let g:airline_section_b = ''
  let g:airline_section_c = '%t'
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = '%l'
  let g:airline_theme='tender'

  " Asynchronous Lint Engine
  Plug 'w0rp/ale'
  let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'javascript.jsx': ['eslint'],
        \   'rust': ['rls'],
        \}
	let g:ale_fix_on_save = 1
  let g:ale_fixers = {}
  let g:ale_fixers.javascript = ['eslint']
  let g:ale_fixers.rust = ['rustfmt']
  let g:ale_rust_rls_toolchain = 'stable'

  " Make the yanked region apparent!
  Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 500

	" Async Vim plugin for showing your outdated Vim plugins
  Plug 'semanser/vim-outdated-plugins'

  " A 24bit colorscheme for Vim, Airline and Lightline
  Plug 'jacoborus/tender.vim'

  " Vim plugin for selectively illuminating other uses of current word under the cursor
  Plug 'RRethy/vim-illuminate'
  let g:Illuminate_ftblacklist = ['nerdtree']

  " Complete engine and Language Server support for neovim & vim, featured as VSCode
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

  " Git branch management for Vim
  Plug 'sodapopcan/vim-twiggy'

  " Seamless navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'

  " Override vim syntax for yaml files
  Plug 'stephpy/vim-yaml'

  Plug 'dstein64/vim-startuptime'
call plug#end()
" }}}

" GENERAL {{{
syntax enable                          " Enable syntax highlighting
colorscheme tender
let mapleader = "\<Space>"             " Setup leader key
let macvim_skip_colorscheme=1
" }}}

" VARS {{{
if has('nvim')
  set inccommand=nosplit      " shows the effects of a command incrementally, as you type.
endif

set autoread                " autoload file changes
set autowriteall            " autosave files
set background=dark         " dark colorscheme
set completeopt-=preview    " Do not show preview window for ins-completion.
set diffopt+=vertical       " split diffopt in vertical mode
set encoding=utf-8          " set the character encoding to UTF-8
set expandtab               " convert tabs to the spaces
set foldlevel=2             " sets the fold level
set foldmethod=indent       " type of indentation
set foldnestmax=10          " sets the maximum nesting of folds
set gcr=a:blinkon0          " disable cursor blinking
set guioptions=             " remove all GUI components and options.
set hidden                  " hide when switching buffers instead of unloading
set history=1000            " store lots of :cmdline history
set hlsearch                " highlights the string matched by the search
set ignorecase              " make searching case insensitive
set incsearch               " incremental search
set nobackup                " disable backups
set nocompatible            " use Vim settings, rather then Vi
set nofoldenable            " when off, all folds are open when open a new file
set noshowmode              " don't show mode as we use a status line plugin
set noswapfile              " disable swapfile
set nowrap                  " wrap lines
set scrolloff=10            " keep cursor at the minimum 10 rows from the screen borders
set shiftwidth=2            " 2 spaces
set showmatch               " show match brackets
set sidescroll=1            " incrementally scroll one character
set signcolumn=yes          " always show signcolumns
set smartcase               " unless the query has capital letters
set splitbelow              " open new split below
set splitright              " open new split right
set tabstop=2               " 2 spaces
set termguicolors           " enable True color
set ttyfast                 " always assume a fast terminal
set undodir=~/.vim/undo-dir " setup undo directory
set undofile                " save undo chages even after computer restart
set updatetime=250          " reduce update time in Vim
set wildmenu                " visual autocomplete for command menu
" " }}}

" KEYMAP {{{
inoremap <C-c> <CR><Esc>O
inoremap <C-j> <Down>
inoremap <C-k> <Up>
map / <Plug>(incsearch-forward)
nnoremap <C-S-P> :call <SID>SynStack()<CR>
nnoremap <esc> :noh<return><esc>
nnoremap <leader>a :Ag 
nnoremap <leader>ev :tabnew ~/dotfiles/.vimrc<cr>
nnoremap <silent> <leader><tab> :Files<CR>
nnoremap <silent> <leader>gc :Gina commit<CR>
nnoremap <silent> <leader>gd :Gina diff<CR>
nnoremap <silent> <leader>gp :Gina push<CR>
nnoremap <silent> <leader>gs :Gina status -s<CR>
nnoremap <silent> <leader>gt :Twiggy<CR>
nnoremap <silent> <leader>j :ALENext<cr>
nnoremap <silent> <leader>k :ALEPrevious<cr>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>r :source %<CR>
nnoremap <silent> <leader>t :term<CR>
nnoremap <silent> <leader>u :Ag <C-R><C-W><CR>
nnoremap H 0
nnoremap L $
nnoremap P P`[v`]=
nnoremap S i<cr><esc><right>
nnoremap p p`[v`]=
nnoremap ¬ :bnext<CR>
nnoremap ˙ :bprevious<CR>
noremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
noremap <silent> <tab> :NERDTreeToggle<CR>
noremap ?  <Plug>(incsearch-backward)
noremap g/ <Plug>(incsearch-stay)
tnoremap <Esc> <C-\><C-n>
vnoremap <leader>s :sort<CR>
xmap ga <Plug>(EasyAlign)

" COC keymap
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <cr> for confirm completion.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" }}}

" AUTOCOMMANDS {{{
if has('nvim')
  augroup term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
endif

augroup folding
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim execute "normal! zM"
augroup END

au BufRead,BufNewFile .eslintrc set filetype=json

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler
" }}}

" FUNCTIONS {{{

" correct label for folding block in vimrc
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:folddashes . sub
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! CreateCenteredFloatingWindow()
  let width = min([&columns - 4, max([80, &columns - 20])]) - 10
  let height = min([&lines - 4, max([20, &lines - 10])])
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]
  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  au BufWipeout <buffer> exe 'bw '.s:buf
endfunction
" }}}

" HIGHLIGHT {{{
hi illuminatedWord guibg=#4c525e
hi Normal guibg=NONE ctermbg=NONE
hi Visual guifg=#000000 guibg=#FFFFFF gui=none
hi Pmenu guibg=#222 guifg=gray
" }}}
