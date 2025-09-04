# n8n - Automatización de Workflows

Este proyecto configura n8n con PostgreSQL usando Docker Compose, con permisos correctamente configurados para evitar errores de acceso.

## 🚀 Configuración Inicial

### 1. Configurar variables de entorno
```bash
cp .env.example .env
# Edita el archivo .env con tus valores específicos
```

### 2. Configurar permisos automáticamente
```bash
./setup-permissions.sh
```

### 3. Iniciar los servicios
```bash
docker-compose up -d
```

## 📋 Características

- **n8n**: Herramienta de automatización de workflows
- **PostgreSQL**: Base de datos para persistencia
- **Permisos configurados**: Evita errores EACCES automáticamente
- **Usuario no-root**: Ejecuta con usuario 1000:1000 para seguridad

## 🔧 Comandos Útiles

```bash
# Ver logs de n8n
docker-compose logs -f n8n

# Ver logs de PostgreSQL
docker-compose logs -f postgres

# Reiniciar servicios
docker-compose restart

# Detener servicios
docker-compose down

# Detener y eliminar volúmenes
docker-compose down -v
```

## 🔒 Seguridad

Los permisos se configuran automáticamente:
- `n8n_data/`: Propiedad de usuario 1000:1000
- `postgres_data/`: Propiedad de usuario 999:999
- Archivos de configuración con permisos 600

## 📚 Variables de Entorno

| Variable | Descripción | Ejemplo |
|----------|-------------|---------|
| `TIMEZONE` | Zona horaria | `America/Argentina/Buenos_Aires` |
| `DB_POSTGRES_*` | Configuración de PostgreSQL | Ver `.env.example` |
| `N8N_ENCRYPTION_KEY` | Clave de encriptación de n8n | Generar aleatoria |
| `N8N_HOST` | Host de n8n | `localhost` |
| `WEBHOOK_TUNNEL_URL` | URL para webhooks | Tu URL pública |

## ⚡ Acceso

- **n8n Web UI**: http://localhost:5678
- **PostgreSQL**: localhost:5432

## 🛠️ Solución de Problemas

Si encuentras errores de permisos, ejecuta:
```bash
./setup-permissions.sh
docker-compose restart
```
