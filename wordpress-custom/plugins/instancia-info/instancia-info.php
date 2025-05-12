<?php

/**
 * Plugin Name: Información de Instancia
 * Description: Muestra información sobre la instancia de WordPress que maneja cada solicitud.
 * Version: 1.0.0
 * Author: Diego Plenco
 */

function instancia_info_cabecera()
{
  $instance_id = getenv('INSTANCE_ID');
  if ($instance_id) {
    header('X-Instancia-WordPress: ' . $instance_id);
  } else {
    header('X-Instancia-WordPress: Desconocida');
  }
}
add_action('send_headers', 'instancia_info_cabecera');

function instancia_info_contenido()
{
  $instance_id = getenv('INSTANCE_ID');
  if ($instance_id) {
    echo '<p>Instancia de WordPress: ' . esc_html($instance_id) . '</p>';
  } else {
    echo '<p>Instancia de WordPress: Desconocida</p>';
  }
}
add_action('wp_footer', 'instancia_info_contenido');
