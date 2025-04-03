#!/bin/bash

echo "🛠️  Iniciando entorno WordPress con Docker..."

docker-compose build

docker-compose up -d

echo "📋 Estado de los contenedores:"
docker-compose ps

echo ""
echo "✅ Entorno iniciado correctamente."
echo "🌐 Accedé a: http://localhost"
echo "🧪 Credenciales WP admin: usuario 'admin' / contraseña 'admin'"
