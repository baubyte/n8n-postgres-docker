.PHONY: setup start stop restart logs clean help

# Configuración inicial completa
setup:
	@echo "🔧 Configurando n8n..."
	@if [ ! -f .env ]; then cp .env.example .env && echo "📝 Archivo .env creado. ¡Edítalo con tus valores!"; fi
	@./setup-permissions.sh

# Iniciar servicios
start: setup
	@echo "🚀 Iniciando servicios n8n..."
	docker-compose up -d
	@echo "✅ n8n disponible en: $$(grep -E '^N8N_HOST=' .env | cut -d '=' -f2 2>/dev/null || echo localhost):$$(grep -E '^N8N_PORT=' .env | cut -d '=' -f2 2>/dev/null || echo 5678)"

# Detener servicios
stop:
	@echo "🛑 Deteniendo servicios..."
	docker-compose down

# Reiniciar servicios
restart:
	@echo "🔄 Reiniciando servicios..."
	docker-compose restart

# Ver logs
logs:
	docker-compose logs -f

# Ver logs solo de n8n
logs-n8n:
	docker-compose logs -f n8n

# Ver logs solo de postgres
logs-postgres:
	docker-compose logs -f postgres

# Limpiar todo (incluyendo volúmenes)
clean:
	@echo "🧹 Limpiando servicios y volúmenes..."
	docker-compose down -v
	@echo "⚠️  Se han eliminado todos los datos!"

# Mostrar ayuda
help:
	@echo "📖 Comandos disponibles:"
	@echo "  make setup      - Configuración inicial (permisos + .env)"
	@echo "  make start      - Iniciar servicios n8n"
	@echo "  make stop       - Detener servicios"
	@echo "  make restart    - Reiniciar servicios"
	@echo "  make logs       - Ver logs de todos los servicios"
	@echo "  make logs-n8n   - Ver logs solo de n8n"
	@echo "  make logs-postgres - Ver logs solo de PostgreSQL"
	@echo "  make clean      - Limpiar todo (¡elimina datos!)"
	@echo "  make help       - Mostrar esta ayuda"