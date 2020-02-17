#!/usr/bin/env bash

set -e

rm -rf app/cache/*
chmod -R 777 app/cache

php app/bin/addRoutes

composer install --no-dev --optimize-autoloader --classmap-authoritative --ansi

if [ -L "app/translations" ]; then
    rm "app/translations"
fi
ln -s ../vendor/phpbenchmarks/ubiquity-common/translations app/translations
