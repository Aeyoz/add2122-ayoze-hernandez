#!/usr/bin/env bash

figlet ayoze28

NOMBRES=$(cat users.txt)

for i in $NOMBRES; do
    echo=$(id $i || echo $?)
    if ! [ "$echo" = "1" ]; then
        echo "Borrando usuario $i"
        userdel $i -r -f
    else
        echo "El usuario $i no existe"
    fi
done
