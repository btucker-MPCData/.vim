
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'airblade/vim-gitgutter'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'sven-strothoff/vim-clang_doxygen'

Plug 'Valloric/YouCompleteMe'

Plug 'SirVer/ultisnips'

Plug 'kergoth/vim-bitbake'

Plug 'ctrlpvim/ctrlp.vim'

call plug#end()



set spell
set nocompatible
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set guifont=DejaVu\ Sans\ Mono\ 8
set clipboard=unnamed
colo murphy
syn on
set tags=tags;/
map <C-c> "+y<CR>
map <C-v> "+p<CR>

set backupdir=~/vimbackup
set writebackup
set backup
au BufWritePre * let &bex = '-' . strftime("%Y%b%d%X") . '~'
set fileformats=unix,dos
set fileformat=unix
set autowrite
set autoread
set hlsearch


let g:clang_jumpto_declaration_key="<A-]>"
let g:clang_jumpto_back_key="<A-T>"

let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

let tlist_objc_settings    = 'objc;i:interface;c:class;m:method;p:property'

highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/


let g:seoul256_background = 233
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=50
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]

let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_root_markers = ['.git']

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif


" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType c,cpp,lisp,clojure,scheme RainbowParentheses
augroup END

" colo seoul256


function FuncCommStarStyle()
:i
/* Name:
 */
/**Purpose:
 *
 * Pre-conditions:
 *
 * Post-conditions:
 *
 * Notes:
 *
 * @param <VAR> <Comment about VAR>
 *
 * @return <Comment about return var>
 *
 * @see anotherfn()
 */
.
:endfunction

command FunctionCommentStarStyle call FuncCommStarStyle()

function FuncCommNoStarStyle()
:i
/*
Name:

Purpose:

Parameters:

Pre-conditions:

Post-conditions:

Returns:

Notes:

Also See:
*/
.
:endfunction

command FunctionCommentNoStarStyle call FuncCommNoStarStyle()

function FileCommStarStyle()
:i
/**
 * \file <file name>
 *
 * Copyright (C) Bsquare EMEA Limited 2016, All rights reserved.
 *
 * $Id$
 *
 * Description:
 *
 * References:
 *
 * Notes:
 *
 * Coding Guidelines:
 *  - INDENT=4 spaces.
 *  - Use "K&R" style braces layout.
 *  - DO NOT use TAB characters (remove them afterwards if necessary)
 *  - Try not to go too far beyond 80 character lines.
 *  - Use a "lazy" form of hungarian notation as follows:
 *  Variable prefix:
 *        sz        C Strings, Zero terminated
 *        p         Pointers  e.g. "char *pszName, **ppszNameIndirect;"
 *        is/use/do (etc) Booleans/flags (int's)
 *        st        struct's
 *        u         Unsigned
 *        b         Byte (char)
 *        w         Word (long)
 *        h         Handle
 *
 *  - Typedefs, macros and most enum values should be UPPER CASE
 *
 * History:
 *  V1.0    <DATE> btucker
 *  - Initial version
 *
 */
.
:endfunction

command FileCommentStarStyle call FileCommStarStyle()

function FileCommNoStarStyle()
:i
/**
@file <filename>

Copyright (C) Bsquare EMEA Limited 2016, All rights reserved.

$Id$

Description:

References:

Notes:

Coding Guidelines:
 - INDENT=4 spaces.
 - Use "K&R" style braces layout.
 - DO NOT use TAB characters (remove them afterwards if necessary)
 - Try not to go too far beyond 80 character lines.
 - Use a "lazy" form of hungarian notation as follows:
 Variable prefix:
       sz        C Strings, Zero terminated
       p         Pointers  e.g. "char *pszName, **ppszNameIndirect;"
       is/use/do (etc) Booleans/flags (int's)
       st        struct's
       u         Unsigned
       b         Byte (char)
       w         Word (long)
       h         Handle

 - Typedefs, macros and most enum values should be UPPER CASE

History:
 V1.0    <DATE> btucker
 - Initial version
*/
.
:endfunction

command FileCommentNoStarStyle call FileCommNoStarStyle()

