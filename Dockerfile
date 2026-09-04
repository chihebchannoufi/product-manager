# 1. Build des assets Vue 3 / Inertia avec Node.js
FROM node:20-alpine AS frontend
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# 2. Configuration de l'environnement PHP 8.2
FROM php:8.2-cli-alpine

RUN apk add --no-cache \
    sqlite \
    sqlite-dev \
    libpng-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    oniguruma-dev

# Extensions PHP indispensables pour Laravel 12 & SQLite
RUN docker-php-ext-install pdo pdo_sqlite mbstring bcmath

# Récupération de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copie du code source
COPY . .
COPY --from=frontend /app/public/build ./public/build

# Installation des dépendances PHP en mode production
RUN composer install --no-dev --optimize-autoloader

# Préparation de la base de données SQLite
RUN touch database/database.sqlite
RUN chmod -R 777 storage bootstrap/cache database

EXPOSE 10000

# Exécution des migrations et lancement du serveur Laravel
CMD php artisan migrate --force && php artisan config:cache && php artisan route:cache && php artisan serve --host=0.0.0.0 --port=10000
