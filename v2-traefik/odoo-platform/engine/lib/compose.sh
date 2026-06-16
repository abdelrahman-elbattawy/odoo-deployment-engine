generate_compose() {
    CLIENT=$1
    DOMAIN=$2

    CLIENT_DIR="/opt/odoo-platform/clients/$CLIENT"
    TEMPLATE="/opt/odoo-platform/engine/templates/docker-compose.template.yml"
    GLOBAL_ENV="/opt/odoo-platform/.env"
    CLIENT_ENV="$CLIENT_DIR/.env"

    echo "📦 Generating compose for $CLIENT..."

    mkdir -p "$CLIENT_DIR"

    # ===== 1. Load env safely into isolated scope =====
    TMP_ENV=$(mktemp)

    # Merge GLOBAL + CLIENT safely (CLIENT overrides)
    if [ -f "$GLOBAL_ENV" ]; then
        cat "$GLOBAL_ENV" > "$TMP_ENV"
    fi

    if [ -f "$CLIENT_ENV" ]; then
        cat "$CLIENT_ENV" >> "$TMP_ENV"
    fi

    # Export only for envsubst
    set -a
    source "$TMP_ENV"
    set +a

    # ===== 2. Inject runtime vars =====
    export CLIENT_NAME="$CLIENT"
    export DOMAIN="$DOMAIN"

    # ===== 3. Validate required vars =====
    REQUIRED_VARS=(
        "POSTGRES_USER"
        "POSTGRES_PASSWORD"
        "ODOO_DB_USER"
        "ODOO_DB_PASSWORD"
        "CLIENT_NAME"
        "DOMAIN"
    )

    for var in "${REQUIRED_VARS[@]}"; do
        if [ -z "${!var}" ]; then
            echo "❌ Missing required variable: $var"
            exit 1
        fi
    done

    # ===== 4. Validate template =====
    if [ ! -f "$TEMPLATE" ]; then
        echo "❌ Template not found: $TEMPLATE"
        exit 1
    fi

    # ===== 5. Generate compose safely =====
    envsubst < "$TEMPLATE" > "$CLIENT_DIR/docker-compose.yml"

    echo "✔ Compose generated for $CLIENT"
}
