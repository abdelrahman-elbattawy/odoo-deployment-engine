create_network() {
    docker network inspect odoo_net >/dev/null 2>&1 || \
    docker network create odoo_net

    echo "✔ Network ready"
}
