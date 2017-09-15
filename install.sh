#!/bin/bash

set -e

script_dir="$(dirname $(realpath "$0"))"
cd "$script_dir"

# check if we are in right folder
right_folder='~/.dotfiles'
eval right_folder="$right_folder"
if [ "$right_folder" != "$script_dir" ]; then
    if [ -d "$right_folder"/.git ]; then
        echo git initialized in $right_folder... Trying to switch to it.
        "$right_folder"/install.sh
        exit $?
    fi
    echo Moving to right folder...
    repo=$(git remote -v | grep fetch | awk '{print $2}')
    mkdir -p "$right_folder"
    cd "$right_folder"
    git clone "$repo" "$right_folder"
    echo running script in new folder
    "$right_folder"/install.sh
    exit $?
fi


# Vim init
ln -sf "$(pwd)/vim/vimrc" ~/.vimrc
if [ -d "$HOME/.vim" ]
then
	ln -sf $(pwd)/vim/vim.config ~/.vim/vim.config
else
    mkdir $HOME/.vim
    ln -sf $(pwd)/vim/vim.config ~/.vim/vim.config
fi

#Tmux init
ln -sf "$(pwd)/tmux/tmux.conf" ~/.tmux.conf

#ZSH init

zsh_ins=0
grep -q "/bin/zsh" /etc/shells || zsh_ins=1

if [ $zsh_ins = 0 ]; then
    usr_zsh_ins=0
    grep -q "/usr/bin/zsh" /etc/shells || usr_zsh_ins=1
    if [ $usr_zsh_ins = 1 ]; then
        echo "zsh already installed,if need add /etc/shell val= /usr/bin/zsh; "echo "/bin/zsh >> /etc/shells"""
    else
        echo "zsh already install for user"
    fi
else
    echo "Need zsh install"
fi

#check user def shell and install oh-my-zsh

if echo $SHELL | grep -q zsh ; then
    if [ ! -d $HOME/.oh-my-zsh ]; then
        echo oh-my-zsh not  installing...
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        echo Done!!
    else
        echo oh-my-zsh already install
    fi
else
    chsh -s /bin/zsh
fi
ln -sf "$(pwd)/zsh/zshrc" ~/.zshrc

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#git pull
#oh-my-zsh/plugins/fzf/install --bin > /dev/null || true
#ln -sfT "$(pwd)/vim" ~/.vim
#ln -sf "$(pwd)/vim/vimrc" ~/.vimrc

#ln -sf "$(pwd)/zshrc" ~/.zshrc
#ln -sf "$(pwd)/zprofile" ~/.zprofile
