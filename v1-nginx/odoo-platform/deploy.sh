#!/bin/bash

CLIENT=$1
DOMAIN=$2
DB_PASS="odoo_${CLIENT}_pass"

if [ -z "$CLIENT" ] || [ -z "$DOMAIN" ]; then
  echo "Usage: ./deploy.sh client1 client1.domain.com"
  exit 1
fi

echo "Deploying $CLIENT on $DOMAIN..."

mkdir -p clients/$CLIENT

export CLIENT_NAME=$CLIENT
export DOMAIN=$DOMAIN
export DB_PASSWORD=$DB_PASS

envsubst < templates/docker-compose.yml > clients/$CLIENT/docker-compose.yml

cd clients/$CLIENT

docker compose up -d

echo "✅ $CLIENT deployed successfully!"
