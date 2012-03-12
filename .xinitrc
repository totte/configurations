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
hsetroot -fill $HOME/cfg/misc/background.jpg &

# Composite manager
compton -CGb &

# Conky
conky &

# rxvt-unicode daemon
urxvtd -q -f -o &

# Window manager
xmonad
