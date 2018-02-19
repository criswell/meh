"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sam's experimental vimrc rewrite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start with our plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Load defined configs
if filereadable(expand('~/.vim/config.vim'))
    source ~/.vim/config.vim
else
    echom "CONFIG_ERR: Unable to load config.vim"
end

set t_Co=256
" Load custom color scheme
if filereadable(expand('~/.vimcolor'))
    source ~/.vimcolor
end
