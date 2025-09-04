#!/bin/bash

# Script para configurar permisos correctos para n8n
echo "🔧 Configurando permisos para n8n..."

# Crear directorio n8n_data si no existe
if [ ! -d "n8n_data" ]; then
    echo "📁 Creando directorio n8n_data..."
    mkdir -p n8n_data
fi

# Crear directorio postgres_data si no existe
if [ ! -d "postgres_data" ]; then
    echo "📁 Creando directorio postgres_data..."
    mkdir -p postgres_data
fi

# Establecer permisos correctos para n8n_data
echo "🔒 Configurando permisos para n8n_data..."
sudo chown -R 1000:1000 n8n_data/
sudo chmod 755 n8n_data/

# Si existe el archivo de configuración, configurar permisos seguros
if [ -f "n8n_data/config" ]; then
    echo "⚙️ Configurando permisos del archivo de configuración..."
    sudo chmod 600 n8n_data/config
fi

# Establecer permisos correctos para postgres_data
echo "🗄️ Configurando permisos para postgres_data..."
sudo chown -R 999:999 postgres_data/

echo "✅ ¡Permisos configurados correctamente!"
echo ""
echo "Ahora puedes ejecutar: docker-compose up -d"
