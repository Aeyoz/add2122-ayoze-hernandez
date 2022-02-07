#!/usr/bin/env bash

NOMBRES=$(cat users.txt)


if [ "$1" = "-e" ]; then
    echo "Comprobando si los usuarios existen"
    for i in $NOMBRES; do
<<<<<<< HEAD
        echo "Comprobando si el usuario $i existe"
        id $i
    done
elif [ "$1" = "-c" ]; then
    for j in $NOMBRES; do
        echo=$(id $j || echo $?)
        if [ "$echo" = "1" ]; then
            echo "Creando usuario $j"
            useradd -g users -d /home/$j -m -s /bin/bash $j
        else
            echo "El usuario $j ya existe"
        fi
    done
elif [ "$1" = "-b" ]; then
    for l in $NOMBRES; do
        echo=$(id $l || echo $?)
        if ! [ "$echo" = "1" ]; then
            echo "Borrando usuario $l"
            userdel $l -r -f
        fi
    done
=======
        id $i
    done
elif [ "$1" = "-c" ]; then
    bash ./crear-usuarios28iter.sh
elif [ "$1" = "-b" ]; then
    bash ./borrar-usuarios28iter.sh
>>>>>>> b337613fcd725f65dfbfca61c486faff006a7876
fi
