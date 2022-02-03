#!/usr/bin/env ruby

NOMBRES=File.read('users.txt').split


if ARGV[0]=="-c" then
    for i in NOMBRES
        system("useradd -g users -d /home/#{i} -m -s /bin/bash #{i}")
    end
elsif ARGV[0]=="-b" then
    for j in NOMBRES
        puts"Borrando usuario #{j}"
        system("userdel #{j} -r -f")
    end
elsif ARGV[0]=="-e" then
    for l in NOMBRES
        puts "Comprobando si el usuario #{l} existe"
        system("id #{l}")
    end
end
