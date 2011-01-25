shopt -s histappend
umask 0027

# Keep history clean
export HISTCONTROL='erasedups'
# Clean up for Apple X11 sometimes forgetting
export DISPLAY=:0.0
export PS1="\u@\h \[\e[33m\]\W\[\e[0m\] \[\`if [[ \$? = "0" ]]; then echo '\e[32m=)\e[0m'; else echo '\e[31m=(\e[0m'; fi\`\] \$ "

export TERM=xterm-color
export EDITOR="emacs"
export PATH="$PATH:/Users/nosmo/Portage/usr/bin:/Users/nosmo/Portage/bin:/Users/nosmo/Portage/sbin:/Users/nosmo/Portage/usr/sbin:/Users/nosmo/Portage/usr/games/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/opt/local/sbin:/Users/nosmo/bin:/Users/nosmo/SmartEiffel/bin:/usr/X11R6/bin:/usr/local/gwTeX/bin/i386-apple-darwin-current:/usr/local/mysql/bin:/Users/nosmo/Portage/usr/libexec/git-core"
export MANPATH="$MANPATH:/opt/local/man:~/Portage/usr/share/man"
export EPREFIX="/Users/nosmo/Portage"

alias grep=ack
alias s="sudo"

# Portage aliases
alias emacs="/Users/nosmo/Portage/usr/bin/emacs"
alias ll="/Users/nosmo/Portage/bin/ls -ALlsH --color"
alias ls="/Users/nosmo/Portage/bin/ls -ALH --color"
alias nmap="s /Users/nosmo/Portage/usr/bin/nmap"
alias tcsh="/Users/nosmo/Portage/bin/tcsh"
alias xterm="/Users/nosmo/Portage/usr/bin/uxterm -bg black -fg white"

alias top="top -o cpu"
alias su="/usr/bin/su"
alias eterm="Eterm --buttonbar off"
alias sshfs="/Applications/sshfs.app/Contents/Resources/sshfs-static"
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias torrentsync="find ~/Downloads/ -iname \*.torrent -exec scp \"{}\" zuppy:/home/nosmo/watch \; -exec rm \"{}\" \;"
alias rsyncbackup="rsync --progress --partial -rtv --rsh=ssh"
alias dmesg="s dmesg"
alias disable_cups="sudo launchctl unload -w /System/Library/LaunchDaemons/org.cups.cupsd.plist"

source ~/Portage/etc/profile.d/bash-completion.sh

function mkcd() {
  [ -n "$1" ] && { mkdir -p "$@" && cd "$1"; }
}

stty stop undef
stty start undef

#alias base64crk="perl -MMIME::Base64 -le 'print decode_base64(\"$0\")'"
#alias localtorrentsync="scp /Users/nosmo/Downloads/*.torrent 192.168.1.31:/home/nosmo/torrents && rm /Users/nosmo/Downloads/*.torrent"
#alias nmap="s ifconfig fw0 remove && s /Users/nosmo/Portage/usr/bin/nmap"
