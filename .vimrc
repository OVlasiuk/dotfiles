"==================================  .VIMRC  ======================================

call pathogen#infect()
"call pathogen#helptags()
let g:cursorword=0
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set number
if has("nvim")
    set inccommand=split
endif
"set hls            " Search highlight
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,d
set tabstop=4
set shiftwidth=4
set expandtab
set title
set printoptions=number:n,paper:letter,header:0,top:5pc,bottom:5pc,right:5pc,left:12pc

if has("syntax")
    syntax on
endif
"
" fix backspace
set backspace=2
"
" support for the Ukrainian keyboard; press 'C-^' in the insert mode to switch layouts
"
set keymap=ukrainian-jcuken               
set iminsert=0
set imsearch=0

"==================================  INTERFACE  ======================================
set t_Co=256
set background=light
let g:PaperColor_Light_Override = { 'background' : '#ffffff' }
colorscheme  PaperColor  "pencil hemisu PaperColor
"if &diff
"colorscheme github  "PaperColor 
"endif
"hi clear SpellBad
hi SpellBad ctermbg=255
set cursorline
"
" clears underline or anything else for the cursorline to add color next:
"hi cursorline cterm=none term=none
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
"highlight CursorLine guibg=#ffffd7 ctermbg=255 " dark
"
"highlight CursorLine guibg=#ffffd7 ctermbg=191 " light  230
highlight clear SignColumn
"hi Search ctermfg=NONE ctermbg=11
"
" to work with gvim and not have silly menus:
:set guioptions-=m 
" GUI font
set guifont=Monospace\ 13
let g:gundo_width=30

"==================================  LINE BREAK  =====================================
set tw=80
set formatoptions+=jt
" soft line break:
set linebreak
set breakindent
"
" soft wrapping:
set wrap
"
" just in case: this turns off automatic insertion of newlines
" set textwidth=0 wrapmargin=0
"
"something about text wrapping, not very sure what it's all about
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
"autocmd FileType text setlocal textwidth=78
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif


"=================================  SESSION  AUTOSAVE  ===============================
"
let g:session_autoload = 'yes'
let g:session_autosave = 'no'
"
"
"==================================  KEYMAPS  ========================================
"
" Remapped Esc key; specifically for neovim
" 
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
    "
    if &diff
        vnoremap <C-M-p> :'<,'>diffput<CR>
        vnoremap <C-M-g> :'<,'>diffget<CR>
    endif

    nnoremap <C-P> :cprevious<CR>
    nnoremap <C-N> :cnext<CR>
    vnoremap <M-j> <Esc>j
    vnoremap <M-k> <Esc>k
    vnoremap <M-l> <Esc>l
    vnoremap <M-h> <Esc>h
    vnoremap <M-o> <Esc>o
    vnoremap <M-a> <Esc>a
    vnoremap <M-O> <Esc>O
    vnoremap <M-u> <Esc>u
    vnoremap <M-p> <Esc>p
    vnoremap <M-P> <Esc>P
    "
    inoremap <M-j> <Esc>j
    inoremap <M-k> <Esc>k
    inoremap <M-l> <Esc>l
    inoremap <M-h> <Esc>h
    inoremap <M-o> <Esc>o
    inoremap <M-a> <Esc>a
    inoremap <M-x> <Esc>x
    inoremap <M-O> <Esc>O
    inoremap <M-u> <Esc>u
    inoremap <M-p> <Esc>p
    inoremap <M-P> <Esc>P
    "nnoremap <M-Space> <Esc>
    "inoremap <M-Space> <Esc>
    vnoremap <M-Space> <Esc>
    "
