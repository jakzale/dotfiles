# Start sway on tty2
if [ "$(tty)" = "/dev/tty2" ]; then
    # Start gnome keyring daemon
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
    exec systemd-cat --identifier=sway sway
fi
