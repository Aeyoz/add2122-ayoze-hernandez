#!/usr/bin/env bash

NOMBRES=$(cat users.txt)


if [ "$1" = "-e" ]; then
    for i in $NOMBRES; do
        echo "Comprobando si el usuario $i existe"
        id  $i
    done
elif [ "$1" = "-c" ]; then
    for j in $NOMBRES; do
        echo "Creando usuario $j"
        useradd -g users -d /home/$j -m -s /bin/bash $j
    done
elif [ "$1" = "-b" ]; then
    for l in $NOMBRES; do
        echo "Borrando usuario $l"
        userdel	$l -r -f
    done
fi
