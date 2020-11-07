#!/bin/bash
# Z-Shell installation (with oh-my-zsh)
sudo apt install zsh -y
chsh -s $(which zsh) #change default terminal to be zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zegabr/pyutils

# Change theme below
python3 pyutils/replace_line_with_content.py ~/.zshrc "ZSH_THEME" "ZSH_THEME=\"af-magic\""
python3 pyutils/replace_line_with_content.py ~/.zshrc "CASE_SENSITIVE" "CASE_SENSITIVE=\"true\""
python3 pyutils/replace_line_with_content.py ~/.zshrc "DISABLE_UPDATE_PROMPT" "DISABLE_UPDATE_PROMPT=\"true\""
python3 pyutils/replace_line_with_content.py ~/.zshrc "source /etc/zsh_command_not_found" "source /etc/zsh_command_not_found"

# Cloning extra plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k

# Add plugins below
python3 pyutils/replace_line_with_content.py ~/.zshrc "plugins=(" "plugins=(git zsh-syntax-highlighting zsh-autosuggestions k)"


source ~/.zshrc

echo "removing pyutils"
rm -rf pyutils/

echo """
=================================================
PLS OPEN ANOTHER TERMINAL FOR CHANGES TAKE EFFECT (this terminal will close in 5 sec)
=================================================
"""
sleep 5
exit
