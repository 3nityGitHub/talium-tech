#!/bin/bash
ENV=$1

if [ -z "$ENV" ]; then
    echo "ERROR: No environment specified"
    echo "Usage: ./strings-check.sh production"
    exit 1
fi

if [ "$ENV" = "production" ]; then
    echo "Deploying to PRODUCTION - proceed with caution"
elif [ "$ENV" = "staging" ]; then
    echo "Deploying to STAGING"
elif [ "$ENV" = "dev" ]; then
    echo "Deploying to DEV"
else
    echo "ERROR: Unknown environment: $ENV"
    exit 1
fi
