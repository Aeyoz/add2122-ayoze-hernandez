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

![ServerVNC](./img/slaveserver.png)

A la hora de la instalación configuramos las contraseñas de acceso al servicio.

![ServerVNC](./img/imagen4.png)

## NMAP.

Ejecutamos el comando nmap desde la máquina real y comprobamos que los puertos 5800 y 5900 estan abiertos para conexiones VNC.

![nmap](./img/imagen6.png)

### Tight VNC client.

![ClienteVNC](./img/slaveclient.png)

Nos aseguramos de que el cortafuegos de Windows nos permite las conexiones VNC.

![cortafuegos](./img/imagen5.png)

### Conexión desde el Windows Slave master al Windows Slave y netstat.

Abrimos la aplicacion **VNC viewer** desde el **Windows Slave master** para conectarnos a nuestro servidor, es decir el **Windows Slave**, para ello nos pedirá una ip a la que conectarnos y una contraseña (que configuramos previamente).

![Conexion](./img/conecciontightvnc1.png)

![Conexion](./img/conecciontightvnc.png)

Como comprobación final usaremos el comando netstat -n para visualizar las conexiones entre la máquina slave y la máquina master.

![Conexion](./img/netstat-n.png)

# Conexiones VNC: Opensuse.

### Opensuse Slave.

Configuramos desde el Yast el cortafuegos para que sean posibles las conexiones de tipo VNC e instalaremos un serverVNC en una las maquinas Opensuse, esta será nuestra máquina esclavo o slave.

Para ello debemos:

* Permitir las conexiones VNC en el cortafuegos.

![Cortafuegos](./img/imagenopensuse1.png)

* Incluir desde el Yast el servicio de VNC server, este lo podemos iniciar por comando o por interfaz gráfica.

**Interfaz gráfica.**

![comprobar](./img/)

**Linea de comando.**

![comprobar](./img/)

* Establecer claves para conexiones VNC.

![comprobar](./img/)

* Se nos mostrará un numero para nuestro escritorio remoto, lo anotamos (número **N**) .

![comprobar](./img/)

* Ejecutamos el comando ```ps -ef | grep vnc``` para comprobar los servicios relacionados con VNC que están activos.

![comprobar](./img/)

* Ejecutamos `lsof -i -n` para comprobar que los puertos abiertos para VNC son 580X y 590X.

![comprobar](./img/)

### Comprobaciones.

Ejecutamos **`nmap -Pn 172.19.28.31`** para ver que los puertos disponibles desde fuera son los puertos 5801 y 5901

![comprobar](./img/)

### Opensuse Master VNC.

Para conectarnos a nuestro servidor VNC en opensuse abriremos una terminal y usaremos el comando ```vncviewer ip-vnc-server: N```

![comprobar](./img/)

### Comprobaciones finales.

* Conectar desde Linux a Linux serverVNC.

![comprobar](./img/)

* Ejecutar ```lsof -i -n``` en el server

![comprobar](./img/)

* Ejecutar ```vncserver -list``` en el server

![comprobar](./img/)

### Comprobaciones con SSOO cruzados.

* Conexión desde cliente Linux a servidor VNC Windows.

![comprobar](./img/)

* Ejecutar netstat -n en el servidor Windows.

![comprobar](./img/)

* Conectar desde cliente Windows a servidor VNC Linux.

![comprobar](./img/)

* Ejecutar lsof -i.

![comprobar](./img/)

## Display 0 en GNU/Linux.

Para controlar la pantalla local de manera directa usaremos x0vncserver, para ello debemos hacer lo siguiente.

* Ir al server.

* Ejecutar el siguiente comando: x0vncserver -display :0 -passwordfile /home/ayoze/.vnc/passwd.

![comprobar](./img/)

* lsof -i -n.

![comprobar](./img/)

* Ir al cliente y conectarnos al server.
