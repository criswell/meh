" Decent sized history
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7



" Load all the customizations
runtime! configs/**/*.vim
