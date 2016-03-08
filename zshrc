#EXPORTS
export MPD_HOST=192.168.0.11
export EDITOR=vim
#HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY

#PATH

export PATH="$HOME/bin:${PATH}"

#COMPLETION

zmodload zsh/complist 
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select 
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle :compinstall filename '${HOME}/.zshrc'

# HISTORY
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# fix zsh annoying history behavior
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

bindkey "\e[3~" delete-char
bindkey "e[1~" beginning-of-line
bindkey "e[4~" end-of-line
bindkey "e[2~" quoted-insert
bindkey "e[5C" forward-word
bindkey "eOc" emacs-forward-word
bindkey "e[5D" backward-word
bindkey "eOd" emacs-backward-word
bindkey "ee[C" forward-word
bindkey "ee[D" backward-word
bindkey "^H" backward-delete-word
path+=/home/elkoraco/bin


#PROMPT
autoload -U promptinit
promptinit
autoload -U colors 
colors
PROMPT="%{$fg[white]$ %}%~%{$reset_color%} "

#LS COLORS
export LSCOLORS="Gxfxcxdxbxegedabagacad"

if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  if [[ "$(uname -s)" == "NetBSD" ]]; then
    # On NetBSD, test if "gls" (GNU ls) is installed (this one supports colors);
    # otherwise, leave ls as is, because NetBSD's ls doesn't support -G
    gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
  elif [[ "$(uname -s)" == "OpenBSD" ]]; then
    # On OpenBSD, "gls" (ls from GNU coreutils) and "colorls" (ls from base, 
    # with color and multibyte support) are available from ports.  "colorls"  
    # will be installed on purpose and can't be pulled in by installing 
    # coreutils, so prefer it to "gls".
    gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
    colorls -G -d . &>/dev/null 2>&1 && alias ls='colorls -G'
  else
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
  fi
fi

#ALIASES

alias syu='sudo pacman -Syu'
alias in='sudo pacman -S'
alias rmv='sudo pacman -Rs'
alias dlna='minidlnad -f /home/elkoraco/.config/minidlna/minidlna.conf -P /home/elkoraco/.config/minidlna/minidlna.pid'
alias ssc='sudo systemctl'
alias sc='systemctl'
alias mp='mpd ~/.config/mpd/mpd.conf'
alias ..='cd ..'
alias ...='cd ../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g la='ls -al'
alias ef='ps -ef | grep'
alias -g bmi='burgaur -mi'
alias -g bsi='burgaur -si'
alias -g bsu='burgaur -su'
alias -g cws='cower -s'
