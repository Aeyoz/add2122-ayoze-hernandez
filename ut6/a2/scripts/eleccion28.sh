#!/usr/bin/env bash

echo "
Qué desea hacer?

1) Crear usuarios (c)
2) Borrar usuaros (b)
3) Salir (s)
"

read OPTION

if [ "$OPTION" = "c" ]; then
    bash /home/ayoze/users28/crear-usuarios28.sh
elif [ "$OPTION" = "b" ]; then
    bash /home/ayoze/users28/borrar-usuarios28.sh
elif [ "$OPTION" = "s" ]; then
    echo "Saliendo del programa"
    exit 0
else
    echo "La opción introducida es incorrecta"
    ls
    exit 1
fi

