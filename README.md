# Fylu - Almacenamiento en la nube
![banner-github](https://user-images.githubusercontent.com/60886336/170847610-baeb94c3-b2c2-4d37-950c-14aca90efadd.png)

Ante la creciente demanda de la necesidad de almacenar los archivos en red  y para poder facilitar el envío de estos entre usuarios, es por esto que se considera desarrollar un aplicativo de almacenamiento en nube.[2]

El aplicativo, debe permitir la creación, modificación y eliminación de cuentas de usuario. Es decir, debe permitir a un potencial usuario, crear una cuenta nueva sin autorización de un tercero; por modificar la cuenta, se refiere al cambio de contraseña y correo de la misma. En caso de eliminación, no se debe borrar la cuenta de la bd, si no que esta debe pasar a un estado de inactividad. por temas de trazabilidad y para permitir revertir la “eliminación” de la misma en un plazo no máximo de 30 días.


## Características

- creación, modificación y desactivar de cuentas de usuario
- subir, eliminar, y compartir archivos


## Authors

- [@Norman Pabon](https://github.com/Normanpabon)
- [@Santiago Urbano](https://github.com/sanurb)
- [@Santiago Fajado](https://www.github.com/santiago-fajardo)


## Recursos usados
Se detallan los recursos utilizados, en el link a continuacion:
 - [Recursos y Tutoriales](https://www.notion.so/santurban/Exposici-n-Grails-4956aa3af91f442f8552ab733ab0a80d#b0b6d585659e4d8e9d104d809a0241e1)


## Instalacion
Antes de correr la web recuerda que debes cumplir con una serie de requerimientos
 - [Tutorial de instalacion de requerimientos en windows 10](https://www.notion.so/santurban/Como-instalar-Grails-en-Windows-10-91a444a2064d4deaa190a010e8196ce8)
Pre-Requisitos:
- Groovy
- Grails
- JDK 1.8+
- MySQL 5.7 (opcional, si no se tiene saltar paso 2)

1. Clona el proyecto, para esto podemos dirigirnos directamente a la URL del repo y descargar como un .zip o ejecutar el siguiente comando si tienes git instalado

```bash
  git clone https://github.com/Normanpabon/ProyectoFinal_ED2
```
![](https://user-images.githubusercontent.com/60886336/170847027-3cbaf16d-565b-445f-a4e5-60076dcba5aa.gif)

2. Crear en MySql la Base de Datos con nombre "CloudDrive" (saltar si no se tiene Mysql)
```bash
  CREATE DATABASE CloudDrive;
```
![](https://user-images.githubusercontent.com/60886336/170847041-f2a2ba96-855c-4d50-849e-97954707f7a1.gif)

En teoría el Hibernate debería crearla automáticamente si no está, pero suele tirar error. Solo es necesario crear la BD, las tablas si se generan solas. (El Mysql no es case-sensitive)

3. Cambiar base de datos Mysql por H2 (OPCIONAL)
- En el caso de que no tenga Mysql , no hay problema. Descargue el archivo "Application.yml" que esta adjunto al correo y remplazelo por el que se encuentra en el proyecto. Alli se dejo con las configuraciones por defecto para hacer uso de la base de datos H2.

4.Modificar archivo de configuración Application.yml
La ruta del archivo seria ../PROYECTOFINAL_ED2/CloudDrive/grails-app/conf/application.yml
![](https://user-images.githubusercontent.com/60886336/170847126-acb376c5-80bd-44cf-bbb1-dcf5e71afc09.gif)
(por defecto, grails va a ejecutar en el ambiente de "development")
![](https://user-images.githubusercontent.com/60886336/170847133-58fc5af5-e913-4ae7-bd44-5c4c5cf3452f.png)
- Aca solo debe remplazar el usuario (si tienes uno diferente, el default es root) y tus credenciales de acceso a MySql.

### Ejecutar el proyecto
- Desde la consola de comandos o terminal, nos dirigimos a la carpeta donde tenemos los archivos del repositorio, situandonos dentro de la carpeta "CloudDrive"
![](https://user-images.githubusercontent.com/60886336/170847149-59cd89ec-db91-4656-9290-ee11121b539d.gif)

Ve al directorio del proyecto

```bash
  cd CloudDrive
```
Empieza el servidor
![](https://user-images.githubusercontent.com/60886336/170847172-93e9f64f-5c6a-4e1c-b7a4-326b553a62f4.gif)

```bash
  grails run-app
```
(o tambien podria llamar primero al " grails " para entrar en la consola interactiva y luego si el comando de " run-app ". La primera vez puede tardar un poco)
- Una vez termine de compilar, mostrara el siguiente mensaje. Ya la aplicacion estaria corriendo sobre la url dada
![](https://user-images.githubusercontent.com/60886336/170847178-ad078594-9442-4a81-9b6d-a71d7e7bbb05.png)


## Contribuciones

Las contribuciones son siempre bienvenidas.

Consulta `contributing.md` para saber cómo empezar.

Por favor, respete el "código de conducta" de este proyecto.


## Documentacion

[Link Documentacion](https://www.notion.so/santurban/Exposici-n-Grails-4956aa3af91f442f8552ab733ab0a80d)
