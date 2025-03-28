#!/bin/bash

#tmux
git -C $HOME clone https://github.com/jimeh/tmux-themepack.git .tmux-themepack
ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf

# # Plug (to be used with nvim)
# # https://github.com/junegunn/vim-plug
# curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# # nvim
# mkdir -p ~/.config/nvim
# ln -sf `pwd`/nvim/init.vim ~/.config/nvim/
# #start nvim and trigger plugin install, exit after installation
# nvim +PlugInstall +qa

# echo 'NeoVim configuration completed. Enjoy!'
