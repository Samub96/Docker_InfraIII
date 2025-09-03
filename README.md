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
#### Construccion de la imagen 
```
docker build -t mysql-icesi-img .
```
### Creacion del contenedor web

```
📁 web/
|   ├── 🐳 dockerfile
|   └── 🌐 index.html
```

## Resultados


## Conclusiones
   - Docker facilita la creación y despliegue de servicios portables y replicables.

- El uso de volúmenes garantiza la persistencia de datos en bases de datos.

- Separar los servicios en distintos contenedores (BD y Web) permite mayor escalabilidad y mantenimiento.

- Publicar las imágenes en un repositorio público permite colaboración y reutilización del trabajo.
   ## 👨‍💻 Autor 
**SAMUEL BARONA - Estudiante ingenieria Telematica**