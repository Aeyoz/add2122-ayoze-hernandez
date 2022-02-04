#!/usr/bin/env bash

figlet ayoze28

NOMBRES=$(cat users.txt)

for i in $NOMBRES; do
    echo=$(id $i || echo $?)
    if [ "$echo" = "1" ]; then
        echo "Creando usuario $i"
        useradd $i
    else
        echo "El usuario $i ya existe"
    fi
done
