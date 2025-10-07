#!/bin/sh

NAME=lddmodules

case "$1" in
    start)
        printf "Starting %s: " "$NAME"
        # Load scull module
        /usr/bin/scull_load
        # Load misc-modules
        /usr/bin/module_load faulty
        /usr/bin/module_load hello
        echo "OK"
        ;;
    stop)
        printf "Stopping %s: " "$NAME"
        /usr/bin/module_unload faulty
        /usr/bin/module_unload hello
        /usr/bin/scull_unload
        echo "OK"
        ;;
    *)
        echo "Usage: $(basename "$0") {start|stop}" >&2
        exit 1
esac

exit 0
