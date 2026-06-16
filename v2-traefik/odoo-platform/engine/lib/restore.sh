restore_client() {
    CLIENT=$1
    BACKUP_PATH=$2

    echo "♻ Restoring $CLIENT from $BACKUP_PATH..."

    DB_CONTAINER=$(docker ps --filter "name=$CLIENT-db" --format "{{.Names}}")

    if [ -z "$DB_CONTAINER" ]; then
        echo "❌ DB container not found"
        return 1
    fi

    docker exec -i $DB_CONTAINER psql -U odoo < $BACKUP_PATH/db/db.sql

    echo "✔ Restore completed"
}
