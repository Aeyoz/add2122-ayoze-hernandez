# Servidor LDAP.

## Prerequisitos.

### FQDN (Fully Qualified Domain Name).

Debemos de configurar el hostname de la máquina para que su FQDN sea **server28g.curso2122**.

Para ello debemos de ir a ``Yast → Ajustes de Red → Descripcion general → Conexion existente → Nombre del host`` y cambiamos el valor por defecto (localhost) por el valor que queremos (server28g.curso2122).

Comprobamos que los cambios se ha realizado correctamente comprobamos los siguientes elementos:
* Fichero /etc/hosts

![](./img/001.png)

* Fichero /etc/hostname

![](./img/002.png)

* Comando hostname -a/-d/-f

![](./img/003.png)

## Instalación del Servidor LDAP.

### Instalación del paquete.

Para configurar el servidor LDAP debemos de instalar el paquete **389-ds**.

![](./img/004.png)

Comprobamos su version.

![](./img/005.png)

### Configuración de la instancia.

Ahora creamos un archivo /root/instance.inf que servirá como fichero de configuración del servidor LDAP.

![](./img/006.png)

Ahora validamos el fichero como archivo de configuración del servidor LDAP.

![](./img/007.png)

Vemos que el servicio se encuentra activo.

![](./img/008.png)

Ahora creamos un fichero /root/.dsrc de que administrará los permisos para acceder a la base de datos como administrador. El contenido es el siguiente

![](./img/009.png)

### Comprobar el servicio.

Comprobamos el estado del servicio.

![](./img/010.png)

### Comprobar acceso al contenido de LDAP.

Desde la máquina real comprobamos el acceso al servidor LDAP ejecutando la herramienta nmap y filtrando los puertos que nos interesan.

![](./img/011.png)

Como no podemos acceder significa que el cortafuegos de la máquina servidor no permite el acceso a los puertos.  

![](./img/012.png)

Volvemos a comprobar el acceso y vemos que nos permite ver los puertos ahora, sin embargo no funciona con el hostname, por lo que usamos la IP.

![](./img/013.png)

Ahora vemos el contenido de nuestra base de datos LDAP.

![](./img/014.png)

Ahora vemos el contenido de la base de datos LDAP como usuario administrador.

![](./img/015.png)


## Añadir usuarios LDAP por comandos.

### Buscar Unidades Organizativas.

Comprobamos que las unidades organizativas people y groups existen.

![](./img/017.png)

### Agregar usuarios.

Empezamos creando un fichero de configuración del usuario para luego validarlo.

![](./img/018.png)

Ahora ejecutamos el comando **ldapadd -x -W -D "cn=Directory Manager" -f mazinger-add.ldif** para validar el usuario.

![](./img/019.png)

### Comprobar nuevo usuario.

Comprobamos la existencia del usuario que acabamos de crear.

![](./img/021.png)
![](./img/022.png)

## Contraseñas encriptadas.

### Herramienta slappasswd.

Debemos de instalar el paquete **openldap2** para cambiar las contraseñas.

![](./img/023.png)

Ahora podemos generar contraseñas cifradas con diferentes formatos, aquí un ejemplo de como generar una contraseña encriptada.

![](./img/024.png)

### Agregar más usuarios con claves encriptadas.

Ahora vamos a crear 3 ficheros para 3 usuarios nuevos:
* **zoro**

![](./img/025.png)

* **sanji**

![](./img/026.png)

* **chopper**

![](./img/027.png)

Ahora validamos estos usuarios.

![](./img/028.png)
### Comprobar los usuarios creados.

Ahora comprobamos que los usuarios existen.

![](./img/029.png)

Ahora comprobamos que los usuarios son accesibles desde una máquina cliente.

![](./img/030.png)
