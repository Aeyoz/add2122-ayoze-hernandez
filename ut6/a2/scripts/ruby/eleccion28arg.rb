#!/usr/bin/env ruby

puts "
Qué desea hacer?

1) Crear usuarios	(c)
2) Borrar usuarios	(b)
3) Salir		(s)
"
STDOUT.flush 

puts "Su elección es " + ARGV[0]

if ARGV[0]=="-c" then
    system("ruby /home/ayoze/users28ruby/crear-usuarios28.rb")
elsif ARGV[0]=="-b" then
    system("ruby /home/ayoze/users28ruby/borrar-usuarios28.rb")
elsif ARGV[0]=="-s" then
    puts "Saliendo del programa"
    exit 0
else
    puts "La opción no es válida"
    exit 1
end


