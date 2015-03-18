runtime bundles/tplugin_vim/macros/tplugin.vim

runtime bundles/tcomment_vim-master/plugin/tcomment.vim
if !exists('g:vim_user_dir')
    if isdirectory(expand('$HOME').'/.vim')
        let vim_user_dir = expand('$HOME').'/.vim'
    else
        let vim_user_dir = expand('<sfile>:p:h')
    endif
endif

"set nocompatible  " Use Vim defaults (much better!)

set listchars=tab:??,trail:?

set wildmenu

"set hidden " Allows hiding buffers even though they contain modifications which have not yet been written back to the associated file.

set bs=2    " allow backspacing over everything in insert mode
"set tw=78     " always limit the width of text to 78

set nobackup      " keep a backup file
set viminfo='50,\"50,:50,/50   " cf :help viminfo

set clipboard=unnamedplus

"+--------------------------------------------------------------------------+
"| Indentation                                                              |
"+--------------------------------------------------------------------------+
" Indenting and tab settings
" I prefer a 4 spaces indent instead of long tabs, see
" http://www.jwz.org/doc/tabs-vs-spaces.html for some good reasons.
set tabstop=4 " number of spaces that <TAB> in file uses
set softtabstop=4   " number of spaces that <TAB> uses while editing
set shiftwidth=4     " number of spaces to use for (auto)indent step
set expandtab        " uses spaces when <TAB> is inserted

