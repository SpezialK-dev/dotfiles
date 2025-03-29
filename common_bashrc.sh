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

# when using terminals like foot or kitty that have different Term variables this can work to enable a smaller featureset without having to install the TERM variable on the host 
alias xssh="TERM=xterm-256color ssh"

# create a gitignore file that already includes the emacs files
alias cgitignore="echo *.*~ > .gitignore"

#to simply opening files with the correct thing 
alias open="xdg-open" 



#########################################################
#							#
# funciotns 						#
#							#
#########################################################

# these functions are all loaded and can be called 


# creates an entire directory optimized for c++ code, then can be simply changed to accomidate for c code 
function cppcreate(){

# checking if a name for the project is set 
if [ -z $1 ];then  
	echo "no name was supplyed aborting"
	return -1
fi


cpppath="$(pwd)"

echo "creating new project under $cpppath / $1"
# creating all the paths 
mkdir $cpppath/$1
echo "created dir"
mkdir $cpppath/$1/src
echo "created src dir "

#creating all the files 
#makefile
echo -e "compile:\n	 g++ -o $1 -Wall -g ./src/main.cpp" > $cpppath/$1/makefile
echo "created makefile"

# creating a hello world file 
echo -e '#include <iostream>\n\n int main(int argc,char* argv[])\n{std::cout<<"Hello World" << std::endl; \n}' > $cpppath/$1/src/main.cpp

echo "created main file "

}




