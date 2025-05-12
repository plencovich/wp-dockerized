# 🚀 WordPress Dockerized Dev Stack

Este proyecto contiene un entorno completo para desarrollar y probar WordPress con alta disponibilidad, balanceo de carga y servicios externos usando Docker.

## 📦 Servicios incluidos

| Servicio       | Función                                          |
|----------------|--------------------------------------------------|
| Nginx          | Balanceador de carga para WordPress              |
| App 1 / App 2  | Instancias de WordPress (PHP-FPM)                |
| MySQL          | Base de datos para WordPress                     |
| Redis          | Cache y sesiones (via plugin Redis Object Cache)|
| Elasticsearch  | Buscador vía plugin ElasticPress                 |
| MinIO          | Almacenamiento compartido (compatible con S3)   |

## ▶️ Cómo iniciar

```bash
./init.sh
```
O ejecutar el comando `make init`

## 🌐 Acceso

- WordPress: [http://localhost](http://localhost)
- MinIO: [http://localhost:9000](http://localhost:9000)
  - Usuario: `minio`
  - Contraseña: `minio123`

## 🔐 Credenciales WordPress

- Usuario: `admin`
- Contraseña: `admin`

## 📂 Estructura

wordpress-docker/
├── docker-compose.yml
├── init.sh
├── nginx/
│   └── conf.d/default.conf
├── wordpress-custom/
│   ├── Dockerfile
│   └── entrypoint.sh

## ⚙️ Configuración

- `make build` Construye las imágenes Docker.
- `make up` Inicia los contenedores en segundo plano.
- `make down` Detiene los contenedores.
- `make ps` Lista el estado de los contenedores.
- `make clean` Detiene y elimina contenedores y volúmenes.
- `make init` Construye e inicia los contenedores ( igual que `init.sh`)
- `make logs` Muestra los logs de los contenedores.
- `make db-up` Inicia solo el contenedor de la base de datos.
- `make db-down` Detiene solo el contenedor de la base de datos.
- `make db-restart` Reinicia solo el contenedor de la base de datos.
- `make help` Muestra esta ayuda.