"  C-Indenting
set cinoptions=>1s,e0,n2,}0,^0,:s,=s,ps,t0,(2s,)25,*35,+2s,f0,{0,cs,us
set cinoptions+=g0      " place public/private declarations on row 0
set cinkeys={,0{,0},!^F,o,O,e,*<Return>
set comments=s1:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,nb:>,fb:-


set autoindent       " always set autoindenting on
set smartindent      " smartindent! :)

"+--------------------------------------------------------------------------+


set cmdheight=2
set history=100     " 
set shell=csh\ -f

"set scrolloff=5      " minimum number of lines above and below cursor

"set wrapscan         " searche swrap around the end of the file
set ignorecase       " ignore case in search patterns
set incsearch        " incremental search
set hlsearch         " highlight matches with last search pattern
set report=2         " threshold for reporting number of lines changed
set confirm          " confirm certain operations that would normally fail
set nu		" put the number of lines
set sm		" check the parenthese
"+--------------------------------------------------------------------------+
"| Terminal Setup                                                           |
"+--------------------------------------------------------------------------+
if "screen" == &term || "rxvt" == &term || "linux" == &term
    set t_kb=
    set t_kD=[3~
else
    let rgb_file = "/usr/X11R6/lib/X11/rgb.txt"
    if &t_Co <= 8 && ! exists('$BW') && &term != "xterm-color"
        set t_Co=16
    endif
    if has("terminfo")
        set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
        set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
    else
        set t_Sf=[3%dm
        set t_Sb=[4%dm
    endif
endif



set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz,*.rar
" Don't use Ex mode, use Q for formatting
map Q gq

"map _g :let efsave=&ef<Bar>let &ef=tempname()<Bar>exe ':!grep -n -w "<cword>" *.[cChH] *.cc *.cpp *.txt >'.&ef<CR>:cf<CR>:exe ":!rm ".&ef<CR>:let &ef=efsave<Bar>unlet efsave<CR><CR>:cc<CR>

"+--------------------------------------------------------------------------+
"| Autocommands                                                             |
"+--------------------------------------------------------------------------+
"augroup cprog
"    " Remove all cprog autocommands
"    au!
"
"    " When starting to edit a file:
"    "   For *.c and *.h files set formatting of comments and set C-indenting on.
"    "   For other files switch it off.
"    "   Don't change the order, it's important that the line with * comes first.
"    autocmd BufRead *                     set formatoptions=tcql nocindent comments&
"    autocmd BufRead *.c,*.cc,*.h          set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
"    autocmd BufRead *.pl,*.pm,*.tcl       set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
"    autocmd BufRead *.vr                  set ft=vera
"    autocmd BufRead *.sv                  set ft=sv
"    autocmd BufRead makefile,*.mak,*.asm  set noexpandtab
"    autocmd BufRead *.xml,*.xsl,*.xsd     source ~ohaller/scripts/setup/vim/xgen.vim
"augroup END

"augroup tclprog
"au!
""    autocmd FileType tcl set formatoptions=tcrql cindent cinoptions+=+0 com=sr:#,mb:#,elx:#,:# com^=sl:#\ -,mb:#,elx:#
"autocmd FileType tcl,pov set formatoptions=tcrql cindent cinoptions+=+0 com=sl:#\ -,mb:#,elx:#\ -,sr:#,mb:#,elx:#,:#

"augroup END

"" terminal setup
"if "screen" == &term || "rxvt" == &term || "linux" == &term
"    set t_kb=
"    set t_kD=[3~
"    "    " fixdel
"    " I used the following lines to map the upper 8 colors
"    " (color 9 - 16) to 1 - 8.
"    "set t_Co=16
"    "set t_AF=[3%?%p1%{8}%>%t%p1%{8}%-%e%p1%;%dm
"    "set t_AB=[4%?%p1%{8}%>%t%p1%{8}%-%e%p1%;%dm
"else
"    let rgb_file = "/usr/X11R6/lib/X11/rgb.txt"
"    if &t_Co <= 8 && ! exists('$BW') && &term != "xterm-color"
"        set t_Co=16
"    endif
"    if has("terminfo")
"        set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
"        set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
"    else
"        set t_Sf=[3%dm
"        set t_Sb=[4%dm
"    endif
"endif


" I like highlighting strings inside C comments
"let c_comment_strings=1

" Switch on syntax highlighting.

" Hide the mouse pointer while typing
"set mousehide

" Set nice colors highlight
" highlight Normal   guibg=grey   guifg=black
" highlight Cursor   guibg=black       guifg=white
" highlight NonText  guibg=grey


"set guifont=*
" Personnal files
"source /home/ohaller/scripts/setup/vim/mysyntax.vim

" Loading my script
" source /home/ohaller/scripts/setup/vim/colors.vim
" source /home/ohaller/scripts/setup/vim/Align.vim
" source /home/ohaller/scripts/setup/vim/selectBuffer.vim
" source /home/ohaller/scripts/setup/vim/man.vim

"autocmd BufRead /tmp/mutt*   :% s/\(\w\+\)_\(\w\+\)\/\w\+_\w\+_\w\{2\}@gnx\d\{3}/\2.\1@st.com/g
" New VIM 6.0 features
"filetype indent on

"+--------------------------------------------------------------------------+
"| Folding                                                                  |
"+--------------------------------------------------------------------------+
"let perl_fold=1
"set foldmethod=syntax
"set foldenable
"set foldcolumn=3

""" 14/01/2003. taglist configuration
"let Tlist_Ctags_Cmd="~/local/bin/ctags"
"nnoremap <silent> <F8> :Tlist<CR>
"set tags+=~/.vim/mes_tags

"+--------------------------------------------------------------------------+
"| Syntax Highlighting   code en couleur
"+--------------------------------------------------------------------------+
syn on


"+--------------------------------------------------------------------------+
"| Personal Macro
"+--------------------------------------------------------------------------+
"some problem in gvim but ok with vim
"map ,C :w<CR>:!aspell -d fr -c %<CR>:e %<CR>
"map car c’est une macro pour le mode "normal" (pas insertion, ni visual) 
",C est ce qu’il faut taper pour activer la macro 
"!aspell -c % : on applique aspell sur l’ensemble du fichier, ce qui va le modifier 

" -------------------------------------
" My
" -------------------------------------

" map -> apres <esc>
" nmap -> apres <esc> ou pendant l'edition
map :tn :tabe 
map :tne :tabn<CR>
map :tpr :tabp<CR>
nmap <silent> <F2> :TlistToggle<CR>
nmap <silent> <F3> :w<CR>
nmap <silent> <F4> :tabc<CR>
nmap <silent> <F5> :e<CR>
map <C-c> :s/^\(\s*\)\(.*\)$/\1<!--\2--><CR>:noh<CR>
map <S-c> :s/<!--\(.*>\)\s*-->/\1<CR>:noh<CR>

set mouse=a

" set cursorline
" Formatage de l'affichage

"colorscheme default
set guifont=DejaVu\ Sans\ Mono\ 8
"winpos 0 0
"set lines=90
"set co=194  

"Pour l'aide de l'auto completion c++
" :!ctags -R
"map <C-F12> --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++<CR>
"let OmniCpp_NamespaceSearch = 2
"let OmniCpp_Completely = 1
"let OmniCpp_DefaultNamespaces = ["std", "MyNamespace"]

" pour ne pas mettre la barre d'outil
set guioptions-=T " Disable tools bar
"set guioptions-=m   " Disable the menu

" nombre de lignes/colonnes minimum
set wh=5
set ww=15
set wmh=5
set wmw=15


set foldmethod=syntax
set foldenable
set foldcolumn=3
augroup cprog
    " Remove all cprog autocommands
    au!

    " When starting to edit a file:
    "   For *.c and *.h files set formatting of comments and set C-indenting on.
    "   For other files switch it off.
    "   Don't change the order, it's important that the line with * comes first.
    autocmd BufRead *                     set formatoptions=tcql nocindent comments&
    autocmd BufRead *.c,*.cc,*.h          set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
    autocmd BufRead *.pl,*.pm,*.tcl       set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
    autocmd BufRead *.vr                  set ft=vera
    autocmd BufRead *.sv                  set ft=sv
    autocmd BufRead makefile,*.mak,*.asm  set noexpandtab
    autocmd BufRead Makefile,*.S,*.s      set noexpandtab
    autocmd BufRead *.cpp,*.h,*.hpp       set noexpandtab
    autocmd BufRead *.proto               set noexpandtab
augroup END
colorscheme delek
"pour ada
let g:ada_standard_types=1  " Colorie les types Ada.
let g:ada_line_errors=1  " Affiche les lignes trop longues
let g:ada_folding='g'  " Si vous voulez réduire les fonctions.

" tags for developpement in amadeus
:set tags+=~/.vim/tags/pricing
:set tags+=~/.vim/tags/otflib
:set tags+=~/.vim/tags/ticket_interface

" auto completion configuration
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_NameSpaceSearch     = 1
let OmniCpp_DisplayMode         = 0
let OmniCpp_ShowScopeInAbbr     = 0
let OmniCpp_ShowPrototypeInAbbr = 0
let OmniCpp_ShowAccess          = 1
" let OmniCpp_DefaultNamespaces   = []
let OmniCpp_MayCompleteDot      = 1
let OmniCpp_MayCompleteArrow    = 1
let OmniCpp_MayCompleteScope    = 1
let OmniCpp_SelectFirstItem     = 2
let OmniCpp_LocalSearchDecl     = 0

