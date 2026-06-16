#!/bin/bash

CLIENT=$1

cd clients/$CLIENT

docker compose down -v

cd ../..

rm -rf clients/$CLIENT

echo "❌ $CLIENT removed"
