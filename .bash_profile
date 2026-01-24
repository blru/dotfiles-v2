#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH="$PATH:~/.cargo/bin"

# From https://github.com/YaLTeR/niri/discussions/2241
if [ -z "$DISPLAY" && "$(tty)" = "/dev/tty1" && -z "$NIRI_LOADED" ]; then
    export NIRI_LOADED=1

    exec niri-session
fi
