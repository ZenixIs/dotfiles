#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
# Sources

source "/home/$USER/.zsh/zsh-git-prompt/zshrc.sh"
#source "/home/helix/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

## Enabling CTRL + S
#
stty -ixon

## Display red dot while completion in running
COMPLETION_WAITING_DOTS="true"

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
HISTFILE=/$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=1000
setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never beep
setopt NO_BEEP

## CD with only the name
setopt AUTO_CD

## Loading completion rules
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
autoload -Uz compinit
compinit

autoload -U bashcompinit
bashcompinit

zstyle ':completion:*' menu select
zstyle ':completion:*:warnings' format 'Can not find completion rules.'
zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*' group-name ''

## Loading colors, for the prompt.
autoload -U colors
colors

PROMPT='%B(%{$fg[red]%}%T%{$reset_color%}%B) - (%{$fg[cyan]%}%m%{$reset_color%}%B) %~ %b$(git_super_status) %B>%b '

## Configuring aliases
alias ls='ls --color=always'
alias df="df -h"
alias la='ls --color=always -la'
alias grep='grep --color=auto'
alias emacs="emacs -nw"
alias blih="blih -u alexandre.bedel@epitech.eu"
alias yay="yay --color=always"
alias valeak="valgrind --leak-check=full"

## Auto cd after git clone
# https://unix.stackexchange.com/questions/97920/how-to-cd-automatically-after-git-clone
function git
{
	local tmp=$(mktemp)
	local repo_name
	if [ "$1" = "clone" ]; then
		/usr/bin/git "$@" --progress 2>&1 | tee $tmp
		repo_name=$(awk -F\' '/Cloning into/ {print $2}' $tmp)
		rm $tmp
		cd $repo_name
	else
		/usr/bin/git "$@"
	fi
}

# Git ssh
#
#eval $(ssh-agent) > /dev/null
#ssh-add ~/.ssh/github_key 2> /dev/null
