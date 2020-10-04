# Start sway on tty2
if [ "$(tty)" = "/dev/tty2" ]; then
    exec systemd-cat --identifier=sway sway
fi
