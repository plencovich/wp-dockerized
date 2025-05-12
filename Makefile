# Comandos Docker Compose
DOCKER_COMPOSE := docker compose --env-file .env

# Targets
help:
	@echo "Makefile para administrar el entorno WordPress con Docker Compose"
	@echo ""
	@echo "Uso:"
	@echo "  make build      Construye las imágenes Docker"
	@echo "  make up         Inicia los contenedores en segundo plano"
	@echo "  make down       Detiene los contenedores"
	@echo "  make ps         Lista el estado de los contenedores"
	@echo "  make clean      Detiene y elimina contenedores y volúmenes"
	@echo "  make init       Construye e inicia los contenedores (como init.sh)"
	@echo "  make logs       Muestra los logs de los Contenedores"

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up nginx app1 app2 redis elasticsearch minio -d 

down:
	$(DOCKER_COMPOSE) down

ps:
	$(DOCKER_COMPOSE) ps

clean: down
	$(DOCKER_COMPOSE) down -v

db-up:
	$(DOCKER_COMPOSE) up -d db	

db-down:
	$(DOCKER_COMPOSE) down db	

db-restart:
	$(DOCKER_COMPOSE) restart db

init: build up
	@echo " Estado de los contenedores:"
	$(DOCKER_COMPOSE) ps
	@echo ""
	@echo "✅ Entorno iniciado correctamente."
	@echo " Accedé a: http://localhost"
	@echo " Credenciales WP admin: usuario '$(WP_ADMIN_USER)' / contraseña '$(WP_ADMIN_PASSWORD)'"

logs:
	$(DOCKER_COMPOSE) logs -f
