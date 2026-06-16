rollback() {
    CLIENT=$1

    echo "⚠ Rolling back $CLIENT..."

    cd /opt/odoo-platform/clients/$CLIENT || exit 0

    docker compose down

    echo "✔ Rollback completed"
}
