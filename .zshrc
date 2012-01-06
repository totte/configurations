#---------------------------------------------------------------------------------------------------
# PATH
#---------------------------------------------------------------------------------------------------
if [[ $HOST != embepe* ]]; then
	export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$HOME/bin"
else
	export PATH="/opt/local/libexec/gnubin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$HOME/Library/Haskell/bin:/usr/X11/bin:/opt/local/bin:$HOME/bin"
fi

#---------------------------------------------------------------------------------------------------
# COLOURS
#---------------------------------------------------------------------------------------------------
autoload colors; colors;
eval "`dircolors -b ~/.dircolorsrc`"

#---------------------------------------------------------------------------------------------------
# GENERAL
#---------------------------------------------------------------------------------------------------
export PAGER=less
export EDITOR=vim
export LANG=en_GB.UTF-8
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;34'
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

#---------------------------------------------------------------------------------------------------
# ALIASES
#---------------------------------------------------------------------------------------------------
alias _='sudo'
alias l='ls -lh --color'
alias la='ls -lAh --color'
alias ..='cd ..'
alias df='df -h'
alias tmux='tmux attach'
alias v='vim'
alias :q='exit'
alias :e='vim'
alias :s='locate'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias rmdir='rmdir -v'
alias d='dirs -v'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias gull='git pull'
alias gush='git push'
alias gchb='git checkout -b'
alias gc='git commit -am'
alias gss='git stash save'
alias gsa='git stash apply' # Apply most recent or specify stash@{1}
alias gsl='git stash list'
alias gslc='git stash list clear'
alias guar='guar.sh'
alias gmap='gmap.sh'
alias gs='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gd='git diff'
alias gb='git branch'
alias ga='git add'
alias gr='git rm'
alias gch='git checkout'
bkp(){cp -v $1 ${1}.backup}
cmd_stats(){history | awk '{print $2}' | sort | uniq -c | sort -rn | head}
md(){mkdir -p $1; cd $1}
# TODO Host-specific shortcuts, rewrite to include pacman for archlinux and macports for mac
if [[ $HOST != embepe* ]]; then
	alias apts='sudo aptitude search'
	alias apti='sudo aptitude install'
	alias aptp='sudo aptitude purge'
	alias aptu='sudo aptitude update && sudo aptitude upgrade'
	alias poff='sudo /sbin/write-magic 0xdeadbeef && sudo /sbin/reboot'
fi

#---------------------------------------------------------------------------------------------------
# TAB COMPLETION
#---------------------------------------------------------------------------------------------------
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

#---------------------------------------------------------------------------------------------------
# TITLES
#---------------------------------------------------------------------------------------------------
tmux_title="%16<..<%~%<<"
term_tab_title="%m"
term_title=" Terminal "

function title(){
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$tmux_title:q\e\\"
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
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

#---------------------------------------------------------------------------------------------------
# ZSH VCS_INFO MODULE
#---------------------------------------------------------------------------------------------------
autoload -Uz vcs_info

#zstyle	':vcs_info:*+*:*'				debug true
zstyle	':vcs_info:*'					enable git
zstyle	':vcs_info:git*'				formats					'%fon %F{2}%b%f%c%u%m'
zstyle	':vcs_info:git*'				actionformats			'%fon %F{2}%b%f:%F{2}%a%f%c%u%m'
zstyle	':vcs_info:git*:*'				stagedstr				' (staged)'
zstyle	':vcs_info:git*:*'				unstagedstr				' (unstaged)'
zstyle	':vcs_info:git*:*'				get-revision true
zstyle	':vcs_info:git*:*'				check-for-changes true
zstyle	':vcs_info:git*+set-message:*'	hooks git-stash git-untracked

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

#---------------------------------------------------------------------------------------------------
# PROMPT
#---------------------------------------------------------------------------------------------------
# Root or user?
function rou(){
	if [[ $USER = 'root' ]] ; then
		echo "%{$fg[red]%}"
	else
		echo "%{$fg[green]%}"
	fi
}

# Display ± if we're in a git repository and » at all other times
function prompt_character(){
    git branch >/dev/null 2>/dev/null && echo '%{$fg[white]%}±%{$reset_color%}' && return
	echo '%{$fg[white]%}»%{$reset_color%}'
}

# TODO S. Losh had a cosmetic fix for displaying virtualenvs in % which may come in handy
# when I start using those.
function set_prompt(){
	PROMPT="$(rou)%n %{$reset_color%}at $(rou)%m %{$reset_color%}in $(rou)%~ ${vcs_info_msg_0_}
 %{$reset_color%}$(prompt_character) "
}

#---------------------------------------------------------------------------------------------------
# HOOKS
#---------------------------------------------------------------------------------------------------
autoload -U add-zsh-hook

add-zsh-hook	preexec		title_preexec
add-zsh-hook	precmd		title_precmd
add-zsh-hook	precmd		prompt_precmd
add-zsh-hook	precmd		set_prompt
