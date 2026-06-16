#!/bin/bash

set -e

COMMAND=$1
CLIENT=$2
DOMAIN=$3

BASE_DIR="/opt/odoo-platform/engine/lib"

source $BASE_DIR/logger.sh
source $BASE_DIR/validate.sh
source $BASE_DIR/network.sh
source $BASE_DIR/compose.sh
source $BASE_DIR/deploy.sh
source $BASE_DIR/rollback.sh

log "INFO" "Starting NX Engine v2..."

if [ "$COMMAND" == "deploy" ]; then
    validate_input "$CLIENT" "$DOMAIN" || exit 1
    create_network
    generate_compose "$CLIENT" "$DOMAIN"
    deploy_client "$CLIENT"
fi

if [ "$COMMAND" == "backup" ]; then
    backup_client "$CLIENT"
fi

if [ "$COMMAND" == "restore" ]; then
    restore_client "$CLIENT" "$DOMAIN"
fi

log "SUCCESS" "Done."
