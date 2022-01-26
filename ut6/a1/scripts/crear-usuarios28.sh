!/usr/bin/env bash

clear

sleep 1s

echo "Ejecutando script de creación de usuarios"

useradd -g users -d /home/ayoze1 -m -s /bin/bash ayoze1
echo "Creando usuario ayoze1"
echo "ayoze1:ayoze1" | chpasswd

useradd -g users -d /home/ayoze2 -m -s /bin/bash ayoze2
echo "Creando usuario ayoze2"
echo "ayoze2:ayoze2" | chpasswd

useradd -g users -d /home/ayoze3 -m -s /bin/bash ayoze3
echo "Creando usuario ayoze3"
echo "ayoze3:ayoze3" | chpasswd

useradd -g users -d /home/ayoze4 -m -s /bin/bash ayoze4
echo "Creando usuario ayoze4"
echo "ayoze4:ayoze4" | chpasswd

useradd -g users -d /home/ayoze5 -m -s /bin/bash ayoze5
echo "Creando usuario ayoze5"
echo "ayoze5:ayoze5" | chpasswd

useradd -g users -d /home/ayoze6 -m -s /bin/bash ayoze6
echo "Creando usuario ayoze6"
echo "ayoze6:ayoze6" | chpasswd

useradd -g users -d /home/ayoze7 -m -s /bin/bash ayoze7
echo "Creando usuario ayoze7"
echo "ayoze7:ayoze7" | chpasswd

useradd -g users -d /home/ayoze8 -m -s /bin/bash ayoze8
echo "Creando usuario ayoze8"
echo "ayoze8:ayoze8" | chpasswd

useradd -g users -d /home/ayoze9 -m -s /bin/bash ayoze9
echo "Creando usuario ayoze9"
echo "ayoze9:ayoze9" | chpasswd

useradd -g users -d /home/ayoze10 -m -s /bin/bash ayoze10
echo "Creando usuario ayoze10"
echo "ayoze10:ayoze10" | chpasswd

exit 0
