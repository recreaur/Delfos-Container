
# Delfos

Delfos es una aplicación web desarrollada por la Universidad de La Rioja que tiene como objetivo proveer a los docentes de una herramienta para la realización de prácticas de bases de datos.



## Requisitos
* [Git](https://git-scm.com/downloads)
* [Docker Engine](https://docs.docker.com/installation/) (Linux)
* [Docker Compose](https://docs.docker.com/compose/) (Linux)
* [Docker Desktop](https://docs.docker.com/desktop/) (Mac y Windows)


## Ejecución del entorno
1. Clonar el proyecto y acceder a la carpeta generada:
```sh
git clone https://github.com/recreaur/Delfos.git
cd Delfos
```

2. Cambiar permisos necesarios
```sh
sudo chown -R 1000:1000 {conf,data,secrets}/*
sudo find {conf,data,secrets} -type d -exec chmod 700 {} \;
sudo find {conf,data,secrets} -type f -exec chmod 600 {} \;
```

3. Arrancar los containers mediante *docker-compose*:
```sh
docker-compose up
```
* En un navegador acceder a la dirección <http://localhost:8888> con las credenciales *admin*/*admin*.

## Consideraciones

Por motivos de seguridad, todos los contenedores se ejecutan de manera predeterminada con el usuario con UID 1000. Esto evita que los procesos sean ejecutados por *root*. \
Ponemos en advertencia que algunas librerías de la aplicación no están en su última versión, por lo que la Universidad de La Rioja queda exenta de cualquier responsabilidad. \
Se recomienda utilizar, para producción, un proxy inverso como por ejemplo Apache o Nginx.

## Problemas comunes

A continuación se listan los problemas más comunes y sus soluciones:

### Problema 1

> No envía correos electrónicos

### Solución

Se debe debe de configurar la cuenta de correo electrónico en la ruta:
 `{BASE}/data/tomcat/webapps/ROOT/WEB-INF/classes/uapplication.properties`


### Problema 2

> Me gustaría cambiar la dirección del servidor donde se alberga SQL Server

### Solución

Hay que modificar en la base de datos, las entradas correspondientes de la tabla `esquema`
