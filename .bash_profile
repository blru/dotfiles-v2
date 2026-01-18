#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# From https://github.com/YaLTeR/niri/discussions/2241
if [ -z "$DISPLAY" && "$(tty)" = "/dev/tty1" && -z "$NIRI_LOADED" ]; then
    export NIRI_LOADED=1

    PATH="$PATH:~/.cargo/bin"
    exec niri-session
fi
