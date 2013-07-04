#
# /etc/bash.bashrc
#

#color descriptions to directories and files
export LS_OPTIONS='--color=auto'
eval `dircolors`

#completion
complete -cf man
complete -cf sudo

#env variables
PKG_CONFIG_PATH=/usr/include/:/usr/lib/
#PATH=$PATH:/usr/sbin/
PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/nak/.gem/ruby/1.9.1/bin:/opt/android-sdk/platform-tools"
export EDITOR=/usr/bin/vim

# Command aliases
alias BOINC="/home/nak/Downloads/BOINC/run_manager"
alias sudo="sudo "
alias python="python2"
alias vi="vim -p"
alias ls="ls $LS_OPTIONS"
alias ll="ls $LS_OPTIONS -l"
alias la="ls $LS_OPTIONS -la"
alias xclip="xclip -selection c"

# SSH proxy shortcut
alias sock="ssh -ND 9999 nak@hivego.info"

# VPS shell shortcuts
alias shire="ssh nak@shire.siglr.net"
alias keron="ssh nak@keron.siglr.net"
alias tf2="ssh tf2server@keron.siglr.net"
alias prospit="ssh nak@prospit.siglr.net"
alias hoth="ssh nak@hoth.siglr.net"
alias freeze1="ssh nak@freeze1.siglr.net"
alias freeze2="ssh nak@freeze2.siglr.net"
alias littleman="ssh nak@199.167.30.190"

alias install="sudo pacman -S"
alias update="sudo pacman -Syu"
alias upgrade="sudo pacman -U"
alias remove="sudo pacman -Rs"
alias pkginfo="sudo pacman -Qi"
alias burn="wodim -v dev=/dev/sr0"
alias dns-clear="sudo pdnsd-ctl empty-cache *"
alias svi="sudoedit"

# Functions
gca () {
  git add .
  git commit
}

rmdns () {
# Removes domain and www.domain from the DNS cache
  sudo pdnsd-ctl record $1 delete;
  sudo pdnsd-ctl record www.$1 delete;
}

mk430 () {
  FILENAME=`echo $1 | sed -e 's/\..*//g'`
  msp430-gcc -mmcu=msp430f2274 -o $FILENAME.elf $1 
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                                                        
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

[ -r /etc/bash_completion   ] && . /etc/bash_completion
