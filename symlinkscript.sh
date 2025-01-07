#!/bin/bash
# every config should check if the software is installed to then create the symlink only if the software is installed on the machine

# root check since script should not be run as root
if [ `id -u` -eq  0 ]
   # this would be annoying and to not cause problems we have a check
  then echo "DONT RUN AS ROOT"
  exit
fi
# variables that might be of use in this script

path_to_dotfiles=$(pwd)


# emacs config creating symlink
test -f /bin/emacs && { echo "emacs installation found"; ln  ./.emacs $HOME/.emacs; }

# bashrc addition script
# only works when in homedir 
if grep -q common_bashrc.sh $HOME/.bashrc ; then
    echo "already added to bashrc"
else
    echo "adding to bashrc "
    echo "source ${path_to_dotfiles}/common_bashrc.sh" >> $HOME/.bashrc
fi


# adding vim rc 
test -f /bin/vim && { echo "Vim installation found"; ln ./.vimrc $HOME/.vimrc; }
# installint the colorschem to then use in the config, this saves me from using a plugin manager
# https://github.com/joshdick/onedark.vim

#TODO add test for direcotries since these might not existy 


#this script will just move the files since that is quite easy to di 
# I might have to add another test for the autoload setting but if one of the files exist both should exist
if test -f $HOME/.vim/colors/onedark.vim ; then 
	echo "Vim Theme already downloaded"
else 
	wget https://raw.githubusercontent.com/joshdick/onedark.vim/refs/heads/main/colors/onedark.vim
	mv ./onedark.vim $HOME/.vim/colors/onedark.vim
	wget https://raw.githubusercontent.com/joshdick/onedark.vim/refs/heads/main/autoload/onedark.vim
	mv  ./onedark.vim $HOME/.vim/autoload/onedark.vim
fi
