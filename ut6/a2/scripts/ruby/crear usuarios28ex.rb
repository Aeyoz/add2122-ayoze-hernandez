#!/usr/bin/env ruby

system("id ayoze5")
echo=system("echo $?")
if TRUE then
    puts "Creando usuario: ayoze1"
    system("useradd -g users -d /home/ayoze1 -m -s /bin/bash ayoze1")
    system("echo ayoze1:ayoze1 | chpasswd")
    puts "Creando usuario: ayoze2"
    system("useradd -g users -d /home/ayoze2 -m -s /bin/bash ayoze2")
    system("echo ayoze2:ayoze2 | chpasswd")
    puts "Creando usuario: ayoze3"
    system("useradd -g users -d /home/ayoze3 -m -s /bin/bash ayoze3")
    system("echo ayoze3:ayoze3 | chpasswd")
    puts "Creando usuario: ayoze4"
    system("useradd -g users -d /home/ayoze4 -m -s /bin/bash ayoze4")
    system("echo ayoze4:ayoze4 | chpasswd")
    puts "Creando usuario: ayoze5"
    system("useradd -g users -d /home/ayoze5 -m -s /bin/bash ayoze5")
    system("echo ayoze5:ayoze5 | chpasswd")
    puts "Creando usuario: ayoze6"
    system("useradd -g users -d /home/ayoze6 -m -s /bin/bash ayoze6")
    system("echo ayoze6:ayoze6 | chpasswd")
    puts "Creando usuario: ayoze7"
    system("useradd -g users -d /home/ayoze7 -m -s /bin/bash ayoze7")
    system("echo ayoze7:ayoze7 | chpasswd")
    puts "Creando usuario: ayoze8"
    system("useradd -g users -d /home/ayoze8 -m -s /bin/bash ayoze8")
    system("echo ayoze8:ayoze8 | chpasswd")
    puts "Creando usuario: ayoze9"
    system("useradd -g users -d /home/ayoze9 -m -s /bin/bash ayoze9")
    system("echo ayoze9:ayoze9 | chpasswd")
    puts "Creando usuario: ayoze10"
    system("useradd -g users -d /home/ayoze10 -m -s /bin/bash ayoze10")
    system("echo ayoze10:ayoze10 | chpasswd")
else
    puts "Los usuarios ya están creados"
end
