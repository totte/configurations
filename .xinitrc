#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Mouse cursor
xsetroot -cursor_name left_ptr

# Keyboard map (change to US Colemak)
setxkbmap -layout sv

# Background image
eval `cat $HOME/.fehbg` &

# Compositing effects
xcompmgr -c &

# Window manager
xmonad
