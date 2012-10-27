#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Background image
hsetroot -fill $HOME/img/08.jpg &

# Kwallet
kwalletd &

# Keychain
eval `keychain --eval --clear id_rsa 1338F289`

# Akonadi
akonadictl start &

# Music Player Daemon
mpd &

# Hide mouse cursor when idle
unclutter -idle 4 &

# Window manager
xmonad
