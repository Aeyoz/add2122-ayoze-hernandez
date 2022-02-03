#!/usr/bin/env ruby

system("figlet hola")

NOMBRES = File.read('users.txt').split

for i in NOMBRES
    puts "Creando usuario #{i}"
    system("useradd -g users -d /home/#{i} -m -s /bin/bash #{i}")
end
