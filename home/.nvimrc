set nocompatible	" make Vim behave in a more useful way
set nostartofline	" keep cursor in the same column if possible
set whichwrap=b,s,[,],<,>,h,l " allow cursor to wrap between lines
set virtualedit=block " allow virtual editing in Visual blocmode
set lazyredraw		" don't redraw screen while executing macos/mappings
set scrolloff=1		" minimal number of screen lines to keep above and below the cursor
set incsearch		" enable incremental search
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set winaltkeys=no	" allow mapping of alt (meta) key shortcuts
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set clipboard=unnamedplus
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set hlsearch		" highlight search patterns
set smartcase		" ignore case when the pattern contains lowercase letters only
set showtabline=1	" show tabs when there are more than one
set relativenumber		" display line relative numbers
scriptencoding utf-8
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
"set foldenable                  " auto fold code
set foldlevel=99
set gdefault                    " the /g flag on :s substitutions by default
set shortmess=aoOTI
"set shortmess=aTI
set formatoptions=qrn1
set wrap " wrap lines
set textwidth=79
set colorcolumn=79
set linebreak
set breakindent
set list
set listchars=tab:▸‧,trail:‿,extends:⁑,nbsp:… " Highlight problematic whitespace

set t_Co=256
"set ttyfast
set cursorline " highlight current line
set foldmethod=indent

" Persistent undo

set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

set hidden " Allow backgrounding buffers without writing them, and remember
           " marks/undo for backgrounded buffers
set history=1000 " Remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set nobackup " do not keep backup files, it's 70's style cluttering
set noswapfile " do not write annoying intermediate swap files,
" who did ever restore from swap files anyway?
set wildmenu " Make tab completion for files/buffers act like bash
set wildmode=list:full " show a list when pressing tab and complete
" first full match
"set wildmode=longest,list " GRB: use emacs-style tab completion when selecting files, etc
set title " change the terminal's title
set novisualbell " no visual flash on error
set noerrorbells " don't beep
set ruler " show the cursor position all the time
set autoread " automatically update the buffer if file got
             " updated in the meantime: see :help W11
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set splitbelow
set splitright
set sessionoptions-=help,tabpages,winsize,sesdir,options,resize

let $PAGER=''

if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

filetype off
filetype plugin off
filetype indent off

if has("gui_running")
  set guifont=PragmataPro\ 8
  "set guifont=monoOne\ 8
  "set guifont=Envy\ Code\ R\ 8
  " hide the menu in GUI mode
  set go+=M
  set go-=m
  " hide the toolbar in GUI mode
  set go-=T
  " Don't show scroll bars in the GUI
  set go-=L
  set go-=r
end

call plug#begin('~/.vim/plugged')

" My bundles

" vim-plug selfupgrade
"Plug 'junegunn/vim-plug', { 'frozen': 'yes' }


