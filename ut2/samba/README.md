# Samba con OpenSUSE y Windows

## Servidor Samba

#### Preparativos


#### Usuarios locales

Debemos de crear los siguientes usuarios y grupos para realizar la practica.

~~~~
 Grupos

* Soldados
* Piratas
* sambausers

Usuarios
* soldado1
* soldado2
* pirata1
* pirata2
* sambaguest
* supersamba
~~~~

Aqui vemos como crearlos por comandos.

![server](./img/server/001.png)

Ahora vamos a ver como crearlos por entorno gráfico.

En estas imágenes vemos la creación de un grupo.

![server](./img/server/002.png)

![server](./img/server/003.png)

Vemos todos los usuarios pertenecientes al grupo sambausers.

![server](./img/server/004.png)

En estas vemos la creación de un usuario.

![server](./img/server/005.png)

![server](./img/server/006.png)

### Crear carpetas de los recursos compartidos

Creamos la siguiente estructura de carpetas con los permisos, grupos y usuarios propietarios especificados.

![server](./img/server/007.png)

![server](./img/server/017.png)

### Configurar servidor Samba

Instalamos el servidor Samba.

![server](./img/server/009.png)

Copiamos el archivo de configuración de samba por seguridad.

![server](./img/server/010.png)

En yast configuramos Samba.

![server](./img/server/011.png)

Añadimos un grupo de trabajo

![server](./img/server/012.png)

Esta parte la podemos dejar sin tocar ya que no es necesario ningun cambio.

![server](./img/server/013.png)

Añadimos Samba en el cortafuegos para permitir las conexiones

![server](./img/server/014.png)

Ejecutamos nmap -Pn para comprobar que realmente estan abiertos los puertos de samba (139 y 445).

![server](./img/server/015.png)

### Crear recursos compartidos de red

En el fichero de configuracion de samba debemos de añadir las siguientes líneas.

![server](./img/server/016-1.png)

![server](./img/server/016.png)

Comprobamos que todo está bien

![server](./img/server/018.png)

### Usuarios samba

Para añadir usuarios a samba debemos de ejecutar el comando **smbpasswd -a USUARIO** para establecer una contraseña para este y añadirlo.

![server](./img/server/019.png)

Comprobamos la lista de usuarios de samba.

![server](./img/server/020.png)

### Reiniciar Samba

Reiniciamos ambos servicios de samba

![server](./img/server/021.png)

## Windows

Añadimos la maquina servidor samba en el fichero hosts de la maquina Windows.

![wincli](./img/wincli/001.png)

### Acceso a los recursos compartidos con el cliente Windows

Nos conectamos desde el propio explorador de archivos de Windows al servidor samba poniendo en la barra de busqueda **\\\IP-SERVER-SAMBA**

![wincli](./img/wincli/002.png)

Probamos a conectarnos al recurso compartido de castillo como soldado1.

![wincli](./img/wincli/003.png)

Vemos en un cmd las conexiones activas con **net use**.

![wincli](./img/wincli/004.png)

Vemos que no hay nada creado todavía en castillo.

![wincli](./img/wincli/005.png)

Ahora borramos las conexiones con **net use * /d /y**.

![wincli](./img/wincli/006.png)

Ahora probamos a conectarnos a barco con el mismo procedimiento.

![wincli](./img/wincli/007.png)

![wincli](./img/wincli/008.png)

![wincli](./img/wincli/009.png)

Vemos los recursos compartidos disponibles.

![wincli](./img/wincli/010.png)

### Comandos en el cliente Windows

Para montar un recurso de manera permanente debemos de escribir el siguiente comando:

![wincli](./img/wincli/011.png)

Ahora comprobamos que tenemos una conexión activa a ese recurso.

![wincli](./img/wincli/012.png)

### Cliente OpenSUSE

Añadimos a las maquinas servidor Samba y la máquina windows en el fichero **/etc/hosts** de la maquina cliente de OpenSUSE.

![opencli](./img/cliope/001.png)

### Acceso a los recursos compartidos con el cliente OpenSUSE

Nos conectamos mediante el explorador de archivos.

![opencli](./img/cliope/002.png)

Si intentamos acceder como soldado1 a barco nos devuelve la ventana de login porque no estamos autorizados en ese repositorio como ese usuario.

![opencli](./img/cliope/003.png)

![opencli](./img/cliope/004.png)

![opencli](./img/cliope/005.png)

Accedemos finalmente al repositorio castillo.

![opencli](./img/cliope/006.png)

Vemos el estado del servicio.

![opencli](./img/cliope/007.png)

![opencli](./img/cliope/008.png)

Vemos un listado de los repositorios disponibles.

~~~
DISCLAIMER: Aunque en la descripcion de los recursos castillo y barco ponga public de ayoze28
deberia poner sus descripciones respectivas una vez configurado de manera correcta el fichero /
etc/samba/smb.conf.

~~~


![opencli](./img/cliope/009.png)

### Montaje automático

Creamos las carpetas remoto28/castillo dentro de **/mnt** para montar un recurso de manera permanente.

![opencli](./img/cliope/0010.png)

Montamos el recurso de manera permanente con el siguiente comando.

![opencli](./img/cliope/011.png)

Vemos las conexiones activas en el momento tanto con df -hT para comprobar que está montado el recurso como con lsof -i -Pn para comprobar que está conectado al servidor y su recurso.

![opencli](./img/cliope/012.png)

![opencli](./img/cliope/014.png)

###### Contenido del fichero /etc/fstab

~~~

GNU nano 4.9.2 /etc/fstab
UUID=9f72d837-b192-469f-b2c1-c517823c86e9   / ext4 defaults o 1
UUID=94ffcdf2-1039-4058-a6bf-e4f5es15f6cO   swap swap defaults oe
UUID=dc1040fd-e718-44f9-a9df-767bf3735591   /home ext3 data=ordered 0 2
UUID=687E-A058                              /boot/efi vfat defaults e 2

//172.19.28.31/public /mnt/remoto28/public  cifs username=soldado1,password=1234 0 0

~~~

### Preguntas para resolver

* ¿Por qué tenemos dos servicios (smb y nmb) para Samba?

El servicio smb hace posible la compartición de archivos e impresión en pantalla de estos mismos para los clientes Windows, mientras que el servicio nmb responde a las peticiones de los equipos.

* ¿Las claves de los usuarios en GNU/Linux deben ser las mismas que las que usa Samba?

No necesariamente, podemos establecer la clave de usuario **1234** a pirata1 y que la clave de acceso a samba sea **pouOdc+fi¬juosda**

* ¿Puedo definir un usuario en Samba llamado soldado3, y que no exista como usuario del sistema?

No, no es posible, ya que samba solo usa los usuarios creados en el sistema y los agrega como usuariosd de sus servicios.

* ¿Cómo podemos hacer que los usuarios soldado1 y soldado2 no puedan acceder al sistema pero sí al samba?

Para que los usuarios soldado1 y soldado2 no puedan acceder al sistema podemos crear estos usuarios sin un home definido o borrar el que ya tienen una vez creados.
