#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Mouse cursor
xsetroot -cursor_name left_ptr

# Hide mouse cursor when idle
unclutter -idle 4 &

# Background image
hsetroot -fill $HOME/img/08.jpg &

# rxvt-unicode daemon
urxvtd -q -f -o &

# Window manager
xmonad
