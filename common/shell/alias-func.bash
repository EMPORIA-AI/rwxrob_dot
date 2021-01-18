
############################## All Aliases ##############################

# Keep in mind that aliases *cannot* be used from anything but the
# currently active shell (not subprocesses or any system exec() calls).
# Generally exported functions should be used instead (as recommended by
# the bash man page). Every alias you add is one additional thing that
# won't work on a remote system you don't own or haven't customized.
# Better to memorize the switch of commands so your fingers know what to
# do on *any* system. (Also the reason to learn vi over emacs.)

unalias -a
alias more='less -R'
alias ducks='du -sh * | sort -hr | head -11' # 🦆
alias tweet='twitter update'

alias coc="egrep '^\\* ' '$REPOS/gitlab.com/rwxrob/robs.io/coc/README.md'"

# dropped ls aliases because need to memorize switches
alias ls='ls -h --color=auto'

alias pie='perl -p -i -e '
alias grep='grep -i --colour=auto'
alias egrep='egrep -i --colour=auto'
alias fgrep='fgrep -i --colour=auto'
alias curl='curl -L'

alias ssh-keygen="ssh-keygen -t ed25519"

alias '?'=duck
alias '??'=google
alias '???'=bing

alias bat='\
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | \
  grep -E "state|to\ full|percentage"'
alias free='free -h'
alias df='df -h'
alias syserrors="sudo journalctl -p 3 -xb"
alias sysderrors="sudo systemctl --failed"
alias top="htop"
alias s="wee"
alias discord="$(which discord) &> $(mktemp /tmp/discord.XXX.$(date +%s)) &"
alias obs="$(which obs) &> $(mktemp /tmp/obs.XXX.$(date +%s)) &"
alias chmox="chmod u+x"


# Igor Chubin is a god.

alias ipinfo="curl ipinfo.io"
alias weather="curl wttr.in"

cheat () {
  where="$1"; shift
  IFS=+ curl "http://cht.sh/$where/ $*"
} && export -f cheat

which vim &>/dev/null && alias vi=vim


alias tmatrix="tmatrix -s 15 --fade -c default -C red"
alias cmatrix="cmatrix -b -C red -u 6"

alias vimpluginstall="vim +':PlugInstall' +':q!' +':q!'"

envx () {
  local envfile="$1"
  if [[ ! -e "${envfile}" ]]; then
    if [[ ! -e "$HOME/.env" ]]; then
      echo "file not found: ${envfile}"
      return
    fi
    envfile="$HOME/.env"
  fi
  while IFS= read line; do
    name=${line%%=*}
    value=${line#*=}
    if [[ -z "${name}" || $name =~ ^# ]]; then
      continue
    fi
    export "$name"="$value"
  done < "${envfile}"
} && export -f envx

if [[ -e "$HOME/.env" ]]; then
  envx $HOME/.env
fi
