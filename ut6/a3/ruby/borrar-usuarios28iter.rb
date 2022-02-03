#!/usr/bin/env ruby


NOMBRES=File.read('users.txt').split

for i in NOMBRES
    puts"Borrando usuario #{i}"
    system("userdel #{i} -r -f")
end
