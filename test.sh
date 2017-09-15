#!/bin/bash

set -e

#zsh init


zsh_ins="$(grep -x "/bin/zsh" /etc/shells)"
echo "debug info zsh_ins: "$zsh_ins" "


if [ "/bin/zsh" = $zsh_ins ]; then
    echo "debug info zsh_ins: "$zsh_ins""
    usr_zsh_ins=0
    grep -q "/usr/bin/zsh" /etc/shells || usr_zsh_ins=1
    echo -------------------
    echo "debug info usr_zsh_ins: "$usr_zsh_ins""
    if [ $usr_zsh_ins = 1 ]; then
        echo "zsh already installed, need add /etc/shell val= /usr/bin/zsh"
        #        sudo -c echo "/usr/bin/zsh" >> /etc/shells
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
