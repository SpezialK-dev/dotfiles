#!/bin/bash

# A none intrusiv bashrc extension 
# this gets additionally loaded and does replace your normal bashrc 


#########################################################
#							#
# Sources						#
#							#
#########################################################

# Sourcing git files
# so that we have git auto compleation on all systems regardless of configuration
source /usr/share/git/completion/git-completion.bash


#########################################################
#							#
# configurations					#
#							#
#########################################################

# makes ist so that we can just enter a path and we will automaticly cd when tering a path
shopt -s autocd

# configuring History to only store the things we actually need which would be 
# Stop logging consecutive identical commans 
export HISTCONTROL=ignoredups

#########################################################
#							#
# Aliases 						#
#							#
#########################################################


#calling emacs in terminal also opens it in a terminal window 
alias emacs='emacs -nw'

#default valgrind flags
alias vgrind="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose"

# when using kitty as a terminal it sometimes has problems with hosts that dont know it as a terminal emulator hence this fix
alias kssh="kitten ssh"

# create a gitignore file that already includes the emacs files
alias cgitignore="echo *.*~ > .gitignore"
