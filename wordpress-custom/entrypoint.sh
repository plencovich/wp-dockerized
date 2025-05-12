#!/bin/bash

echo "Verificando /var/www/html..."
if [ ! -f /var/www/html/index.php ]; then
  echo "Directorio /var/www/html vacío. Copiando WordPress core..."
  cp -R /usr/src/wordpress/. /var/www/html/
  chown -R www-data:www-data /var/www/html
fi

echo "Esperando a que la base de datos esté lista..."
until mysqladmin ping -h "$WORDPRESS_DB_HOST" --silent; do
  echo "Esperando DB..."
  sleep 5
done

if [ ! -f /var/www/html/wp-config.php ]; then
  echo "wp-config.php no encontrado. Creando wp-config.php..."
  wp config create \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --dbhost="$WORDPRESS_DB_HOST" \
    --allow-root
fi

if ! wp core is-installed --allow-root; then
  echo "Instalando WordPress..."
  wp core install \
    --url="$WP_SITE_URL" \
    --title="$WP_SITE_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --allow-root
fi

# Mover plugin InstanciaInfo al volumen compartido si no existe
if [ ! -d /var/www/html/wp-content/plugins/instancia-info ]; then
  echo "Moviendo plugin instancia-info al volumen compartido..."
  mv /tmp/plugins/instancia-info /var/www/html/wp-content/plugins
  wp plugin activate instancia-info --allow-root
fi

echo "Corrigiendo permisos en /var/www/html..."
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "Iniciando PHP-FPM..."
exec /usr/local/bin/docker-entrypoint.sh php-fpm
