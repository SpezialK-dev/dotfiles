#!/bin/bash
# every config should check if the software is installed to then create the symlink only if the software is installed on the machine

# root check since script should not be run as root
if [ `id -u` -eq  0 ]
   # this would be annoying and to not cause problems we have a check
  then echo "DONT RUN AS ROOT"
  exit
fi



# emacs config creating symlink
test -f /bin/emacs && { echo "emacs installation found"; ln  ./.emacs $HOME/.emacs; }

