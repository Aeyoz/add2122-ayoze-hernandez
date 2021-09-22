# Conexiones VNC.

## Configuraciones previas de las máquinas.

| Sistema Operativo | Rol | Ip de la máquina |
|-------------------|-----|------------------|
| Windows 10        |master|172.XX.AA.12|
| Windows 10        |slave|172.XX.AA.11|
| Opensuse          |master|172.XX.AA.12|
| Opensuse          |slave|172.XX.AA.12|


## Conexiones VNC: Windows 10.

Instalamos Tight VNC server y Tight VNC viewer en 2 máquinas con Windows 10 respectivamente.



### Tight VNC server.

![ServerVNC](./img/imagen3.png)

A la hora de la instalación configuramos las contraseñas de acceso al servicio.

![ServerVNC](./img/imagen4.png)

## NMAP.

Ejecutamos el comando nmap desde la máquina real y comprobamos que los puertos 5800 y 5900 estan abiertos para conexiones VNC.

![nmap](./img/imagen6.png)

### Tight VNC client.

![ClienteVNC](./img/imagen3.png)

Nos aseguramos de que el cortafuegos de Windows nos permite las conexiones VNC.

![cortafuegos](./img/imagen5.png)

### Conexión desde el Windows Slave master al Windows Slave y netstat.

Abrimos la aplicacion **VNC viewer** desde el **Windows Slave master** para conectarnos a nuestro servidor, es decir el **Windows Slave**, para ello nos pedirá una ip a la que conectarnos y una contraseña (que configuramos previamente).

![Conexion](./img/imagen7.png)

![Conexion](./img/imagen8.png)

Vemos que nos podemos conectar a nuestro equipo en remoto.

![Remoto](./img/imagen9.png)

Como comprobación final usaremos el comando netstat -n para visualizar las conexiones entre la máquina slave y la máquina master.

![Conexion](./img/imagen10.png)

# Conexiones VNC: Opensuse.

### Opensuse Slave.

Configuramos desde el Yast el cortafuegos para que sean posibles las conexiones de tipo VNC e instalaremos un serverVNC en una las maquinas Opensuse, esta será nuestra máquina esclavo o slave.

Para ello debemos:

* Permitir las conexiones VNC en el cortafuegos.

![Cortafuegos](./img/imagen14.png)

* Incluir desde el Yast el servicio de VNC server, este lo podemos iniciar por comando o por interfaz gráfica.

* En el Yast configuramos la administración remota del vnc server he instalamos los paquetes necsarios.

![VNCserver](./img/imagen11.png)

![VNCserver](./img/imagen12.png)

![VNCserver](./img/imagen13.png)

* Establecer claves para conexiones VNC. Se nos mostrará un numero para nuestro escritorio remoto, lo anotamos (número **N**) en nuestro caso es 2..

![vncserver](./img/imagen15.png)

* Ejecutamos el comando ```ps -ef | grep vnc``` para comprobar los servicios relacionados con VNC que están activos.

![comprobar](./img/imagen17.png)

* Ejecutamos `lsof -i -n` para comprobar que los puertos abiertos para VNC son 580X y 590X.

![comprobar](./img/imagen18.png)

### Comprobaciones.

Ejecutamos **`nmap -Pn 172.19.28.32`** para ver que los puertos disponibles desde fuera son los puertos 5801 y 5901

![comprobar](./img/imagen19.png)

### Opensuse Master VNC.

Para conectarnos a nuestro servidor VNC en opensuse abriremos un terminal y escribimos ```vncviewer```.

![Conectar](./img/imagen20.png)

* Se nos abrirá una ventana en la que escribiremos ``ip-vnc-server: N`` y nos conectamos.

![vncviewer](./img/imagen21.png)

![vncviewer](./img/imagen22.png)

* Ejecutar ```lsof -i -n``` en el server

![lsof](./img/imagen23.png)

* Ejecutar ```vncserver -list``` en el server

![list](./img/imagen24.png)

### Comprobaciones con SSOO cruzados.

* Conexión desde cliente Windows al servidor VNC Linux.

![SSOO](./img/imagen29.png)
![SSOO](./img/imagen30.png)

* Ejecutar netstat -n en el servidor Windows.

![netstat](./img/imagen25.png)

* Conectar desde cliente Linux a servidor VNC Windows.

![windows](./img/imagen31.png)

![windows](./img/imagen22.png)

![windows](./img/imagen32.png)

* Ejecutar lsof -i.

![lsof](./img/imagen26.png)

## Display 0 en GNU/Linux.

Para controlar la pantalla local de manera directa usaremos x0vncserver, para ello debemos hacer lo siguiente.

* Ir al server.

* Ejecutar el siguiente comando: x0vncserver -display :0 -passwordfile /home/ayoze/.vnc/passwd.

![x0server](./img/)

* lsof -i -n.

![lsof](./img/imagen33.png)

* Ir al cliente y conectarnos al server.
