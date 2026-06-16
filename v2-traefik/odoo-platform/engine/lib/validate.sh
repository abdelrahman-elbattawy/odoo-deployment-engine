validate_input() {
    CLIENT=$1
    DOMAIN=$2

    if [ -z "$CLIENT" ] || [ -z "$DOMAIN" ]; then
        echo "❌ Missing parameters"
        return 1
    fi

    if [ -d "/opt/odoo-platform/clients/$CLIENT" ]; then
        echo "❌ Client already exists"
        return 1
    fi

    echo "✔ Validation passed"
}
