deploy_client() {
    CLIENT=$1

    cd /opt/odoo-platform/clients/$CLIENT

    docker compose -p $CLIENT up -d

    if [ $? -ne 0 ]; then
        echo "❌ Deployment failed"
        rollback $CLIENT
        exit 1
    fi

    echo "✔ Client deployed successfully"
}
