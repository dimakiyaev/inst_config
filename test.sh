#!/bin/bash

set -e

#zsh init

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
        ln -sf "$(pwd)/zsh/zshrc" ~/.zshrc
        echo Done!!
    else
        echo oh-my-zsh already install
    fi
else
    chsh -s /bin/zsh
fi

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#git pull
#oh-my-zsh/plugins/fzf/install --bin > /dev/null || true
#ln -sfT "$(pwd)/vim" ~/.vim
#ln -sf "$(pwd)/vim/vimrc" ~/.vimrc

#ln -sf "$(pwd)/zshrc" ~/.zshrc
#ln -sf "$(pwd)/zprofile" ~/.zprofile
