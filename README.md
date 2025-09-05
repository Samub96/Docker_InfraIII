# Informe de Actividad

> Laboratorio: Creación de Contenedores de DOCKER

   ## Introducción

En el presente informe se documenta la implementación y despliegue de distintos contenedores utilizando Docker. Se configuró una base de datos con MariaDB, garantizando la persistencia de los datos; un contenedor con un servidor Apache para servir páginas web básicas; y finalmente la publicación de estas imágenes en un repositorio público (DockerHub, Quay, etc.).
   ## Objetivos

      - Crear un contenedor con una base de datos de mariaDB 
      - Desplegar un contenedor con un webserver apache 
      - Publicacion del contenedor en cualquier repositorio

   ## Desarrollo de la Actividad

   ### Estructura de los directorios

```

├── 📁 src/
│   ├── 📁 docker/
│   │   ├── 📁 db/
│   │   │   ├── 🐳 dockerfile
│   │   │   └── 🗄️ init.sql
│   │   └── 📁 web/
|   |       ├── 🌐 index.html
│   │       └── 🐳 dockerfile
│   └── 📁 pics/  <-- Fotos de ejecucion -->
└── 📖 README.md

```

### Creacion del contenedor web apache 
```
└── 📁 web/
    └── 🐳 dockerfile
 ```

### Creacion del contenedor MariaDB

Especificaciones del contenedor 

> - Nombre del contenedor: mysql-icesi
>-  Usuario MySQL: (letra de su primer nombre y su apellido) ej, mcastillo
>-  Password MySQL: mysql277
>- Database: Market
>- MySQL root password: icesi2023
>- Tabla: products
>- Agregue los siguientes campos a la tabla products: id int(12), name
varchar(255), code varchar(255), Primary Key id.
h. Inserte 4 filas de información en la tabla. 

```
├── 📁 db/
│   ├── 🐳 dockerfile
│   └── 🗄️ init.sql
|
```
Se utilizó el archivo `.sql` para configurar la base de datos con las caracteristicas dichas ya que asi podemos asegurar que se levantó correctamente la DB
#### Construccion de la imagen 
```
docker build -t mysql-icesi-img .
```

![db](/src/pics/Install_DB_WEB.png)

#### Ejecucion de la DB
```
docker run -d \
  --name mysql-icesi \
  -p 3306:3306 \
  -v mysql_data:/var/lib/mysql \
  mysql-icesi-img
  ```

  >- docker run
Inicia un nuevo contenedor basado en una imagen.

>- -d
Lo ejecuta en modo "detached" (en segundo plano). Así no bloquea la terminal.

>- --name mysql-icesi
Le da un nombre al contenedor: mysql-icesi.
→ Esto facilita gestionarlo sin usar el ID largo del contenedor.

>- -p 3306:3306
Hace un mapeo de puertos:
 El puerto 3306 del host (tu máquina) se conecta al puerto 3306 del contenedor.
→ Es el puerto estándar de MySQL, así puedes conectarte desde fuera del contenedor .

>- -v mysql_data:/var/lib/mysql
Monta un volumen persistente:
 mysql_data es el volumen en tu host (Docker lo administra).

>- /var/lib/mysql es la carpeta dentro del contenedor donde MySQL guarda la base de datos.
→ Garantiza que los datos no se pierdan si borras o reinicias el contenedor.

>- mysql-icesi-img
Es la imagen Docker a partir de la cual se crea el contenedor.
→ Aquí usas una imagen personalizada llamada mysql-icesi-img.

### Creacion del contenedor web

```
📁 web/
|   ├── 🐳 dockerfile
|   └── 🌐 index.html
```
#### Construccion de la imagen 
```
docker build -t apache-web .
```
![web](/src/pics/Install_DB_WEB.png)

#### Ejecucion del web apache
```
docker run -d \
  --name apache-container \
  -p 8080:80 \
  apache-web
```
>- docker run
Crea y arranca un contenedor.

>- -d
Lo ejecuta en segundo plano (detached).

>- --name apache-container
Le asigna el nombre apache-container al contenedor, para gestionarlo fácilmente.

>- -p 8080:80
Hace un mapeo de puertos:
Puerto 8080 en tu máquina (host).
Puerto 80 en el contenedor (donde Apache escucha por defecto).
→ Así puedes entrar a http://localhost:8080 y ver lo que sirve Apache.

>- apache-web
Es la imagen que se usa para crear el contenedor, en este caso una personalizada llamada apache-web.
## Resultados

 ### Contenedores desplegados 

 ![dockerps](/src/pics/dockerps.png)

### Web desplegado
![web](/src/pics/webdespl.png)

## SUbir a dockerhub
![docker](/src/pics/dockerhub.png)
![webs](/src/pics/dockerdespl.png)

## Conclusiones
   - Docker facilita la creación y despliegue de servicios portables y replicables.

- El uso de volúmenes garantiza la persistencia de datos en bases de datos.

- Separar los servicios en distintos contenedores (BD y Web) permite mayor escalabilidad y mantenimiento.

- Publicar las imágenes en un repositorio público permite colaboración y reutilización del trabajo.
   ## 👨‍💻 Autor 
**SAMUEL BARONA - Estudiante ingenieria Telematica**