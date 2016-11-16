if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

mask g-w,o-w

git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

