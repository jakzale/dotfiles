# Start sway on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
    # Start gnome keyring daemon
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK

    # Fix issues with Java Applications
    export _JAVA_AWT_WM_NONREPARENTING=1

    exec systemd-cat --identifier=sway sway
fi