" See "Aligning Text with
" Tabular.vim"[http://vimcasts.org/episodes/aligning-text-with-tabular-vim/]
" for a screencast that shows how Tabular.vim works.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'Rykka/riv.vim' ", { 'for': 'mkd' }
" Bbye allows you to do delete buffers (close files) without closing your
" windows or messing up your layout.
Plug 'moll/vim-bbye', { 'on': ['CtrlP', 'CtrlPBuffer'] }
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer'] }
if has('python')
  Plug 'FelikZ/ctrlp-py-matcher', { 'on': ['CtrlP', 'CtrlPBuffer'] }
endif
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
if has('lua')
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplcache.vim'
endif
" An ack/ag powered code search and view tool, in an intuitive way with fairly
" more context
Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimshell.vim'
Plug 't9md/vim-choosewin'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-flake8', { 'for': 'python' }
Plug 'jceb/vim-orgmode', { 'for': 'orgtodo' }
Plug 'Lokaltog/vim-easymotion'
Plug 'rstacruz/sparkup'
Plug 'vim-scripts/SearchComplete'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
Plug 'tpope/vim-obsession'
Plug 'osyo-manga/vim-marching'
Plug 'davidhalter/jedi-vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'vim-scripts/renamer.vim', { 'on': 'Renamer' }

Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'nono/vim-handlebars'
Plug 'mhinz/vim-signify'
Plug 'bling/vim-airline'
Plug 't9md/vim-choosewin'

Plug 'edkolev/promptline.vim', { 'on': 'PromptlineSnapshot' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'chrisbra/SudoEdit.vim', { 'on': ['SudoWrite', 'SudoRead'] }
Plug 'alex-ren/org.ats-lang.toolats', { 'for': ['sats', 'dats'], 'rtp': 'org.ats-lang.toolats.vim' }


Plug 'floobits/floobits-neovim'
Plug 'hsanson/vim-android'
Plug 'benekastah/neomake'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Filetypes

Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'vim-coffee-script', { 'for': 'coffeescript' }
Plug 'zah/nimrod.vim', { 'for': 'nim' }
Plug 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex', { 'for': ['tex', 'latex'], 'rtp': 'org.ats-lang.toolats.vim' }
" Colors

Plug 'tomasr/molokai'
Plug 'jpo/vim-railscasts-theme'
Plug 'gilgigilgil/anderson.vim'
Plug 'nielsmadan/harlequin'
Plug 'rking/vim-detailed'

"Plug 'AlxHnr/clear_colors'

Plug 'jlneder/vim-colemak'


call plug#end()

syntax on
filetype plugin indent on
colorscheme molokai
" COLORS {
	" syntax highlighting groups
	hi Comment      ctermfg=12
	hi Constant     ctermfg=15
	hi Identifier   ctermfg=4
	hi Statement    ctermfg=2
	hi PreProc      ctermfg=6
	hi Type         ctermfg=1
	hi Special      ctermfg=3
	hi Underlined   ctermfg=7
	hi Ignore       ctermfg=9
	hi Error        ctermfg=11
	hi Todo         ctermfg=1
	hi Normal ctermfg=none ctermbg=none
	hi NonText ctermfg=0 ctermbg=none
	hi Directory	ctermfg=12

	hi VertSplit	ctermfg=black
	hi StatusLine	ctermfg=green
	hi StatusLineNC	ctermfg=0

	hi Folded ctermbg=0 ctermfg=8

	hi Pmenu ctermfg=10 ctermbg=0
	hi PmenuSel ctermfg=0 ctermbg=14
	hi LineNr ctermfg=0 ctermbg=none
	hi CursorLine ctermfg=none ctermbg=none cterm=none
	hi CursorLineNr ctermfg=none ctermbg=0 
	hi CursorColumn ctermfg=none ctermbg=0

	" Syntax checker colors
	highlight SignColumn ctermbg=none
	hi SyntasticErrorSign ctermfg=1 ctermbg=none
	hi SyntasticWarningSign ctermfg=3 ctermbg=none
	hi SyntasticStyleErrorSign ctermfg=1 ctermbg=none
	hi SyntasticStyleWarningSign ctermfg=3 ctermbg=none
	hi SyntasticErrorLine ctermfg=none ctermbg=none
	hi SyntasticWarningLine ctermfg=none ctermbg=none
	hi SyntasticStyleErrorLine ctermfg=none ctermbg=none
	hi SyntasticStyleWarningLine ctermfg=none ctermbg=none
	hi SpellBad ctermfg=0 ctermbg=3
	hi SpellCap ctermfg=0 ctermbg=1

"}
" higlight misspeled python stuff differently
highlight SpellBad term=underline gui=undercurl guisp=Orange


"highlight mode
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red


"airline config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert=0
"let g:airline_theme='molokai'
"let g:airline_theme='wombat'


"set laststatus=2

" Number of screen lines to use for the command-line
set cmdheight=1


" different color for autocomplete menu
"highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30

if has("autocmd")
  if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    " auto save on losing focus
    autocmd FocusLost * silent! wa

    " Maintaining split window proportions when resizing window frame in vim
    autocmd VimResized * wincmd =

    " Source the vimrc file after saving it
    autocmd BufWritePost .vimrc source $MYVIMRC

    " auto +x current script 
    au BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent !chmod a+x "%"

    "Auto change the directory to the current file.
    autocmd BufEnter * lcd %:p:h

    autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
    " Autoclose folds
    "autocmd Syntax * normal ¿R

    " rm trailing whitesprce for c and python files
    " http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
    autocmd BufWritePre *.c :%s/\s\+$//e
    autocmd BufWritePre *.cpp :%s/\s\+$//e
    autocmd BufWritePre *.h :%s/\s\+$//e
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd BufWritePre *.hs :%s/\s\+$//e
    autocmd BufWritePre *.nim :%s/\s\+$//e


    autocmd FileType stylus,handlebars,vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd Filetype coffee setlocal ts=2 sw=2 expandtab
    autocmd FileType man setlocal nonumber tabstop=7 softtabstop=7 shiftwidth=7 statusline=%<%=%-30.(%l\ de\ %L,\ col:\ %c%V\ (%P)%)
    "highlight variable under cursor (not smart)
    "autocmd BufRead,BufNewFile *.py,*.pyw,*.c  autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
    autocmd BufNewFile,BufRead *.c setlocal formatprg=astyle\ -A2\ -dUp
    autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown

    " For fll vimfiler 
    autocmd FileType vimfiler call s:vimfiler_all_my_settings()
    function! s:vimfiler_all_my_settings()
       nmap <buffer> <C-l> <Plug>(vimfiler_switch_to_other_window)
       nmap <buffer> <Enter> <Plug>(vimfiler_cd_or_edit)
    endfunction
  endif
endif

"let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_complete_in_comments_and_strings = 1

let mapleader = ','
set pastetoggle=<leader>v " pastetoggle (sane indentation on pastes)
" additional esc with ii
inoremap ii <ESC>
nmap <silent> <leader>ss :set spell!<CR>
nnoremap <leader><space> :nohlsearch<CR>>
nnoremap <leader>z :GundoToggle<CR>
let g:gundo_map_move_newer="u"
let g:gundo_map_move_older="e"
" noremap U <C-r>
"nnoremap j h|xnoremap j h|onoremap j h|
"nnoremap h k|xnoremap h k|onoremap h k|
"nnoremap k j|xnoremap k j|onoremap k j|
"inoremap <M-j> <Left>|cnoremap <M-j> <Left>|
"inoremap <M-h> <Up>|cnoremap <M-h> <Up>|
"inoremap <M-k> <Down>|cnoremap <M-k> <Down>|

nnoremap <leader>h :silent !feh -FN $HOME/.vim/colemak-cheat-sheet.png<CR>
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
" ml makes more sense but ,m is used for marks and i dont wanna wait
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" mark config
" save and restore global variables

set viminfo='50,<1000,:30,!,n~/.viminfo
set viminfo+=!

" rainbow parentheses
augroup RainbowParentheses
  autocmd!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END

" (v)imfiler plugin {{{
nnoremap <leader>p :VimFilerSplit -winwidth=30 -toggle -buffer-name=vimfiler_<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'


" NERDTree
"nnoremap <leader>p :NERDTreeToggle<CR>
" make de arrows work with the colemak layout
"let NERDTreeMapOpenSplit="r"
"let NERDTreeMapOpenExpl="w"
"let NERDTreeMapUpdir="p"
"let NERDTreeMapUpdirKeepOpen="P"
"let NERDChristmasTree=1 " Tells the NERD tree to make itself colourful and
                        "" pretty.

"let NERDTreeHighlightCursorline=1 " Tell the NERD tree whether to highlight
                                  "" the current cursor line.

"let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~
                        "" chars when displaying directories.

" NERDCommenter
let g:NERDCustomDelimiters = {
    \ 'ats': { 'left': '//', 'leftAlt': '(*', 'rightAlt': '*)' },
    \ 'grondle': { 'left': '{{', 'right': '}}' }
\ }

" Tagbar
nnoremap <leader>w :TagbarOpenAutoClose<CR>

" indent guides
let g:indent_guides_color_change_percent = 4
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
nmap <silent> <Leader>j <Plug>IndentGuidesToggle


let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap ws  <Plug>Csurround
nmap cs  <Plug>Ysurround
nmap cS  <Plug>YSurround
nmap css <Plug>Yssurround
nmap cSs <Plug>YSsurround
nmap cSS <Plug>YSsurround
xmap S   <Plug>VSurround


"Navigate seamlessly between vim and tmux splits using a consistent set of
"hotkeys.
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-n> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-e> :TmuxNavigateDown<cr>
nnoremap <silent> <C-u> :TmuxNavigateUp<cr>
nnoremap <silent> <C-i> :TmuxNavigateRight<cr>
"nnoremap <silent> <C-n> :TmuxNavigatePrevious<cr>

"xmap gS  <Plug>VgSurround
"if maparg('s', 'x') ==# ''
    "xnoremap <silent> s :<C-U>echoerr 'surround.vim: Visual mode s has been removed in favor of S'<CR>
"endif
"if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i)
    "imap    <C-S> <Plug>Isurround
"endif
"imap      <C-G>s <Plug>Isurround
"imap      <C-G>S <Plug>ISurround

"" LustyJuggler
"let g:LustyJugglerDefaultMappings = 0
"let g:LustyExplorerDefaultMappings = 0
"nmap <silent> <Leader>a :LustyJuggler<CR>
"let g:LustyJugglerKeyboardLayout = "colemak"
"let g:LustyJugglerAltTabMode = 1

" easymotion
"let g:EasyMotion_leader_key = '<Leader>'

let g:EasyMotion_mapping_f = '<Leader>f'
let g:EasyMotion_mapping_F = '<Leader>F'
let g:EasyMotion_mapping_t = '<Leader>g'
let g:EasyMotion_mapping_T = '<Leader>G'
let g:EasyMotion_mapping_w = '<Leader>i'
let g:EasyMotion_mapping_W = '<Leader>I'
let g:EasyMotion_mapping_b = '<Leader>n'
let g:EasyMotion_mapping_B = '<Leader>N'
let g:EasyMotion_mapping_e = '<Leader>y'
let g:EasyMotion_mapping_E = '<Leader>Y'
let g:EasyMotion_mapping_ge = '<Leader>l'
let g:EasyMotion_mapping_gE = '<Leader>L'
let g:EasyMotion_mapping_n = '<Leader>k'
let g:EasyMotion_mapping_N = '<Leader>K'
let g:EasyMotion_mapping_j = '<Leader>e'
let g:EasyMotion_mapping_k = '<Leader>u'

if has('lua')
  "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplete#enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplete#enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  augroup OmniCompletion
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup END

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

  " vim-marching
    let g:marching_enable_neocomplete = 1

  if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
  endif

  let g:neocomplete#force_omni_input_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
else
  "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  " Enable heavy features.
  " Use camel case completion.
  "let g:neocomplcache_enable_camel_case_completion = 1
  " Use underbar completion.
  "let g:neocomplcache_enable_underbar_completion = 1

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : ''
          \ }

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplcache_enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplcache_enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplcache_enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplcache_enable_auto_select = 1
  "let g:neocomplcache_disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
  endif
  let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif " has('lua')

" CtrlP keymappings
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>s :CtrlPBuffer<CR>

" PyMatcher for CtrlP
if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"else
    "echo 'In order to use pymatcher plugin, you need +python compiled vim'
endif

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" jedi-vim config
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"

" promptline.vim config uncomment on generation with PromptlineSnapshot
"let g:promptline_preset = {
        "\'a'    : [ '$USER' ],
        "\'b'    : [ promptline#slices#cwd() ],
        "\'c'    : [ promptline#slices#vcs_branch() ],
        "\'warn' : [ promptline#slices#last_exit_code() ],
        "\'z'    : [ promptline#slices#host() ]}

" Bdelete shortcuts
nnoremap <Leader>x :w<CR>:Bdelete<CR>
nnoremap <Leader>q :Bdelete<CR>

" Nimrod Specifics
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" View file in two columns - http://vim.wikia.com/wiki/View_text_file_in_two_columns
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" writing to protected file using :Sw {{{1
function! SudoWrite()
  w !sudo dd of=%
  e!
endfunction

command! -nargs=0 Sw call SudoWrite()

" :Swq {{{1
command! -nargs=0 Swq call SudoWrite() | :q

" vim: set ts=2 sw=2 tw=79 :
