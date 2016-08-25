set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

"plugin
Plugin 'Valloric/YouCompleteMe'
Plugin 'winmanager'
Plugin 'minibufexpl.vim'
Plugin 'taglist.vim'
Plugin 'ctags.vim'
Plugin 'a.vim'
Plugin 'altercation/solarized.git'

call vundle#end()
filetype plugin indent on


""YouCompleteMe Set
""let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
set tags+=/home/lu/workspace/quark_alarm/tags
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
""nmap <M-g> :YouCompleteMe GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
nnoremap <F6> :YcmCompleter GoToDefinition<CR>
nnoremap <F7> :YcmCompleter GoToDeclaration<CR>
nnoremap <F8> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>


set nu
syntax enable
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set cindent
set smartindent
set hlsearch
set incsearch
set enc=UTF-8
set showmatch


""solarized theme
set t_Co=256	
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

""Taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

""WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"MiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavArrows=1
let g:bufExplorerMaxHeight=30
let g:miniBufExplorerMoreThanOne=0

""a.vim
nnoremap <silent> <F12> :A<CR>

""format 
nnoremap <F9> <ESC>gg=G

filetype plugin indent on 
set completeopt=longest,menu

inoremap ={	={}<ESC>i
inoremap { {<CR>}<ESC>kA<CR>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i

autocmd BufNewFile *.cpp,*.c,*.h,*.sh exec ":call SetTitle()"
function SetTitle()
	if &filetype == 'sh'
		call setline(1,"\####################################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: lujiefeng")
		call append(line(".")+2, "\# mail: jiefeng.lu@sirun.net")
		call append(line(".")+3, "\#Created Time:".strftime("%c"))
		call append(line(".")+4, "\#########################################################################")
		call append(line(".")+5,"\#!/bin/bash")
		call append(line(".")+6,"")
	else
		call setline(1,"/***********************************************************")
		call append(line("."),">File Name: ".expand("%"))
		call append(line(".")+1," > Author:	lujiefeng")
		call append(line(".")+2," > Mail: jiefeng.lu@sirun.net")
		call append(line(".")+3," > Create Time:" .strftime("%c"))
		call append(line(".")+4,"**************************************************/")
		call append(line(".")+5,"")
	endif
	autocmd BufNewFile * normal G
endfunction

