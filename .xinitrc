#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Mouse cursor
xsetroot -cursor_name left_ptr

# Keyboard map
setxkbmap us -variant colemak

# VirtualBox guest
VBoxClient-all &

# Background image
sh $HOME/.fehbg &

# rxvt-unicode daemon
urxvtd -q -f -o &

# Window manager
xmonad
