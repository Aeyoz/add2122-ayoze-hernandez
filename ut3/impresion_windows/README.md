# Servidor de Impresión en Windows.

### Configuraciones previas.

Para poder realizar de esta práctica necesitaremos de 2 sistemas operativos Windows diferentes

|  Sistema Operativo  |   Rol   | Ip de la máquina |
|---------------------|---------|------------------|
| Windows 10          |cliente  |172.XX.AA.22|
| Windows 2016 server |impresora|172.XX.AA.21|

## Impresora compartida

### Rol de impresión

Dentro del Windows Server debemos de instalar un rol de ```cliente de impresión en internet```

En las siguientes imágenes veremos los pasos para la instalación del rol.

![](./img/001.png)

![](./img/002.png)

![](./img/003.png)

![](./img/004.png)

![](./img/005.png)

![](./img/006.png)

![](./img/007.png)

![](./img/008.png)

### Instalar impresora PDF

Como no poseemos de impresora en el aula debemos de similar una, por lo que la aplicación PDF-Creator es la más indicada para realizar el trabajo. A continuació observamos su instalación.

![](./img/010.png)

Es necesario instalar el Net FrameWork 4.7.2.

![](./img/011.png)

![](./img/012.png)

![](./img/013.png)

### Probar la impresora en local.

Ahora procedemos a comprobar que puede "imprimir" documentos dentro del propio servidor. Primero configuramos los nombres de los archivos y su destinación final cuando se impriman, para ello debemos de dirigirnos a la pestaña de ```Perfiles → Guardar``` y modificamos como en la imagen siguiente.

![](./img/014.png)

Ahora guardamos los cambios.

![](./img/015.png)

Ahora creamos un documento txt que queramos imprimir con algo de contenido dentro del mismo.

![](./img/016.png)

Lo "imprimimos".

![](./img/018.png)

Vemos que nos aparece la impresora de **PDFCreator** en las impresoras.

![](./img/017.png)

Comprobamos que el archivo está en la carpeta que le especificamos.

``No tiene icono porque no hay aplicación por defecto para abrir los PDF.``

![](./img/020.png)

## Compartir por red.

Dentro del panel de control, en el apartado de dispositivos e impresoras, debemosd e buscar nuestra impresora **PDFCreator** y accederemos a sus propiedades, y dentro del apartado ***Compartir*** haremos que la sección de ***Compartir*** esta impresora esté con un tick.

![](./img/021.png)

Ahora comprobamos la ip de la máquina virtual y comprobamos el acceso por la red a la impresora.

![](./img/022.png)

Vemos que nos aparece la impresora.

![](./img/023.png)

Intentamos conectarnos.

![](./img/024.png)

Nos aparece una ventana para confirmar que somos un usuario que en el que el servidor confía.

![](./img/025.png)

Aceptamos.

![](./img/026.png)

### Comprobar desde el cliente.

Ahora comprobamos que se puede imprimir un archivo desde el cliente en el servidor.

![](./img/041.png)

![](./img/028.png)

![](./img/029.png)

![](./img/043.png)

![](./img/044.png)

## Acceso Web

Ahora podemos intentar conectarnos desde un navegador web a la impresora desde el cliente.

![](./img/030.png)

Vemos nuestra impresora.

![](./img/031.png)

Vemos más datos de la misma dentro de la pestaña de propiedades.

![](./img/032.png)

Ahora procedemos a copiar el nombre de red de nuestra impresora.

![](./img/033.png)

Nos dirigimos a configuración del sistema al apartado de ``Impresoras y escáneres``.

![](./img/034.png)

Accedemos al apartado **La impresora que deseo no está en la lista**.

![](./img/035.png)

Escribimos el nombre de la impresora dentro del apartado ***Seleccionar una impresora compartida por nombre***.

![](./img/036.png)

Introducimos los datos del Administrador del servidor

![](./img/037.png)

Ahora vemos un resumen de los datos de "creación" de la impresora.

![](./img/038.png)

![](./img/039.png)

Imprimimos una página de prueba para comprobar que funciona.

![](./img/040.png)

Dentro del servidor vemos que nos llega una página de prueba y con esto verificamos que funciona la conexión entre impresora y cliente Windows.

![](./img/042.png)

![](./img/044.png)

### Comprobación desde el cliente

Desde el navegador paramos la impresora y mandamos un archivo para comprobar la cola de impresión de la impresora.

![](./img/045.png)

Especificamos que el nombre con el que se imprime es el siguiente.

![](./img/046.png)

Creamos el documento y lo imprimimos.

![](./img/047.png)

Ahora, en el server, vemos la cola de impresión y vemos que nuestro archivo está ahí.

![](./img/048.png)

Ahora reanudamos la impresión.

![](./img/049.png)

En el server nos llega el archivo.

![](./img/050.png)

Comprobamos su contenido.

![](./img/051.png)
