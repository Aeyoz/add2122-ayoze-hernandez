#!/usr/bin/env bash

NOMBRES=$(cat users.txt)

for i in $NOMBRES; do
    echo "Borrando usuario $i"
    userdel $i -r -f
done
