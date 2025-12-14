DATA=$(date +%Y-%m-%d_%H-%M-%S)
DESTINO=/home/victor/redisscr/backup/$DATA

mkdir -p "$DESTINO"

cp /var/lib/redis/dump.rdb "$DESTINO/"
cp /var/lib/redis/appendonly.aof "$DESTINO/" 2>/dev/null

echo "Backup feito em: $DESTINO"