#

## Comprobar versiones de vagrant

Para empezar a realizar la practica debemos comprobar que tenemos la utilidad de vagrant instalada en la maquina real, en caso contrario debemos de preguntar al administrador de la red para poder instalarlo.

![](./img/001.png)

## Proyecto Celtics

Ahora empezamos importando una maquina externa **(ubuntu/bionic64)**.

![](./img/002.png)

Ahora comprobamos creamos y nos movemos al directorio **vagrant28-celtics** que es donde realizaremos esta seccion de la práctica.

![](./img/003.png)

Creamos el fichero de configuración Vagrantfile para configurar la máquina que hemos importado, en este añadimos el **nombre de la máquina a configurar**, **el hostname** que queremos que tenga y el programa con el que se va a abrir la máquina (**VBOX**).

![](./img/004.png)

Ejecutamos el comando **vagrant up** para activar y encender la máquina.

![](./img/005.png)

Ahora accedemos a ella con vagrant ssh

![](./img/006.png)

Ahora hacemos un par de comprobaciones sencillas.

![](./img/007.png)


```
DE INTERÉS:

· Para salir de la maquina se ejecuta el comando exit.

· Para apagar la máquina se debe de ejecutar el comando vagrant
halt.

· Para eliminar la máquina ejecutamos vagrant destroy
```


## Proyecto Hawks

Ahora debemos crear otro directorio llamado vagrant28-hawks para la elaboración de otra máquina virtual y dentro de este otro fichero de configuración Vagrantfile exactamente igual al anterior, pero añadimos la ultima linea que habilita el protocolo http por el puerto 4567 del host que será enrutado al puerto 80 de la máquina vagrant28-hawks.

![](./img/010.png)

Ejecutamos un vagrant up para activar y encender la máquina

![](./img/011.png)

Nos conectamos a la maquina y hacemos un par de comprobaciones.

![](./img/012.png)

Ahora estando dentro de la maquina instalamos **apache2** y desde la maquina real comprobamos que podemos acceder por el puerto 4567 a la página de apache2 de la máquina vagrant28-hawks

![](./img/013.png)

Vemos que está abierto el puerto con **vagrant port**.

![](./img/014.png)

Comprobamos el acceso con la dirección: http://127.0.0.1:4567 en el navegador.



![](./img/015.png)

## Suministro

Ahora debemos de apagar la máquina hawks y destruirla.

![](./img/016.png)

### Proyecto Lakers.

Ahora creamos el proyecto lakers dentro del directorio vagrant28-lakers y además creamos el directorio html con un index.html dentro del mismo.

![](./img/017.png)

Aquí un vistazo del html.

![](./img/018.png)

Creamos un fichero install_apache2 para que el apache2 se instale de manera automática al encender la máquina.

![](./img/019.png)

Ahora añadimos un fichero Vagrantfile con la misma configuración de antes y añadimos 2 líneas nuevas:

* config.vm.provision :shell, :path => "install_apache.sh"  **Añadimos el fichero install_apache.sh a la configuración de la máquina para que se ejecute al iniciarse**

* config.vm.synced_folder "html", "/var/www/html" **Sincronizamos la carpeta /var/www/html de la máquina vagrant y la real**.

![](./img/022.png)

Activamos la máquina y vemos que se instala apache2.

![](./img/021.png)

Vemos que ahora el fichero index.html que creamos se puede ver por la misma url de antes.

![](./img/023.png)

## Proyecto Raptors

Creamos el directorio vagrant28-raptors y añadimos el fichero Vagrantfile con las siguientes lineas extra:

* config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install -y puppet" **Se instala puppet el la máquina antes de que se pueda usar**
* ```
    config.vm.provision "puppet" do |puppet|
    puppet.manifest_file = "ayoze28.pp"
   end
 end
 ```
* **Hacemos aprovisionamiento con puppet** con el cuadro de comandos anterior, se consultará e fichero manifests/ayoze28.pp por lo que habrá que crearlo.

![](./img/024.png)

Creamos un fichero **manifests/ayoze28.pp** que especifique el programa que queremos instalar

![](./img/025.png)

Activamos la máquina

![](./img/026.png)


* Con la máquina encendida

![](./img/027.png)

![](./img/028.png)

* Con la máquina apagada

![](./img/029.png)

## Proyecto Bulls (MI CAJA)

Ahora vamos a crear nuestra propia caja o BOX, para ello debemos de usar una máquina virtual ya creada, empezamos configurando la interfaz de red en modo DHCP y nos aseguramos de que tenga un hostname apropiado y que tenga algunos paquetes previamente instalados (openssh-server). Además deberemos de crear en la máquina real un directorio vagrant28-bulls.

![](./img/030.png)

![](./img/031.png)

![](./img/032.png)

Creamos el usuario vagrant y le ponemos de contraseña vagrant

![](./img/033.png)

Cambiamos la contraseña del root también a vagrant.

![](./img/034.png)

Ahora nos descargamos una clave pública para configurar el acceso mediante clave pública al usuario vagrant.

![](./img/035.png)

Ahora cambiamos los permisos de la clave que acabamos de importar.

![](./img/036.png)

Cambiamos también el propietario de la carpeta .ssh dentro de /home/vagrant/ a vagrant en vez de root.

![](./img/037.png)

Añadimos a vagrant como usurio sudoer.

![](./img/038.png)

Comprobamos que tenemos las guest additions instaladas.

![](./img/039.png)

Ahora vemos un listado de las máquinas virtuales que tenemos desde el terminal con el comando **VBoxManage list vms**.

![](./img/040.png)

Ahora creamos nuestra caja a partir de la máquina que estabamos configurando (15.3) como ayoze28.box

![](./img/042.png)

Ahora añadimos la máquina a la lista de máquinas vagrant importadas.

![](./img/043.png)

Comprobamos esta lista.

![](./img/044.png)

Creamos y cnfiguramos un fichero básico Vagrantfile

![](./img/045.png)

Activamos la máquina.

![](./img/046.png)

Nos conectamos a esta y realizamos algunas comprobaciones.

![](./img/047.png)

Hacemos un listado de las máquinas que tenemos y eliminamos la máquina vagrant que nosotros creamos.

![](./img/048.png)
