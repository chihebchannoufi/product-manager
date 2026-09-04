FROM php:8.2-cli-alpine

# 1. Installation des dépendances système, Node.js, npm, SQLite et outils de compilation
RUN apk add --no-cache \
    nodejs \
    npm \
    sqlite \
    sqlite-dev \
    libpng-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    oniguruma-dev

# 2. Extensions PHP requises pour Laravel 12 & SQLite
RUN docker-php-ext-install pdo pdo_sqlite mbstring bcmath

# 3. Récupération de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# 4. Copie globale des sources
COPY . .

# 5. Installation des dépendances PHP (génère vendor/ et Ziggy)
RUN composer install --no-dev --optimize-autoloader

# 6. Installation des dépendances JS et compilation des assets Vue 3 / Inertia
RUN npm ci
RUN npm run build

# 7. Préparation de la base de données SQLite et des permissions
RUN touch database/database.sqlite
RUN chmod -R 777 storage bootstrap/cache database

EXPOSE 10000

# 8. Exécution des migrations et lancement du serveur
CMD php artisan migrate --force && php artisan config:cache && php artisan route:cache && php artisan serve --host=0.0.0.0 --port=10000
