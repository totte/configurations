#-------------------------------------------------------------------------------
# Path
#-------------------------------------------------------------------------------
export PATH="$HOME/code/scripts:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

#-------------------------------------------------------------------------------
# Miscellaneous
#-------------------------------------------------------------------------------
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export GREP_OPTIONS='--color=auto'
export LANG='en_GB.UTF-8'
setopt prompt_subst
setopt correctall
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt extendedglob

#-------------------------------------------------------------------------------
# Colours
#-------------------------------------------------------------------------------
autoload colors; colors;
#LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;\
#33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
#export LS_COLORS

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
# Aliases
#-------------------------------------------------------------------------------
alias _='sudo'
alias -- -='cd -'
alias ..='cd ..'
alias cp='cp -iv'
alias d='dirs -v'
alias df='df -h'
alias du='du -ch'
alias g='git'
alias l='ls -lh --color'
alias la='ls -Alh --color'
alias ln='ln -iv'
alias lsblk='lsblk --output NAME,MOUNTPOINT,LABEL,SIZE,FSTYPE,TYPE,MODEL'
alias md='mkdir -pv'
alias mount='mount | column -t'
alias mp='makepkg -cs'
alias mv='mv -iv'
alias ping='ping -c 8'
alias ports='netstat -alnptu'
alias q='/usr/bin/vim -g'
alias rez='. ~/.zshrc'
alias rm='rm -Iv'
alias rmd='rmdir -v'
alias tm='tmux attach'
alias v='/usr/bin/vim'
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
bu(){cp -v $1 ${1}.backup}
cmds(){history | awk '{print $2}' | sort | uniq -c | sort -rn | head}
mdcd(){mkdir -pv $1; cd $1}

# Python packages (/usr/lib/python3.x/site-packages)
alias pipi='sudo pip install' # Install
alias pipl='pip freeze' # List
alias pipr='sudo pip uninstall' # Remove
alias pips='pip search' # Search
alias pipu='sudo pip install -U' # Update

# OS-specific aliases
case $(lsb_release -d | cut -f2 | cut -d " " -f1) in
    (Arch)
        alias alsae='alsamixer -D equal'
        alias alsam='alsamixer'
        alias jc='sudo journalctl'
        alias mpd='mpd ~/.config/mpd.conf'
        alias py='ipython'
        alias pkgc='sudo pacman -Sc' # Clean cache
        alias pkgd='whoneeds' # List dependants
        alias pkgi='sudo pacman -S' # Install
        alias pkgl='pacman -Q' # List
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
function _update_ps1()
{
    export PROMPT="$(~/.config/powerprompt.py $?)"
}
precmd()
{
    _update_ps1
}
