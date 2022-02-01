#!/usr/bin/env ruby

system("id ayoze1")

echo=system("echo $?")

if TRUE then
    puts "Ejecutando script de eliminación de usuarios con lenguaje ruby"
    system("userdel ayoze1 -r -f")
    system("userdel ayoze2 -r -f")
    system("userdel ayoze3 -r -f")
    system("userdel ayoze4 -r -f")
    system("userdel ayoze5 -r -f")
    system("userdel ayoze6 -r -f")
    system("userdel ayoze7 -r -f")
    system("userdel ayoze8 -r -f")
    system("userdel ayoze9 -r -f")
    system("userdel ayoze10 -r -f")
    system("xcowsay usuarios borrados")
else
    puts "No hay nada que hacer"
    exit 1
end