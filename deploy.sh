#!/bin/bash

echo "Sélectionnez un pays (usa/suisse/france) :"
read country

if [ ! -f "infrastructure/env/${country}.env" ]; then
    echo "Pays non reconnu"
    exit 1
fi

echo "Déploiement pour $country..."
export COUNTRY=$country

docker-compose -f infrastructure/docker/compose.yml --env-file infrastructure/env/${country}.env up -d
