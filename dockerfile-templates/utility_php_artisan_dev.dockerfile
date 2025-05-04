# Laravel Artisan Utility Container Dockerfile Template (PHP - Development Use)

# Use official PHP image with FPM and Alpine for smaller size
FROM php:8.2.4-fpm-alpine

# Set working directory where Laravel app will reside
WORKDIR /var/www/html

# Copy source code into the container
COPY src .

# Install necessary PHP extensions for Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Create a non-root user to avoid permission issues with bind mounts
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

# Set ownership of the app directory to the laravel user
RUN chown -R laravel:laravel /var/www/html

USER laravel

#####################################################################
# 📚 Usage examples:
#
# 1️⃣ Build the image:
# docker build -t myartisan .
#
# 2️⃣ Run artisan commands directly (assuming Laravel app exists in ./src):
# docker run -it -v /path/to/your/project:/var/www/html myartisan migrate
#
# 3️⃣ Using docker-compose (recommended):
# version: "3.8"
# services:
#   artisan:
#     build:
#       context: .
#       dockerfile: dockerfiles/php.dockerfile
#     volumes:
#       - ./src:/var/www/html
#     entrypoint: [ "php", "/var/www/html/artisan" ]
#
# Run commands:
# docker-compose run --rm artisan migrate
# docker-compose run --rm artisan db:seed
#####################################################################
