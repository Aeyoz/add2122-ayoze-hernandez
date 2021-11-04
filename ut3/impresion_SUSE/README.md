# Servidor de Impresión en Windows.

### Creación de la impresora

Para añadir una impresora virtual en opensuse nos dirigimos al naegador y en la barra de busqueda ponemos **localhost:631** para acceder a la ventana de configuración de CUPS.

![](./img/001.png)

Nos dirigimos a la pestaña de Administración.

![](./img/002.png)

Añadimos una impresora.

![](./img/003.png)

Nos pide usuario y contraseña, usamos root.

![](./img/004.png)

Ahora debemos de crear una impresora que sea accesible por protocolo ipp.

![](./img/005.png)

Establecemos un enlace para la conexión

![](./img/006.png)

Establecemos un nombre.

![](./img/007.png)

Establecemos el tipo de impresora.

![](./img/008.png)

Ahora el modelo.

![](./img/009.png)

Establecemos las opciones por defecto.

![](./img/010.png)

Vemos un resumen de la creación de la impresora.

![](./img/011.png)

### Impresión de archivos de manera local

Ahora intentamos imprimir un archivo por comandos, usamos el comando **lpr** para "imprimir" un documento, en este caso el fichero **hosts** en **/etc**.

![](./img/012.png)

Usamos **lpq** para ver la cola de impresión.

![](./img/013.png)


Si queremos borrar un elemento de la cola de impresión usamos el comando **lprm**

![](./img/014.png)

### Configuración del acceso a la impresora

Modificamos el fichero **/etc/cups/cupsd-conf** para que escuche e cualquier puerto **631** y permitimos los accesos al servidor.

![](./img/016.png)

![](./img/017.png)

Aquí habilitamos el acceso a los ficheros log.

![](./img/018.png)

Ahora recargamos el servicio CUPS.

![](./img/019.png)

### Acceso a la impresora

Tanto en el servidor como en el cliente debemos de permitir las conexiones de tipo ipp, para ver en que apartado del cortafuegos se encuentran las reglas relacionadas con ese protocolo usamos el siguiente comando.

![](./img/021.png)

Las habilitamos.

![](./img/020.png)

Instalamos el paquete **cups-pdf**.

![](./img/024.png)

Creamos un archivo que será impreso.

![](./img/025.png)

Vemos que nos aparecen 2 impresoras, una pertenece al paquete que acabamos de instalar, la otra es la que creamos con anterioridad.

![](./img/027.png)

Vemos que el fichero equivalente en pdf se ha creado, la ubicación de todos los pdf impresos es **/var/spools/cups-pdf/ayoze**

![](./img/028.png)

### Configuración de conexiones remotas

Ahora para las conexiones remotas debemos de agregar la ip de la maquina cliente en el servidor dentro del fichero de configuración del servidor.

![](./img/029.png)

### Impresión de archivos de manera remota

En el cliente debemos de ir a "Configuración de Impresión"

![](./img/030.png)

Desbloqueamos.

![](./img/031.png)

Ponemos la clave de root

![](./img/032.png)

Añadimos la impresora

![](./img/033.png)

Buscamos la ip de nuestra impresora y nos salen 2 busquedas relacionadas, estas son, la impresora de CUPS-PDF y printer1

![](./img/034.png)

Seguimos adelante y establecemos un nombre para esta.

![](./img/035.png)

Vemos ahora que el cliente tiene acceso a la impresora

![](./img/036.png)

Probamos a imprimir un archivo desde el cliente

![](./img/037.png)

![](./img/038.png)

Vemos que se ha creado en el servidor.

![](./img/039.png)
