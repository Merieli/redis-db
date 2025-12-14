#!/bin/bash

# Verifica se o usuário passou o nome da pasta
if [ -z "$1" ]; then
  echo "Uso: ./restaurar_backup.sh NOME_DA_PASTA (ex: 2025-04-15_01-06-40)"
  exit 1
fi

BACKUP_DIR="/home/victor/redisscr/backup/$1"

# Verifica se a pasta existe
if [ ! -d "$BACKUP_DIR" ]; then
  echo "Erro: Pasta de backup '$BACKUP_DIR' não encontrada."
  exit 1
fi

echo "Parando o Redis..."
sudo systemctl stop redis

echo "Removendo arquivos atuais de persistência..."
sudo rm -f /var/lib/redis/dump.rdb /var/lib/redis/appendonly.aof

echo "Restaurando arquivos do backup: $BACKUP_DIR"
sudo cp "$BACKUP_DIR/dump.rdb" /var/lib/redis/
sudo cp "$BACKUP_DIR/appendonly.aof" /var/lib/redis/ 2>/dev/null || echo "Arquivo AOF não encontrado, apenas RDB será restaurado."

echo "Corrigindo permissões dos arquivos..."
sudo chown redis:redis /var/lib/redis/dump.rdb /var/lib/redis/appendonly.aof 2>/dev/null

echo "Iniciando o Redis..."
sudo systemctl start redis

echo "Restauração concluída com sucesso!"
