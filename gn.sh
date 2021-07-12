#!/bin/bash

substr=':'
replacement=' +'
string1=$1

#replace the first : with +
string2=${string1/$substr/$replacement}
#remove second : till the end of the line
path=${string2%:*}

vim $path

#add followed into .bashrc
#source .bashrc
#
#alias gn='/root/wes/github/gn.sh'
#
