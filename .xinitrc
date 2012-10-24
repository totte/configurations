#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Kwallet
kwalletd &

# Keychain
eval `keychain --eval --clear id_rsa 1338F289`

# Hide mouse cursor when idle
unclutter -idle 4 &

# Background image
hsetroot -fill $HOME/img/08.jpg &

# Akonadi
akonadictl start &

# Music Player Daemon
mpd &

# Window manager
xmonad
