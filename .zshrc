#-------------------------------------------------------------------------------
# Path
#-------------------------------------------------------------------------------
export PATH="$HOME/bin:$HOME/.local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

#-------------------------------------------------------------------------------
# Miscellaneous
#-------------------------------------------------------------------------------
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export GREP_OPTIONS='--color=auto'
export LANG='en_GB.UTF-8'
export VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
export WORKON_HOME='~/virtual_environments'
export VIRTUAL_ENV_DISABLE_PROMPT=true

# Python virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh

setopt prompt_subst
setopt correctall
setopt auto_menu
setopt autocd
setopt complete_in_word
setopt always_to_end
setopt extendedglob

#-------------------------------------------------------------------------------
# Colours
#-------------------------------------------------------------------------------
autoload colors; colors;

#-------------------------------------------------------------------------------
# History
#-------------------------------------------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

#-------------------------------------------------------------------------------
# Less for reading man pages
#-------------------------------------------------------------------------------
man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;32m") \
    LESS_TERMCAP_so=$(printf "\e[47;30m") \
    LESS_TERMCAP_us=$(printf "\e[1;33m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    man "$@"
}

#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------
alias _='sudo'
alias -- -='cd -'
alias ..='cd ..'
alias :d='/usr/bin/vim -gd' # gvim diff mode
alias :e='/usr/bin/vim -g' # gvim
alias b='backup' # personal
alias cc='compile' # personal
alias ccd='compile_debug' # personal
alias cp='cp -iv' # interactive, verbose cp
alias d='dirs -v' # shell built-in, display remembered directories
alias df='df -h' # disk space usage for the file system
alias du='du -ch' # disk space usage for the directory tree
alias g='git'
alias h='commands_history' # personal
alias l='ls -lh --color --group-directories-first'
alias la='ls -Alh --color --group-directories-first'
alias ln='ln -iv' # interactive, verbose ln
alias lsblk='lsblk --output NAME,MOUNTPOINT,LABEL,SIZE,FSTYPE,TYPE,MODEL'
alias m='./manage.py' # Django timesaver
alias md='mkdir -pv' # create parent directories as needed, verbose mkdir
alias mount='mount | column -t' # list mounted file systems, columnated
alias mp='makepkg -cs' # arch/chakra-specific
alias mv='mv -iv' # interactive, verbose mv
alias ping='ping -c 8' # ping eight times
alias ports='sudo netstat -alnptu' # list open ports
alias rez='source ~/.zshrc' # reload .zshrc
alias rm='rm -Iv' # semi-interactive, verbose rm
alias rmd='rmdir -v' # verbose rmdir
alias t='tree -I "*pyc*"' # tree view
alias tm='tmux attach' # attach to existing tmux
alias tv='tabview' # curses csv file viewer
alias users='column -ts: /etc/passwd' # list system users in a legible fashion
alias ve='workon' # Find a way to make no argument run 'deactivate'

# Functions
backup(){cp -iv --backup=numbered $1 ${1}~}
commands_history(){history | awk '{print $2}' | sort | uniq -c | sort -rn | head}
compile(){g++ -pedantic -std=c++11 -Wall -Weffc++ -Werror -Wextra "${1}" -o "${1%%.cpp}"}
compile_debug(){g++ -g -pedantic -std=c++11 -Wall -Weffc++ -Werror -Wextra "${1}" -o "${1%%.cpp}"}
find_world_writables(){sudo find / -perm 777 -a \! -type s -a \! -type l -a \! \( -type d -a -perm 1777 \)}
mdcd(){mkdir -pv $1; cd $1}
unwrap(){
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -xvjf $1;;
            *.tar.gz)   tar -xvzf $1;;
            *.tar.xz)   tar -xvJf $1;;
            *.tar)      tar -xvf $1;;
            *.tbz2)     tar -xvjf $1;;
            *.tgz)      tar -xvzf $1;;
            *.zip)      unzip $1;;
            *.bz2)      bunzip2 $1;;
            *.gz)       gunzip $1;;
            *.rar)      rar -x $1;;
            *.Z)        uncompress $1;;
            *.7z)       7z -x $1;;
            *)          echo "'$1': Unknown format.";;
        esac
    else
        echo "'$1': Invalid format."
    fi
}
wrap(){tar -cvzf "${1%%/}.tar.gz" "${1%%/}/";}

# Python 3 packages (/usr/lib/python3.x/site-packages)
alias pip3i='sudo pip3 install' # Install
alias pip3l='pip3 freeze' # List
alias pip3r='sudo pip3 uninstall' # Remove
alias pip3s='pip3 search' # Search
alias pip3u='sudo pip3 install -U' # Update

# Python 2 packages (/usr/lib/python2.x/site-packages)
alias pip2i='sudo pip2 install' # Install
alias pip2l='pip2 freeze' # List
alias pip2r='sudo pip2 uninstall' # Remove
alias pip2s='pip2 search' # Search
alias pip2u='sudo pip2 install -U' # Update

# OS-specific aliases
case $(lsb_release -d | cut -f2 | cut -d " " -f1) in
    (Arch|Chakra)
        alias alsae='alsamixer -D equal'
        alias alsam='alsamixer'
        alias jc='sudo journalctl'
        alias mpd='mpd ~/.config/mpd.conf'
        alias py='python3'
        alias pkgc='sudo pacman -Sc' # Clean cache
        alias pkgi='sudo pacman -S' # Install
        alias pkgl='pacman -Q' # List
        alias pkgm='sudo pacman -Sii' # View meta
        alias pkgr='sudo pacman -Rns' # Remove
        alias pkgs='pacman -Ss' # Search
        alias pkgu='sudo pacman -Syu' # Update
        alias pkgy='sudo pacman -Syy' # Force synchronization
        alias rename='perl-rename' # /usr/bin/rename isn't the one I'm used to
        alias sc='sudo systemctl'
        alias syso='sudo systemctl poweroff'
        alias sysr='sudo systemctl reboot'
        alias syss='sudo pm-suspend'
        ;;
    (Debian|Ubuntu)
        alias pkgi='sudo aptitude install' # Install
        alias pkgl='aptitude search -F "%p" "~i"' # List installed packages
        alias pkgr='sudo aptitude purge' # Remove
        alias pkgs='aptitude search' # Search
        alias pkgu='sudo aptitude update && sudo aptitude upgrade' # Update
        alias syso='sudo shutdown -h now'
        alias sysr='sudo shutdown -r now'
        ;;
esac

# Host-specific aliases
if [[ ${HOST:r} == "bramble" ]]; then
    alias syso='sudo /sbin/write-magic 0xdeadbeef && sudo /sbin/reboot'
fi

#-------------------------------------------------------------------------------
# Tab completion
#-------------------------------------------------------------------------------
autoload compinit
compinit

# Case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'\
'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack\
path-directories
cdpath=(.)

# Use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/\
ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)\
"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/\
hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
    "$_global_ssh_hosts[@]"
    "$_ssh_hosts[@]"
    "$_etc_hosts[@]"
    `hostname`
    localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Show blue dots while loading...
expand-or-complete-with-dots() {
    echo -n " $fg[blue]...$reset_color"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#-------------------------------------------------------------------------------
# Keybindings
#-------------------------------------------------------------------------------
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line

# Make the delete key work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------
# OS-specific prompt commands
case $(lsb_release -d | cut -f2 | cut -d " " -f1) in
    (Arch|Chakra)
        . /usr/share/zsh/site-contrib/powerline.zsh
        ;;
    (Debian|Ubuntu)
        . ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
        ;;
esac
