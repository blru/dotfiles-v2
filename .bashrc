#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if test -f /usr/share/nvm/init-nvm.sh; then
    source /usr/share/nvm/init-nvm.sh
fi

alias peaclock="peaclock --config-dir ~/.config/peaclock"
alias cd-config='cd ~/.dotfiles/.config'
alias cd-studio-user='cd ~/.var/app/org.vinegarhq.Vinegar/data/vinegar/prefixes/studio/drive_c/users/steamuser'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias restow-dotfiles='cd ~/.dotfiles; stow -R .; cd -'

HISTCONTROL=ignorespace
PS1='\[\e[92m\][\[\e[92m\]\u\[\e[92m\]@\[\e[92m\]\h\[\e[92m\]]\[\e[94m\][\[\e[94m\]\w\[\e[94m\]]\[\e[0m\] \[\e[37;2m\]\[\e[0m\] '
