#-------------------------------------------------------------------------------------
# PATH
#-------------------------------------------------------------------------------------

# System executables
PATH0="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# My executables
PATH1="$HOME/bin"

export PATH="$PATH0:$PATH1"

#-------------------------------------------------------------------------------------
# COLOURS
#-------------------------------------------------------------------------------------
autoload colors; colors;
eval "`dircolors -b ~/.dircolorsrc`"

#-------------------------------------------------------------------------------------
# GENERAL
#-------------------------------------------------------------------------------------
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
setopt prompt_subst
setopt correctall
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt extendedglob

#-------------------------------------------------------------------------------------
# ALIASES
#-------------------------------------------------------------------------------------
alias rezsh='. ~/.zshrc'
alias _='sudo '
alias l='ls -lh --color'
alias la='ls -lAh --color'
alias -- -='cd -'
alias ..='cd ..'
alias df='df -h'
alias g='git'
alias tmux='tmux attach'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias rmdir='rmdir -v'
alias d='dirs -v'
bu(){cp -v $1 ${1}.backup}
cmds(){history | awk '{print $2}' | sort | uniq -c | sort -rn | head}
md(){mkdir -p $1; cd $1}

# OS-specific aliases
if [[ $(uname) == "Darwin" ]]; then
    # Mac OS X
    alias pkgs='port search' # Search
    alias pkgi='sudo port install' # Install
    alias pkgu='sudo port selfupdate && sudo port upgrade outdated' # Update & Upgrade
    alias pkgr='sudo port uninstall --follow-dependencies' # Remove package and unused dependencies
    alias pkgl='port installed' # List installed packages
    alias python='/usr/local/bin/python3'
    alias pip='pip-3.2'
    alias pips='pip-3.2 search'
    alias pipi='pip-3.2 install'
    alias pipu='pip-3.2 install -U'
    alias pipr='pip-3.2 uninstall'
    alias pipl='pip-3.2 freeze'
    alias v='mvim'
elif [[ $(uname) == "Linux" ]]; then
    alias pips='pip search'
    alias pipi='pip install'
    alias pipu='pip install -U'
    alias pipr='pip uninstall'
    alias pipl='pip freeze'
    alias v='vim'
    case $(lsb_release -d | cut -f2 | cut -d " " -f1) in
        (Arch) # Arch Linux
            alias equa='alsamixer -D equal'
            alias pkgs='pacman -Ss' # Search
            alias pkgi='sudo pacman -S' # Install
            alias pkgu='sudo pacman -Syu' # Update & Upgrade
            alias pkgr='sudo pacman -Rns' # Remove package, configuration backups and unused dependencies
            alias pkgl='pacman -Q' # List installed packages
            alias pkgd='whoneeds' # List packages depending on specified package
            alias poweroff='sudo systemctl poweroff'
            alias reboot='sudo systemctl reboot'
            alias nw='wicd-curses'
            ;;
        (Debian|Ubuntu) # Debian and Ubuntu
            alias pkgs='aptitude search' # Search
            alias pkgi='sudo aptitude install' # Install
            alias pkgu='sudo aptitude update && sudo aptitude upgrade' # Update & Upgrade
            alias pkgr='sudo aptitude purge' # Remove package, configuration files and unused dependencies
            alias pkgl='aptitude search -F "%p" "~i"' # List installed packages
            alias reboot='sudo shutdown -r now'
            alias shutdown='sudo shutdown -h now'
            ;;
    esac
fi

# Host-specific aliases
if [[ ${HOST:r} == "betre" ]]; then
    alias poff='sudo /sbin/write-magic 0xdeadbeef && sudo /sbin/reboot'
fi

#-------------------------------------------------------------------------------------
# TAB COMPLETION
#-------------------------------------------------------------------------------------
autoload compinit
compinit

# Case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# Use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
    "$_global_ssh_hosts[@]"
    "$_ssh_hosts[@]"
    "$_etc_hosts[@]"
    `hostname`
    localhost
)
zstyle ':completion:*:hosts' hosts $hosts

#-------------------------------------------------------------------------------------
# KEYBINDINGS
#-------------------------------------------------------------------------------------
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

#-------------------------------------------------------------------------------------
# TITLES
#-------------------------------------------------------------------------------------
tmux_title="%16<..<%~%<<"
term_tab_title="%m"
term_title="Terminal"

function title(){
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$tmux_title:q\e\\"
  elif [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$term_title:q\a"
    print -Pn "\e]1;$term_tab_title:q\a"
  fi
}

function title_precmd(){
  title $tmux_title $term_tab_title $term_title
}

function title_preexec(){
  emulate -L zsh
  setopt extended_glob
  local tmux_title=${1[(wr)^(*=*|sudo|ssh|-*)]}
  title $tmux_title $term_tab_title $term_title
}

#-------------------------------------------------------------------------------------
# ZSH VCS_INFO MODULE
#-------------------------------------------------------------------------------------
autoload -Uz vcs_info

#zstyle    ':vcs_info:*+*:*'                debug true
zstyle    ':vcs_info:*'                    enable git
zstyle    ':vcs_info:git*'                formats                    '%fon $(rou)%b%f%c%u%m'
zstyle    ':vcs_info:git*'                actionformats            '%fon $(rou)%b%f:$(rou)%a%f%c%u%m'
zstyle    ':vcs_info:git*:*'                stagedstr                ' (staged)'
zstyle    ':vcs_info:git*:*'                unstagedstr                ' (unstaged)'
zstyle    ':vcs_info:git*:*'                get-revision true
zstyle    ':vcs_info:git*:*'                check-for-changes true
zstyle    ':vcs_info:git*+set-message:*'    hooks git-stash git-untracked

# Display count of stashed changes
function +vi-git-stash(){
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        if [[ $stashes > 1 ]] ; then
            hook_com[misc]+=" (${stashes} stashes)"
        else
            hook_com[misc]+=" (${stashes} stash)"
        fi
    fi
}

# Display message if untracked files are present
function +vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[unstaged]+=" (untracked files present)"
    fi
}

function prompt_precmd(){
    vcs_info
}

#-------------------------------------------------------------------------------------
# PROMPT
#-------------------------------------------------------------------------------------
# Root or user?
function rou(){
    if [[ $UID -eq 0 ]] ; then
        echo "%{$fg[magenta]%}"
    else
        echo "%{$fg[blue]%}"
    fi
}

# Display ± if we're in a git repository and » at all other times
function prompt_character(){
    git branch >/dev/null 2>/dev/null && echo '%{$fg[white]%}±%{$reset_color%}' && return
    echo '%{$fg[white]%}»%{$reset_color%}'
}

# Set the prompt
function set_prompt(){
    PROMPT="$(rou)%n %{$reset_color%}at $(rou)%m %{$reset_color%}in $(rou)%~ ${vcs_info_msg_0_}
 %{$reset_color%}$(prompt_character) "
}

#-------------------------------------------------------------------------------------
# HOOKS
#-------------------------------------------------------------------------------------
autoload -U add-zsh-hook

add-zsh-hook    preexec    title_preexec
add-zsh-hook    precmd     title_precmd
add-zsh-hook    precmd     prompt_precmd
add-zsh-hook    precmd     set_prompt
