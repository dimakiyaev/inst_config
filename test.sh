#!/bin/bash

set -e

#zsh init

zsh_ins=0
grep -q "/bin/zsh" /etc/shells || zsh_ins=1

if [ $zsh_ins = 0 ]; then
    usr_zsh_ins=0
    grep -q "/usr/bin/zsh" /etc/shells || usr_zsh_ins=1
    if [ $usr_zsh_ins = 1 ]; then
        echo "zsh already installed, need add /etc/shell val= /usr/bin/zsh"
    else
        echo "zsh install for user"
    fi
else
    echo "Need zsh install"
fi


#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#git pull
#oh-my-zsh/plugins/fzf/install --bin > /dev/null || true
#ln -sfT "$(pwd)/vim" ~/.vim
#ln -sf "$(pwd)/vim/vimrc" ~/.vimrc

#ln -sf "$(pwd)/zshrc" ~/.zshrc
#ln -sf "$(pwd)/zprofile" ~/.zprofile
