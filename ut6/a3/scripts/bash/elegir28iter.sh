#!/usr/bin/env bash

NOMBRES=$(cat users.txt)


if [ "$1" = "-e" ]; then
    echo "Comprobando si los usuarios existen"
    for i in $NOMBRES; do
        id $i
    done
elif [ "$1" = "-c" ]; then
    bash ./crear-usuarios28iter.sh
elif [ "$1" = "-b" ]; then
    bash ./borrar-usuarios28iter.sh
fi
