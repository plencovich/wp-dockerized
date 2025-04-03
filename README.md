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
