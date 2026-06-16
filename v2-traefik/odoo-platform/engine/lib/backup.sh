backup_client() {
    CLIENT=$1
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)

    BACKUP_DIR="/opt/odoo-platform/backups/$CLIENT/$TIMESTAMP"
    mkdir -p $BACKUP_DIR/db
    mkdir -p $BACKUP_DIR/config

    echo "📦 Starting backup for $CLIENT..."

    # Get DB container name
    DB_CONTAINER=$(docker ps --filter "name=$CLIENT-db" --format "{{.Names}}")

    if [ -z "$DB_CONTAINER" ]; then
        echo "❌ DB container not found"
        return 1
    fi

    # Backup PostgreSQL
    docker exec $DB_CONTAINER pg_dumpall -U odoo > $BACKUP_DIR/db/db.sql

    # Backup docker compose
    cp /opt/odoo-platform/clients/$CLIENT/docker-compose.yml $BACKUP_DIR/config/

    echo "✔ Backup completed for $CLIENT"
    echo "📁 Stored in $BACKUP_DIR"
}
