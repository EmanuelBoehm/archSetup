#!/bin/bash
## DEFAULTS
WM="leftwm"
TERMINAl="kitty"
EDITOR="nvim"
BROWSER="qutebrowser"

while [ -n "$1" ]; do 

	case "$1" in
	-wm | --windowmanager ) WM="$2"; shift ;;
	-t | --terminal ) 	TERMINAL="$2"; shift ;;
	-e | --editor ) 	EDITOR="$2"; shift ;;
	-b | --browser ) 	BROWSER="$2"; shift ;;
	-h | --help ) 		echo "USAGE: install -wm [windowmanager], -t [terminal], -e [editor], -b [browser], -h [help]" ;;
	(--)			shift; break ;;
	(*) 			echo "Option $1 not recognized" ;;
	esac
	shift
done
#dependencies
sudo pacman -S python python-pip git make-devel xorg xorg-xinit zsh 
sudo pip install pywal
## running installer instances
./installer/terminal $TERMINAL &
./installer/browser $BROWSER &
./installer/editor $EDITOR &
./installer/wm $WM &

