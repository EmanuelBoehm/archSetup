#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
#set path and get monitor names globally saved
export PATH=/home/emi/.local/bin:/home/emi/.cargo/bin:/home/emi/.my_bin:$PATH
var=$(get_monitors)
export mon1="$(echo $var | head -n 1 | awk '{print $1}')"
export mon2="$(echo $var | tail -n 1 | awk '{print $2}')"
#@self
xsetroot -cursor_name left_ptr &
xset +fp /home/emi/.fonts
xset fp rehash

dualM flip
# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#remap caps lock
setxkbmap -option caps:escape
setxkbmap -option escape:caps
export XDG_CURRENT_DESKTOP=Budgie:GNOME
exec bspwm
#exec dbus-launch $HOME/prg/leftwm/target/debug/leftwm
