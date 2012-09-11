# MacPorts (precompiled, from http://www.macports.org/)
#  coreutils 8.19_0 (symlinks without the 'g' prefix in /opt/local/libexec/gnubin)
#  tmux 1.6_1
#  zsh 5.0.0_0
PATH1="/opt/local/bin:/opt/local/libexec/gnubin"

# Default OS X binaries
PATH2="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# Git (precompiled, from http://git-scm.com/)
PATH3="/usr/local/git/bin"

# Python 3.2.3 32- and 64-bit (precompiled, from http://www.python.org/download/releases/3.2.3/)
#  distribute (curl http://python-distribute.org/distribute_setup.py | python3)
#  pip 1.2.1 (curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python3)
#   flake8 (pipi flake8)
#   pytest (pipi pytest)
#   virtualenv (pipi virtualenv)
PATH4="/Library/Frameworks/Python.framework/Versions/3.2/bin"

# ~/bin
PATH5="$HOME/bin"

export PATH="$PATH1:$PATH2:$PATH3:$PATH4:$PATH5"
