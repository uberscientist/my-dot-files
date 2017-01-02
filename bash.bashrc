#
# /etc/bash.bashrc
#
source ~/.nvm/nvm.sh

export CAFFE_ROOT=/opt/caffe

# virtualenvwrapper stuff
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

#color descriptions to directories and files
export LS_OPTIONS='--color=auto'
eval `dircolors`

#completion
complete -cf man
complete -cf sudo

#env variables
PKG_CONFIG_PATH=/usr/include/:/usr/lib/
#PATH=$PATH:/usr/sbin/
PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/nak/.gem/ruby/1.9.1/bin:/opt/android-sdk/platform-tools:/home/nak/Msp430GCCopensource/bin"
# https://wiki.unrealengine.com/Building_On_Linux
#export PATH=$HOME/clones/UnrealEngine/Engine/Binaries/Linux:$PATH

# ESP and SMING stuff
export ESP_HOME=/opt/esp-open-sdk
export SMING_HOME=/opt/sming/Sming

# ESP8266
#export PATH=/opt/Espressif/crosstool-NG/builds/xtensa-lx106-elf/bin:$PATH
#export PATH=/home/nak/clones/esp-open-sdk/xtensa-lx106-elf/bin:$PATH

# anaconda
#export PATH=/opt/anaconda/bin:$PATH

# CUDA
export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH
export CPATH=/opt/cuda/include:$CPATH
export LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

export EDITOR=/usr/bin/vim

# Command aliases
alias sudo="sudo "
alias vi="vim -p"
alias ls="ls $LS_OPTIONS"
alias ll="ls $LS_OPTIONS -l"
alias la="ls $LS_OPTIONS -la"
alias xclip="xclip -selection c"

# SSH proxy shortcut
alias sock="ssh -ND 9999 nak@derse.siglr.net & firefox --private-window & cat /mnt/640/Seagate\ Backup\ Plus\ Drive/nak/pron/f/jwords.txt"

# VPS shell shortcuts
alias derse="ssh nak@derse.siglr.net"
alias prospit="ssh nak@prospit.siglr.net"
alias dallas="ssh nak@dallas.siglr.net"

alias install="sudo pacman -S"
alias update="sudo pacman -Syu"
alias upgrade="sudo pacman -U"
alias remove="sudo pacman -Rs"
alias pkginfo="sudo pacman -Qi"
alias burn="wodim -v dev=/dev/sr0"
alias dns-clear="sudo pdnsd-ctl empty-cache *"
alias svi="sudoedit"
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"

gca () {
  git add .
  git commit
}

toggletouchpad () {
  synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
}

anacondactl() {
    case $1 in
        start) echo "$PATH" | grep -q "/opt/anaconda/bin:" || export PATH="/opt/anaconda/bin:":$PATH ;;
        stop)  echo "$PATH" | grep -q "/opt/anaconda/bin:" && export PATH=${PATH/"\/opt\/anaconda\/bin:"/} ;;
        status) if [ $(echo $PATH | grep anaconda | wc -l) -gt 0 ] ; then echo "Anaconda python" ; else echo "Native python" ; fi ;;
        *) echo "Usage: anacondactl [start,stop,status]" ;;
    esac
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

export PATH="/opt/microchip/xc32/v1.21/bin":$PATH
