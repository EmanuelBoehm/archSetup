#
# ~/.bashrc
#

Blue='\e[0;34m'         # Blue
Purple='\e[38;5;208m'   # Purple
Cyan='\e[38;5;6m'	# Cyan
Color_Off='\e[0m'       # Text Reset
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:$HOME/scripts/cmd
export EDITOR=vim
alias fehh='feh --bg-fill'
alias ls='ls --color=al -l'
alias ..='cd ..'
alias ...='cd ../..'
alias pip='pip3'
alias python='python3'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacu="sudo pacman -Syyu"
PS1="\[${Purple}\] \w ❯\[${Cyan}\]"
