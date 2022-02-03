#!/usr/bin/env bash

figlet ayoze28

NOMBRES=$(cat users.txt)

FICHERO=$(cat /etc/passwd)

for i in $NOMBRES; do
    echo "Creando usuario $i"
    useradd -g users -d /home/$i -m -s /bin/bash $i
done