endif
"inoremap <M-о> <Esc>j
"inoremap <M-л> <Esc>k
"inoremap <M-д> <Esc>l
"inoremap <M-р> <Esc>h
"inoremap <M-щ> <Esc>o
"inoremap <M-ф> <Esc>a
"inoremap <M-Щ> <Esc>O
"inoremap <M-г> <Esc>u
"inoremap <M-з> <Esc>p
"inoremap <M-З> <Esc>P
"
"
:map <xCSI>[62~ <MouseDown>
let mapleader = "\<Space>"
:nnoremap j gj
:nnoremap k gk
:vnoremap j gj
:vnoremap k gk
:nnoremap о j
:nnoremap р h
:nnoremap л k
:nnoremap д l
:nnoremap с c
:nnoremap г u
:nnoremap ч x 
:nnoremap ф a
:nnoremap з p
:nnoremap ц w
:nnoremap к r
:nnoremap ш i
:nnoremap щ p
:nnoremap пп gg
:nnoremap щ o
:nnoremap и b
:nnoremap п g
:nnoremap Ф A
:nnoremap м v
nmap <Leader><Space> gt
" 
" Ex mode replaced with formatting
nnoremap Q gq
"
" switching between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"nmap <c-m> <c-l><c-j>
"nmap <c-n> <c-h><c-j>
"
if has("nvim")
    " switching between buffers/show registers/show marks
    " version for Nvim
    nmap <C-M-b> <Esc>:buffers<CR>
    nmap <C-M-r> <Esc>:reg<CR>
    nmap <C-M-m> <Esc>:marks<CR>
else " version for Vim
    nnoremap ç <Esc>:buffers<CR>
endif
"
" horizontal and vertical window split
nnoremap <Leader>s :sp<CR>
nnoremap <Leader>v :vsp<CR>
nnoremap <silent><C-c> <C-c>:noh<CR>
nnoremap <silent><Leader>d :YcmCompleter GetDoc<CR>
nnoremap <Leader>f :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>l :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>q :q<CR>
"
"nnoremap <Leader>Q :q!<CR>
"
"write and write all
nnoremap <Leader>a :wa<CR>
nnoremap <Leader>w :update<CR>
"
"copying to the system buffer
nmap <Leader>p "+p
nmap <Leader>P "+P

vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>x "+x
vmap <Leader>p "+p
vmap <Leader>P "+P
"
" printing
vmap <M-C-P> :ha > %:t:r.pdf<CR>
"title case:
vmap <Leader>t :s/\<\(\w\)\(\w\+\)\>/\u\1\L\2/g <CR><C-c>
"
" add spaces after commas
" (e.g., to stop Pymode complaining)
vnoremap <Leader>, :s/,\(\ \)\@!/,\ /g<CR>
" 
"
" Show the current file in NERDTree
nnoremap <silent><Leader>. :NERDTreeFind<CR>
"set the working directory to that of the current file
nnoremap <silent><Leader>, :cd %:p:h<CR>:pwd<CR>
" search for the word under the cursor
vnoremap  y/<C-R>"<CR>
nnoremap  bvey/<C-R>"<CR>
" toggle cursorword plugin
nnoremap <silent>z/ :let g:cursorword=1-g:cursorword<CR>
"
vmap <Tab> >gv
vmap <S-Tab> <gv
"==================================  F-KEYS  =========================================
nnoremap <F2> :make<CR>
nnoremap <F3> :!clear && ./%< <CR>
nnoremap <silent><F4> :NERDTreeToggle<CR>
"nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F29> <C-R>=strftime("%c")<CR>
"nnoremap <silent> <F6> :redir @+<CR>:g//<CR>:redir END<CR>
" copy the lines from search result to the system buffer
nnoremap <F8> :GundoToggle<CR>
"Diff current line: (default: <F8>)
nnoremap <C-F8> <Plug>ToggleDiffCharCurrentLine 
nnoremap <F9> :TagbarToggle<CR>
"DiffChar plugin 
if &diff
    nmap <F11> <Plug>ToggleDiffCharCurrentLine
    nnoremap <F12> <Plug>ToggleDiffCharAllLines
endif
"
"

"==================================  SPELLING  =======================================
set spell spelllang=en

"======================  PYMODE and YCM ==============================================
"
if has('nvim')
    set runtimepath+=/usr/share/vim/vimfiles
endif
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_python_binary_path = '/usr/bin/python3'
"
"let g:python3_host_prog = '/usr/bin/python3'
"
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
"let g:pymode_lint_ignore="E116"        "ignoring an obnoxious warning

"let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
"let g:ycm_global_ycm_extra_conf = '~/.vim/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_detailed_diagnostics = ''
"let g:ycm_extra_conf_globlist = ['~/directory/*','!~/otherdirectory/*']
"
"let g:ycm_filetype_blacklist = {
"\ 'tagbar' : 1,
"\ 'qf' : 1,
"\ 'notes' : 1,
"\ 'markdown' : 1,
"\ 'unite' : 1,
"\ 'text' : 1,
"\ 'vimwiki' : 1,
"\ 'pandoc' : 1,
"\ 'infolog' : 1,
"\ 'mail' : 1
"\} 

"let g:ycm_filetype_specific_completion_to_disable = {
"\ 'gitcommit': 1,
"\ 'vimwiki': 1
"\}
"======================  ULTISNIPS  ==================================================
"
" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsListSnippets = "<C-M-u>"
let g:UltiSnipsExpandTrigger = "<M-Space>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

"
"======================  SYNTASTIC  ==================================================
"
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"=================================  DELIMITMATE  =====================================
let delimitMate_quotes = "\"  `"
let delimitMate_expand_space = 1
au FileType vimwiki let b:delimitMate_quotes = "\" "
au FileType html let b:delimitMate_quotes = "\" '"


"=================================  CONQUEGDB  =======================================
let g:ConqueGdb_Leader = '\'

"==================================  :Calendar  ======================================
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_date_endian = "middle"
let g:calendar_first_day = "monday"

"==================================  VIMWIKI  ========================================
let g:tagbar_type_vimwiki = {
            \   'ctagstype':'vimwiki'
            \ , 'kinds':['h:header']
            \ , 'sro':'&&&'
            \ , 'kind2scope':{'h':'header'}
            \ , 'sort':0
            \ , 'ctagsbin':'~/.vim/bundle/vimwiki/utils/vwtags.py'
            \ , 'ctagsargs': 'default'
            \ }
let g:vimwiki_list = [{'path':'~/yourpath',
            \ 'template_path': '~/yourpath',
            \ 'template_default': 'def_template',
            \ 'template_ext': '.html',
            \ 'nested_syntaxes': {'python': 'python', 'cpp': 'cpp'},
            \ 'auto_tags': 1
            \}]
"
"nnoremap <Leader>t iTODO: <Esc>
"nnoremap <Leader>T :s/\CTODO:\ //g<CR>
let g:vimwiki_folding='expr'



"==================================  TAGBAR  =========================================
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'
"\ 'deffile' : expand('<sfile>:p:h:h') . '/ctags/latex.cnf'

let g:tagbar_type_tex = {
    \ 'ctagstype' : 'tex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0
\ }

"==========================  AIRLINE&BUFFERLINE  =====================================
let g:airline#extensions#bufferline#overwrite_variables = 0
set laststatus=2  "for the status line to work
let g:airline_section_warning  = ''
let g:airline_detect_spell=0
"let g:airline_theme = 'PaperColor'
let g:airline_theme = 'pencil'
" airline fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = 'RO ↯↯↯'
"
" bufferline
let g:airline#extensions#bufferline#enabled = 1
let g:bufferline_active_buffer_right = ']'
let g:bufferline_active_buffer_left = '['
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = -1
" end of airline/bufferline settings




"map <F2> :mksession ~/.vim_session <cr> " Quick write session with F2
"map <F3> :source ~/.vim_session <cr>    "  And load session with F3 
"

"==================================  UNDERLINE, ETC  =================================
"command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
"command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
    execute 'let char = "\u'.a:cp.'"'
    execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

vnoremap <C-t> :Strikethrough<CR>
""""" END strikethrough, overline, underline, doubleunderline


"===========================  HIGHLIGHT ALL INSTANCES  ===============================
" CURSORWORD -- https://github.com/itchyny/vim-cursorword -- does the same, and
" better.
""  of word under cursor, when idle.
"" Useful when studying strange source code.
"" Type z/ to toggle highlighting on/off.
"nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

"function! AutoHighlightToggle()
"let @/ = ''
"if exists('#auto_highlight')
"au! auto_highlight
"augroup! auto_highlight
"setl updatetime=4000
"echo 'Highlight current word: off'
"return 0
"else
"augroup auto_highlight
"au!
"au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"augroup end
"setl updatetime=500
"echo 'Highlight current word: ON'
"return 1
"endif
"endfunction

"=======================  AUTOCOMMANDS  ==============================================
" add documentation window on the far right
autocmd BufEnter {__doc____rope__} :wincmd L

" add this {__run__, } and enclose the whole thing in curly braces to have "run" window be on the right as well
" run vim help on the far right as well:
autocmd FileType help wincmd L
autocmd BufWinEnter vimwiki :set conceallevel=0
"
" set text wrapping in the undo preview window
autocmd BufWinEnter __Gundo_Preview__ :set wrap
"
if has("nvim")
    " disable spellcheck in terminal
    augroup terminal
        autocmd TermOpen * setlocal nospell
        autocmd TermOpen * setlocal statusline=%{b:term_title}
    augroup END
endif
