
<center>

# Gestión de contenedores con docker <a name="docker"></a>


</center>

***Nombre:*** Ayoze Hernández Díaz.

***Curso:*** 2º de Ciclo Superior de Administración de Sistemas Informáticos en Red.

## ÍNDICE

+ [Gestión de contenedores con docker](#docker)
+ [Instalación](#Punto1)
+ [Gestión de un contenedor](#Punto2)
+ [Descargar imagen](#Punto3)
+ [Gestionar Nginx con volumen](#Punto4)
+ [Cambios en caliente](#Punto5)
+ [Gestionar un contenedor Mysql con volumen](#Punto6)
+ [Gestionar dos contenedores](#Punto7)

### ***Instalación***. <a name="Punto1"></a>

Descargamos docker-compose con **zypper in docker-compose**.

![](./img/002.png)

Comprobamos la version de docker-compose con **docker-compose -v**.

![](./img/003.png)

### ***Gestión de un contenedor***. <a name="Punto2"></a>

#### ***Descargar imagen***. <a name="Punto3"></a>

Comprobamos que no tenemos ninguna imagen descargada y buscamos una que contenga nginx con **docker search nginx**.

![](./img/004.png)

Descargamos la imagen con **docker pull nginx**.

![](./img/005.png)

Vemos que la imagen ahora está en nuestro sistema.

![](./img/006.png)

#### ***Gestionar Nginx con volumen***. <a name="Punto4"></a>

Creamos la carpeta **/home/ayoze/compose28nginx** con la siguiente estructura.

![](./img/007.png)

Editamos el fichero **docker-compose.yaml**.


* web - Especifica que tipo de imagen es.
* image - Especifica la imagen que se va a usar.
* ports - Especifica los puertos **target** y **expose**.
* volumes - Especifica la equivalencia de una carpeta dentro del contenedor a una del sistema.

![](./img/008.png)

Vemos las imagenes que tenemos en ejecución y levantamos el contenedor.

![](./img/009.png)

Vemos de nuevo el estado del contenedor.

![](./img/010.png)

Editamos un indice dentro del contenedor para mostrarlo en el navegador.

![](./img/011.png)

Entramos a **localhost:8081** y vemos lo que añadimos en el indice.

![](./img/012.png)

Volvemos añadimos a añadir otra línea y recargamos la página.

![](./img/013.png)

Vemos los cambios.

![](./img/014.png)

#### ***Cambios en caliente***. <a name="Punto5"></a>

Ejecutamos **dc down** para apagar los contenedores y vemos que el terminal 1 ya se liberó.

* **Terminal 2**

![](./img/015.png)

* **Terminal 1**

![](./img/016.png)

#### ***Gestionar un contenedor Mysql con volumen***. <a name="Punto6"></a>

Descargamos la imagen oficial de **mysql**.

![](./img/017.png)

![](./img/018.png)

![](./img/019.png)

Miramos las imágenes que tenemos.

![](./img/020.png)

**A partir de aquí no pude avanzar**

En las 3 siguientes imagenes muestro las 3 configuraciones diferentes que he adoptado para intentar ejecutar exitosamente este punto de la práctica.

![](./img/021.png)

![](./img/022.png)

![](./img/023.png)

![](./img/023-2.png)

Instalamos un cliente de **mysql** en la máquina.

![](./img/024.png)

Ahora vemos los contenedores que tenemos el contenedor activo.

![](./img/026.png)

Ejecutamos un nmap localhost para ver que el servicio de mysql está abierto.

![](./img/027.png)

Vemos que desde la máquina real no está abierto.

![](./img/028.png)

Y además vemos que tampoco nos deja conectarnos.

![](./img/error/001.png)

### ***Gestionar dos contenedores***. <a name="Punto7"></a>

Ahora descargamos 2 imágenes:

* **Wordpress**
* **Mariadb**

![](./img/029.png)

![](./img/030.png)

Aquí está el fichero de configuración que usaremos para levantar los contenedores.

![](./img/031.png)

* Cambié el **WORDPRESS_DB_HOST=host** por **WORDPRESS_DB_HOST=db**.
* Cambié **data:/var/lib/mysql** por **./data:/var/lib/mysql**.

Creamos la siguiente estructura de carpetas dentro de la nueva carpeta **compose28wp**.

![](./img/032.png)

Iniciamos los contenedores.

![](./img/034.png)

Entramos dentro de **localhost:8080** y accedemos a **Wordpress**.

![](./img/036.png)
