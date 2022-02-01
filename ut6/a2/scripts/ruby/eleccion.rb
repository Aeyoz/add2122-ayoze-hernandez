#!/usr/bin/env ruby

puts "
Qué desea hacer?

1) Crear usuarios	(c)
2) Borrar usuarios	(b)
3) Salir		(s)
"
STDOUT.flush 

option = gets.chomp

puts "Su elección es " + option

if option=="c" then
    system("ruby ./crear-usuarios28.rb")
elsif option=="b" then
    system("ruby ./borrar-usuarios28.rb")
elsif option=="s" then
    puts "Saliendo del programa"
    exit 0
else
    puts "La opción no es válida"
    exit 1
end


