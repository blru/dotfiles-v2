#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH=$PATH:~/.cargo/bin

if uwsm check may-start; then
  exec uwsm start niri.desktop
fi
