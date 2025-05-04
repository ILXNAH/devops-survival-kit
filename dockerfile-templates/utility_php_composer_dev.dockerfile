# Composer Utility Container Dockerfile Template (PHP - Development Use)

# Use the official Composer image
FROM composer:latest

# Create a non-root user to avoid permission issues on bind mounts
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

USER laravel

# Set working directory where Laravel or other PHP projects will be created
WORKDIR /var/www/html

# Set entrypoint to always run composer with --ignore-platform-reqs
ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]

#####################################################################
# 📚 Usage examples:
#
# 1️⃣ Build the image (from the folder containing this Dockerfile):
# docker build -t mycomposer .
#
# 2️⃣ Run Composer commands inside the container (with bind mount):
# docker run -it -v /path/to/your/project:/var/www/html mycomposer create-project laravel/laravel . --prefer-dist
#
# Example to install additional packages:
# docker run -it -v /path/to/your/project:/var/www/html mycomposer require vendor/package_name (e.g., laravel/sanctum)
#
# 3️⃣ Using docker-compose:
# version: "3.8"
# services:
#   composer:
#     build:
#       context: .
#       dockerfile: dockerfiles/composer.dockerfile
#     stdin_open: true
#     tty: true
#     volumes:
#       - ./your-project:/var/www/html
#
# Run command:
# docker-compose run --rm composer create-project laravel/laravel . --prefer-dist
#####################################################################
